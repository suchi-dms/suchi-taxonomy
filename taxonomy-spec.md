# Suchi taxonomy v1 reference

This is the reference for `suchi-taxonomy/v1`, the file format Suchi uses to
import and export a filing tree, and for how those files interact with filing
systems. Where it says **MUST**, **MUST NOT**, **SHOULD NOT** or **MAY**, that
is the contract. Everything else is advice, and I've tried to label it as advice.

It describes what Suchi actually implements. It isn't a summary of every
Johnny.Decimal convention, a release announcement, or a promise about which
Suchi version you need. If this page and the code ever disagree, the code wins.
The code lives in three places: the
[parser and validator](https://github.com/johnnybravo-xyz/suchi/tree/main/core/jd/presetfile),
the [importer](https://github.com/johnnybravo-xyz/suchi/tree/main/core/jd/importer)
and the [systems package](https://github.com/johnnybravo-xyz/suchi/tree/main/core/jd/systems).

Nobody has reviewed these examples or this reference professionally. They are
not legal advice, compliance checklists or a guarantee that anything gets
classified correctly. The collection is CC0-1.0; linked sources keep their own
terms. Johnny.Decimal is a trademark of Coruscade Pty Ltd. Suchi is independent,
and not affiliated with or endorsed by Johnny.Decimal.

## 1. What a file is

One file describes one filing system's complete proposed tree: its areas, its
categories and their descriptions. That's it. A file is not a patch, a document
inventory, an access-control list, an overlay that inherits from another file,
or a backup you can restore from. When you apply it, Suchi **merges** it into
what you already have. It never wipes the destination first.

A file carries no automations. Matching rules are yours to write in Suchi's
Automations page, in your own words and your own language. Suchi 0.2 exports put
category `keywords` and `seeds.automations` in the file; section 2.5 covers
what happens to those today.

A few identities look alike and mean different things, so keep them apart:

| Field or identity | What it means |
| --- | --- |
| `format` | The exact schema label `suchi-taxonomy/v1`. Not a Suchi release number. |
| `id` and `version` | Who authored this content and which revision it is. Not a system code and not a document ID. |
| `system` (optional) | The permanent filing-system code, for example `S01`. |
| `name` | The tree's human name. It also becomes the system's display name the first time the system is adopted or created. |
| `documents.id` (runtime) | Suchi's own installation-wide document number. Suchi allocates it; you never write it in a file. |

My advice: once a category code means something inside an `id`, keep it
meaning that, and bump `version` when you edit the content. The importer doesn't
enforce either. It won't stop a revision going backwards, and there is no
managed upgrade path from one template revision to the next.

## 2. Formats and what gets rejected

A file MUST be TOML or HuML, MUST be nonempty valid UTF-8, and MUST be at most
**1,048,576 bytes**. Suchi uses JSON tags internally, but that doesn't make JSON
or YAML authoring formats. The parser takes a format of `toml` or `huml`; if you
leave it out you get TOML. It never sniffs content to guess. When the format
comes from a file extension, `.toml` and `.huml` are matched case-insensitively.

HuML files may start with a `%HUML v0.2.0` version line, and Suchi's own HuML
exports always do. With that line present, a file written for a different HuML
version is rejected rather than read with the wrong rules. The examples in this
repository all carry it.

The parser is strict on purpose. It MUST reject unknown fields at every level,
duplicate keys, nulls, wrong types (a string where a list belongs, and so on),
integer overflow and broken structure. It doesn't convert `"1"` into `1` or a
number into a string. Integer fields take whole numbers, not floats. `version`
must fit a signed 64-bit integer; there's no other ceiling on it.

Text limits below count **Unicode code points**, not bytes and not grapheme
clusters. "Nonblank" means something other than whitespace is left after the
whitespace check. Leading and trailing whitespace is generally kept as you wrote
it, not trimmed for you. Codes are stricter: no surrounding whitespace at all.
The 1 MiB file limit applies on top of everything.

### 2.1 Top-level fields

This is the complete list. Anything else is an error, apart from the two old
fields in 2.5.

| Field | Type and rule |
| --- | --- |
| `format` | Required string, exactly `suchi-taxonomy/v1`. |
| `system` | Optional string. If present it MUST be nonempty and match `^[A-Z][0-9]{2}$`. |
| `id` | Required string matching `^[a-z0-9][a-z0-9_-]*$`. |
| `version` | Required positive integer. |
| `name` | Required nonblank string, at most 80 code points. |
| `market`, `language` | Required nonblank strings. |
| `maintainer`, `license` | Optional strings. |
| `story` | Required nonblank string, at most 500 code points. |
| `flat` | Optional boolean, false by default. Authoring shorthand only; see 2.3. |
| `areas` | Required list in ordinary tree form. Forbidden when `flat = true`. |
| `categories` | Forbidden in ordinary tree form. Required list when `flat = true`. |

`id`, `market`, `language`, `maintainer` and `license` have no length limit of
their own beyond the file limit. Suchi doesn't check `market` or `language`
against ISO or BCP 47 lists, doesn't check `license` against SPDX, and doesn't
care whether `maintainer` is a URL or an email address. Following those
conventions is still a good idea.

There is no top-level `systems`, `inbox`, document list, document ID, access
grant, secret or free-form extension field. Don't confuse the top-level `system`
string with the `system` boolean you may see on categories at runtime. That one
marks generated, protected rows, and you can't author it.

### 2.2 Areas and categories

An area has exactly three fields: `code` (integer), `name` (nonblank, at most 80
code points) and `categories` (a list, which may be empty). Areas have no
description. `areas = []` is a valid, deliberately blank tree.

You get at most eight areas, each with a distinct code from
**10, 20, 30, 50, 60, 70, 80, 90**. In area `A`, a category code MUST be between
`A+1` and `A+9`. Category codes MUST be unique across the whole file; names don't
have to be. So a file holds at most nine categories per area and 72 in total.
There is no separate category-count setting.

| Category field | Type and rule |
| --- | --- |
| `code` | Required integer in tree form. Flat shorthand can omit it; see 2.3. |
| `name` | Required nonblank string, at most 80 code points. |
| `description` | Optional string, at most 240 code points. |

You MUST NOT declare anything in `00–09` or `40–49`, a category code ending in
zero, an Inbox pointer, or a protected flag on a category. After the raw file
passes validation, Suchi appends `40 System / 49 Inbox` itself and points the
Inbox at 49. That generated area doesn't count towards your eight. Old databases
may still have rows in those ranges; that doesn't mean the file format accepts
them.

### 2.3 Flat shorthand

Set `flat = true` and you can skip areas. Top-level `categories` MUST then hold
1 to 9 entries, and `areas` MUST be absent, even as an empty list. Entries get
codes 11 to 19 in the order you list them. An entry MAY leave out `code`; if it
has one, it MUST be the code its position implies. Zero doesn't mean "omitted".
Reorder the list and the codes change with it.

Parsing turns this into area 10, named after the tree, plus the usual generated
System and Inbox. It does **not** switch on Suchi's runtime flat mode, which is a
separate setting that hides the JD numbering and lays documents out by
correspondent and year. Imports always install JD structure, and a new system
starts in JD mode. If you export the tree again you'll get explicit areas back,
not your original flat spelling.

### 2.4 A small complete file

This TOML proposes a tree. It says nothing about documents or who can see them.

```toml
format = "suchi-taxonomy/v1"
system = "S01"
id = "small-office"
version = 1
name = "Small office"
market = "global"
language = "en"
story = "Keep engagement letters and tax evidence in stable document-kind categories."

[[areas]]
code = 10
name = "Client records"

[[areas.categories]]
code = 11
name = "Engagement letters"

[[areas.categories]]
code = 13
name = "GST filings"
description = "Returns and acknowledgements, identified by client correspondent."
```

What Suchi ends up with. You don't write the System and Inbox lines; Suchi
adds them:

```text
S01 Small office
  10-19 Client records
    11 Engagement letters
    13 GST filings
  40-49 System                 generated
    49 Inbox                  generated
```

### 2.5 Files from older Suchi versions

Before 0.3.0, filing trees could carry category `keywords` and a top-level
`seeds` object with `automations`. Suchi 0.3.0 dropped both. The parser now
removes them before it validates anything else, so an old export still imports
its tree, and the keywords and rules are quietly left behind. Nothing you have
in Automations changes.

New files SHOULD NOT carry these fields. Because they're dropped before
validation, the parser doesn't check them, and a file that relies on them will
look fine while doing nothing. None of the examples here include them.

## 3. Normalization and what it won't fix for you

Suchi validates the file exactly as written before it expands flat shorthand or
adds the Inbox. Serializing does the reverse: it undoes the normalization it
knows about, leaves out the generated Inbox, and reparses its own output to
check it. A normalized tree handed to import or export MUST contain exactly the
generated `40 System / 49 Inbox` and nothing more there: no custom Inbox
description, no renamed System. Suchi rejects those rather than quietly dropping
them.

TOML and HuML describe the same contract. They don't produce the same bytes.
Comments, formatting, key order and optional directives can change when you
convert between them. List order can matter, especially for flat codes.
Two files that mean the same thing can have different SHA-256 hashes, and v1 has
no canonical byte form to hash instead. Compare files by parsing them.

Some inputs that fail:

- `system = ""`, `system = "s01"`, `system = "AUD"`, `system = " S01"`, or a
  numeric system.
- A quoted version, a float category code, a duplicate key, or an unknown field
  anywhere.
- An authored area 40, category 10, `inbox`, `categories` with `flat = false`,
  or any `areas` key with `flat = true`.
- A category outside its area's decade, a repeated category code, or a name
  that's too long.

An error is an error. Suchi won't fix your casing, trim your codes, grant
access, invent hidden document IDs or silently drop data it doesn't support.

## 4. Systems, the first import, and merging

A system code MUST match `^[A-Z][0-9]{2}$`, so **A00 to Z99**, including codes
ending in 00. Once a system has a code, the code never changes and is never
reused. Display names can change: nonblank UTF-8, at most 80 code points. There
is no "enable systems" setting, no way to turn them off again, and no system
delete, merge or cross-system document move in this contract.

Before you introduce systems, there is one hidden original system: internal ID
1, no code. You don't configure it and you don't see an extra address layer.
Systems appear only when you successfully apply your first **prefixed** import,
meaning a file with a top-level `system`:

| What you import, and when | What happens |
| --- | --- |
| Unprefixed file, before systems | Goes into the single archive. No system layer appears. |
| First prefixed file, ordinary destination | The original archive takes the file's code and name, and the tree is imported into it. Documents, IDs, memberships and ACLs all stay as they were. |
| First prefixed file, keep the original separate | The original archive gets a distinct code you choose with `existing_system_code` (for example `A00`) and keeps its name. The file's system is created next to it, in one atomic step. |
| Prefixed file after systems exist, known code | Merges into that system only. |
| Prefixed file after systems exist, new code | Creates that system with its generated Inbox and tree, atomically. |
| Unprefixed file after systems exist | Goes into the target you selected, or original system 1 if you didn't pick one. It never removes systems. |

`existing_system_code` is an import option, **not** a file field. It only works
on the first prefixed import, and it must differ from the incoming code. If you
name a target explicitly and the file names a system, the two MUST agree. A
file's prefix beats the browser's "current system" fallback, but it doesn't
override an explicit target in the request body that disagrees with it. A target
option on its own can't create a system from an unprefixed file. On the CLI,
`--system CODE` picks a target; without it you get the original archive, unless
the file names its own system. `--existing-system-code CODE` chooses the
keep-it-separate path on the first import.

Memberships in the original archive survive the introduction. A brand-new system
lets in only active instance admins at first; everyone else needs a direct
membership. While the original system is still hidden, new ordinary users and
demoted admins are added to it automatically. Once it has a name, that stops.
Reimporting into a system you've already named keeps your edited display name
rather than taking the file's.

### 4.1 Preview, then apply

Preview MUST NOT change anything. Apply needs the nonempty state hash from a
matching preview, and it recomputes the whole proposal inside its write
transaction. For API calls, the actor comes from authentication and is checked
again, inside that transaction, for being an active instance admin. A trusted
local CLI run is a different path from an actor named in a request body.

The hash covers the source bytes and normalized input, the destination and
first-import choice, the target's identity, provenance, members and whether it's
being created, any remaps, and the target tree. Edits in an unrelated system
don't invalidate a preview. Creating the same code somewhere else, or changing
the target, does. A stale or failed Apply MUST leave nothing half done: no
half-named or half-created system, no partly changed permissions or tree. The
destination change, the tree, last-import provenance and the jobs it needs all
commit together. Rendering files to disk happens afterwards, in the background,
so a committed job is not proof that the folders on disk have caught up.

### 4.2 How merging works

- An area code that already exists keeps its local name. A category with the
  same code **and the exact same name** keeps its row and its local description.
- If the file has a different name at a code you already use, you MUST either
  skip it or remap it to an unused code, not ending in zero, in the same decade.
  You can't remap to a code already used in the target or the incoming tree.
  Both reserved decades are off limits. A remap is never a cross-system move.
- Imports never create, change or remove automations. Your rules stay exactly
  as they were, enabled or not.

Replacing a tree outright is a narrow exception for brand-new archives, not a
general reset. It needs every one of these: no document anywhere, Trash
included, sits in an unprotected category; the target has no automations, saved
views, storage paths or email accounts; no preset has been chosen; and at most
the neutral Inbox exists. Once initial setup is finished, the original archive
can't be replaced this way. The protected Inbox row always stays.

Each system remembers the last imported ID, revision, source hash and authoring
snapshot. That's provenance, not an immutable import history, and it doesn't
promise the current tree still matches that file. Importing the same revision
and hash again is not automatically a no-op.

## 5. Filing addresses and document identity

Suchi gives every category a two-part **address**. Before you have systems it's
`AREA.AC`, for example `20.21`. Once systems exist, every system, including the
named original archive, uses `SYS.AC`, for example `S01.21`. The category code
already tells you its decade, so the area drops out as soon as the system code
is needed to tell systems apart.

The two forms are:

```text
^([0-9]0)\.([0-9]{2})$
^([A-Z][0-9]{2})\.([0-9]{2})$
```

In `AREA.AC`, the first part MUST be a decade start (`00`, `10`, … `90`) and
MUST match the category's decade: `20.21` is fine, `10.21` isn't. `40.49` is the
generated Inbox before systems exist. In `SYS.AC`, the system code follows the
same A00 to Z99 rule as files, and the area is implied.

| Address | Meaning |
| --- | --- |
| `20.21` | Category 21 in area 20–29 of the unnamed single archive. |
| `40.49` | The unnamed archive's generated Inbox. |
| `S01.13` | Category 13 in system S01. |
| `S02.13` | A different category 13, owned by system S02. |

An address points at a category, not at one document. Any number of documents
can share a `jd_address`. Each document's own number, `documents.id`, and its
numeric URL are what identify it exactly. Refiling a document changes its
address and leaves its number alone. The old and new addresses both keep working
for as long as those categories exist. New versions and split pages get their
own document numbers, as they always have.

`GET /api/jd/resolve?address=S01.13` returns
`{system_code, jd_category_id, jd_address}` for a category that exists, but only
if you're allowed into its system and the address fits any explicit request or
token limit. `20.21` resolves only while the original system is still unnamed and
the stored area and category match. Resolving an address grants no access to
documents; the Documents query that follows applies document visibility in SQL.
A malformed address returns 400 `bad_address`. A missing or off-limits system or
category returns 404 and never shows another system's labels.

Suchi doesn't accept near misses: no whitespace, no lowercase system codes, no
one- or three-digit parts, no Unicode lookalike digits, no mismatched forms like
`10.21`, and no old three-part values like `S01.13.147`. Searching `jd:13`
still filters by category inside the selected system. It isn't an address
lookup.

## 6. Johnny.Decimal, and where Suchi differs

The official [AC.ID notation](https://johnnydecimal.com/documentation/acid-notation)
has System, Area, Category and ID, and the
[multiple-systems overview](https://johnnydecimal.com/documentation/multiple-systems-overview)
uses A00 to Z99 for systems. The
[guidelines](https://johnnydecimal.com/documentation/multiple-systems-guidelines)
suggest a new system for genuinely separate things, not just because one has
filled up. Suchi differs in the ways below on purpose. None of this claims that
Johnny.Decimal tells you how to build Suchi's database or permissions.

| Topic | Official guidance | What Suchi does, and why |
| --- | --- | --- |
| Hierarchy | [Introduction](https://johnnydecimal.com/documentation/introduction): room or computer, cabinet as area, drawer as category, manila folder as ID. | System, area, category, then documents. "Choose a filing cabinet" is Suchi's simpler way to describe picking a system, not the official hierarchy. The two-level filing UI stays as it is. |
| The ID | [IDs](https://johnnydecimal.com/documentation/ids): a two-digit counter inside a category names a folder that can hold several related items. | Suchi leaves out that layer. Many documents can share a category address, and each document keeps its own global number, so API links stay exact and a category isn't capped at 99 documents. |
| Management zeros | [The standard zeros](https://johnnydecimal.com/documentation/the-standard-zeros): management at system, area and category level, including 00.00 JDex and 00.01 Inbox. A .05 AI entry was added on 2026-09-07. | 00–09 holds the generated index on disk, and the Inbox is category 49 in area 40. That keeps Suchi's protected Inbox and its rule that every document has a category, without building the whole management hierarchy. |
| Index | [The JDex](https://johnnydecimal.com/documentation/the-jdex): the master record of assigned IDs, with locations and notes. It's explicitly not a list of every document. | A generated map of areas and categories, not a register of assigned IDs. Suchi can rebuild it from its own state, and you never write a note per document. Neither index is a backup. |
| System root | Official examples put both code and name in the folder name. | `rendered/<SYS>/`, code only. Renaming a system doesn't move every document on disk. |
| Isolation | The notation organizes and disambiguates. | System membership plus document ACLs form an application boundary. A prefix by itself grants nothing and proves nothing to a regulator. |
| Flat layout | Official JD always uses areas, categories and IDs. | Flat authoring becomes areas and categories on import. Runtime flat rendering is a Suchi feature, not an alternative JD standard. |

Accepting the same system syntax doesn't mean Suchi implements every official
zero, ID extension, folder workflow or future convention. For how
Johnny.Decimal is meant to be used, read the linked sources, not this page.

## 7. Access and trust

For an ordinary operation on an object, all three must hold:

```text
the object's system matches any explicit request and token boundary
AND the user is active and can enter that system
AND the document or object permission allows the operation
```

Membership is direct, per user, with no per-system roles. Instance admins skip
membership and document ACL checks. They do **not** skip whether the object
exists, an explicit system mismatch, or the system a token is bound to. Owning a
document, holding a direct or group ACL, or being assigned in a workflow doesn't
get you into its system. Membership alone doesn't get you every document either.
A new ACL grant to a user MUST target an active user who can enter that system;
granting to a non-member is rejected. If membership is removed, any grants left
behind stop working. A partner who belongs to both systems still needs document
permission in each.

Unqualified session requests for collections go to original system 1, not to
whichever system you happen to have access to. A browser can explicitly select a
system and put it in the route or request; that's a choice, not an API fallback.
A request for a numeric object without a system uses the object's own system.
A token is bound to one system, which is both its default and its limit. An
external token with no binding is limited to the original system. Scope names
don't replace membership or ACLs.

"System unavailable" and "not found" responses never show another system's
labels. A user with no memberships needs an admin to add them; there's no silent
fallback. Removing a membership makes leftover grants useless and, in the same
step, revokes that user's shares, system-bound API tokens and pending mobile
pairings for the system. Adding them back doesn't bring those credentials back.
Writes and receipt replays check authority again inside their write
transaction. Bytes already downloaded can't be taken back.

Documents and system-owned metadata don't move between systems through ordinary
edits, automations, sidecars or taxonomy imports. Versions, split pages and
email families belong to the same system as their source. Being a member of two
systems doesn't let you assign one system's category, tag or type IDs to a
document in the other. The one deliberate exception is a document link written
by an authenticated user, who must be allowed to change the source and view the
target in their own systems. Automations, which act without a user, can only link
within one system. There's currently no API or UI that reads per-document custom
field values; listing field definitions is separate. Before one is added, it MUST
recheck whether the reader can see each linked document and hide the ones they
can't. That read-time redaction is not something v1 claims to do today.

A share holds documents from one system and is a bearer credential on purpose.
Public access checks again that the creator can still enter the system and that
the documents can still be shared. Mobile pairing and API token issuance each
capture one system, never all of them. The OAuth mailbox handoff field
`sealed_secret_b64` is authenticated server-side data tied to one actor and one
system, not reusable ciphertext. A sidecar's `jd_system` must match the
configured intake target, and it can't route into, or create, another system.

Systems share the server process, the SQLite and FTS database, and the
content-addressed blob store. Server admins, the people running the host, and
anyone holding a backup are trusted. A system is not separate infrastructure,
per-system encryption, a way to keep admins out, a security certification or
proof of professional independence. Configuration, users, groups and server-wide
services are shared across the instance. Copies, backups and anything already
shared need their own controls.

## 8. Rendered tree, exports and recovery

Before systems exist, document paths have no system folder. Afterwards, each
system renders under its permanent code. Either way, the file name ends with
`__<doc_pk>`, the document's global number. The default layout groups by area,
category, year, then date and title. Custom templates can differ.
`jd.system.code`, `jd.system.name` and `jd.address` are available to templates,
but `jd.address` is per category and repeats, so a layout that must avoid
collisions also needs `doc_pk`, or `asn` where the layout already requires a
unique archive serial number. Suchi adds the system folder itself, outside your
template, and rejects absolute paths, `..` escapes, and paths that collide with
its managed index.

What documents 147 and 148 might look like on a fresh render:

```text
rendered/
  S01/
    00-09 System index/00.00 archive.huml
    10-19 Client document kinds/
      13 GST filings/2026/2026-07-31 GST return__147.pdf
  S02/
    00-09 System index/00.00 archive.huml
    10-19 Client document kinds/
      13 GST filings/2026/2026-07-31 GST return__148.pdf
```

Switching to these paths doesn't rewrite your stored templates or old rendered
links, and it doesn't queue a pass over the whole archive. Older multi-system
renders that used a three-part suffix aren't supported; fresh renders use the
paths above.

The managed index, `00.00 archive.huml`, is a generated HuML snapshot of the
tree: `system`, `id = "archive"`, `version = 1`, the current display name and
the tree with its descriptions. It doesn't list documents, memberships or
grants. Its fixed ID and revision are not the last imported file's; that
provenance lives separately on the system record. It isn't a copy of your
authoring file and it isn't a JDex register of assigned folders.

Suchi writes the index only to paths it can prove it manages, and replaces it
atomically. If a write fails, the last good file stays. Refreshes are queued per
system and again at startup. Introducing systems for the first time queues
render-only moves, not OCR, classification or automation reruns. Only the
original system's index writer removes the old root-level index, and only after
the new one is in place and the old one is proved to be Suchi's. Files and
folders Suchi doesn't recognize are never overwritten or swept up. The rendered
tree and its index are rebuildable projections, not originals.

| What you have | What it keeps, and what it doesn't |
| --- | --- |
| Taxonomy export | One system's current tree, nothing else: no automations, permissions, review history or documents. TOML by default, HuML on request. Named `<SYS>.taxonomy.toml` (or `.huml`) once systems exist, and `archive.toml` (or `.huml`) before. The snapshot uses `id = "archive"`, `version = 1`, a global market and an undetermined language. |
| Managed index | The same tree, as HuML, kept current on disk. Not your original authoring file and not a provenance record. |
| Native takeout | Documents from the selected system: manifest version `3` with the system code and name, original bytes and metadata. Sidecar format stays `1`, with optional `jd_system` and `jd_address`. `jd_address` is informational, can repeat, and is ignored for routing on intake. `--all` means every owner in the selected system. It isn't a restore protocol; reimporting may give documents new numbers. |
| Full backup | Database, blobs, credential key and operator configuration, taken consistently. This is the only way to keep systems, memberships, document numbers, relationships and number allocation exactly as they were. Treat it as privileged data. |

Passing validation, or importing a tree successfully, tells you nothing about
security, compliance or whether the categories suit your records. Read the
[CA walkthrough](examples/in-ca-firm.md) and the
[multi-system use cases](examples/multi-system-use-cases.md) before you decide
where the boundaries go for real documents.
