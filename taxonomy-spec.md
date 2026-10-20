# Suchi taxonomy v1 reference

This is the de facto normative reference for the implemented `suchi-taxonomy/v1`
contract and its filing-system integration. **MUST**, **MUST NOT** and **MAY** state
contract requirements or permissions; recommendations are identified separately.
It describes Suchi's adaptation, not every Johnny.Decimal convention, a public
release announcement or a minimum supported Suchi version. The implementation
owners are the core [parser and validator](https://github.com/johnnybravo-xyz/suchi/tree/main/core/jd/presetfile),
[importer](https://github.com/johnnybravo-xyz/suchi/tree/main/core/jd/importer)
and [systems package](https://github.com/johnnybravo-xyz/suchi/tree/main/core/jd/systems).

The examples and this reference are **unreviewed**, not legal advice, compliance
checklists, professional approval or classification-accuracy guarantees. This
static collection is CC0-1.0; linked sources retain their own terms. Johnny.Decimal
is a trademark of Coruscade Pty Ltd. Suchi is independent, not affiliated with or
endorsed by Johnny.Decimal.

## 1. What a file represents

One file describes one system's complete proposed filing tree, optional literal
keyword starters, and the supported explicit automation starters. It is not a
set of patches, a document inventory, an access-control file, an inheritance
mechanism or a restore archive. Applying that complete proposed tree normally
**merges** it with existing local state; it does not reset the destination.

Keep these identities distinct:

| Field or identity | Meaning |
| --- | --- |
| `format` | Exact schema label `suchi-taxonomy/v1`, not an application release. |
| `id` and `version` | Authoring-content identity and positive content revision; not system identity or a document ID. |
| Optional `system` | Permanent filing-system code, for example `S01`. |
| `name` | Human-readable taxonomy name; supplies the system display name on first adoption/creation. |
| Runtime `documents.id` | Existing installation-global document identity, allocated by Suchi, never authored here. |

Retaining category meanings within a content ID and increasing revisions when
editing reference content are recommended authoring discipline. The importer does
not enforce revision monotonicity or provide managed template upgrades.

## 2. Serialization and strict acceptance

Files MUST use HuML or TOML, be nonempty valid UTF-8, and contain at most
**1,048,576 bytes**, inclusive. JSON tags used inside Suchi do not make JSON or
YAML public authoring formats. The core parser accepts serialization selectors
`huml` and `toml` (omission means HuML), without content sniffing; extension-based
selection accepts `.huml` and `.toml` case-insensitively.

The parser MUST reject unknown fields at every schema level, duplicate mapping
keys, null values, wrong scalar/list/object types, integer overflow and invalid
structure. It does not coerce `"1"` into an integer or a number into a string.
Schema-required integers are integral values, not floats. Metadata `version` must
fit the implementation's integer representation (decoded from signed 64-bit input;
there is no additional revision ceiling).

Text limits below count **Unicode code points**, not bytes or grapheme clusters.
“Nonblank” means nonempty after whitespace testing; accepted surrounding whitespace
is generally retained, not automatically trimmed. Code grammars are stricter and
permit no surrounding whitespace. The total byte limit always applies.

### 2.1 Top-level fields: exhaustive whitelist

| Field | Type and rule |
| --- | --- |
| `format` | Required string, exactly `suchi-taxonomy/v1`. |
| `system` | Optional string; if present MUST be nonempty and match `^[A-Z][0-9]{2}$`. |
| `id` | Required string matching `^[a-z0-9][a-z0-9_-]*$`. |
| `version` | Required positive integer. |
| `name` | Required nonblank string, at most 80 code points. |
| `market`, `language` | Required nonblank strings. |
| `maintainer`, `license` | Optional strings. |
| `story` | Required nonblank string, at most 500 code points. |
| `flat` | Optional boolean, defaults to false; authoring shorthand, not runtime rendering mode. |
| `areas` | Required explicit list in ordinary tree form; forbidden when `flat=true`. |
| `categories` | Forbidden in ordinary tree form; required list when `flat=true`. |
| `seeds` | Optional object; its only supported field is `automations`, an optional list. |

There is no extra declared maximum for `id`, `market`, `language`, `maintainer` or
`license` beyond the whole-file bound. Market/language are not validated against
ISO/BCP-47 vocabularies; license is not checked against SPDX; maintainer need not
be a URL or email. Those conventions remain useful authoring recommendations.

There is no top-level `systems`, `inbox`, document list, assigned document ID,
access grant, secret or arbitrary extension field. The valid top-level `system`
string MUST NOT be confused with the category projection's runtime `system`
boolean, which means protected/generated and is not authorable.

### 2.2 Areas and categories

An area object has exactly `code` (integer), `name` (nonblank string, at most 80
code points), and `categories` (explicit list, allowed to be empty). There is no
area description field. `areas=[]` is a valid explicit blank tree.

At most eight authored areas are permitted, with distinct codes from
**10, 20, 30, 50, 60, 70, 80, 90**. In area `A`, a category's code MUST be one of
`A+1` through `A+9`. Category codes MUST be unique across the whole file; names
need not be unique. Thus the permitted tree has at most nine user categories per
area and 72 per file, without another independent category-count setting.

| Category field | Type and rule |
| --- | --- |
| `code` | Required integer in tree form; see flat shorthand below for omission. |
| `name` | Required nonblank string, at most 80 code points. |
| `description` | Optional string, at most 240 code points. |
| `keywords` | Optional list of at most 20 strings, each nonblank and at most 40 code points. Duplicate keywords are not separately rejected. |

Authors MUST NOT declare areas/categories in `00–09` or `40–49`, zero-ending
categories, an Inbox pointer or a category protected flag. After raw validation,
parsing appends exactly `40 System / 49 Inbox` and sets the normalized Inbox to
49. Generated structure is not counted as an authored area. Existing legacy
runtime rows are not evidence that the portable format accepts those codes.

### 2.3 Flat authoring is shorthand

With `flat=true`, top-level `categories` MUST have 1–9 entries and `areas` MUST be
absent, even if empty. Entries receive category codes 11–19 in list order. A raw
entry MAY omit `code`; if supplied it MUST equal that entry's expected code.
Explicit zero is not an alias for omission. Reordering changes the inferred codes.

Parsing expands the entries into area 10 named after the taxonomy and adds the
same generated System/Inbox. This does **not** enable Suchi's separately stored
runtime `flat` taxonomy/rendering mode, which hides JD affordances and uses a
correspondent/year layout. Imports install/merge JD structure; a new system starts
in JD mode. Database export writes explicit areas and need not preserve the
original flat spelling.

### 2.4 Small complete authoring example

This TOML describes a proposed tree, not existing documents or access grants:

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
keywords = ["GSTR-3B"]
```

Normalized filing structure, **not additional author input**:

```text
S01 Small office
  10-19 Client records
    11 Engagement letters
    13 GST filings
  40-49 System                 generated
    49 Inbox                  generated
```

## 3. Portable starters: complete vocabulary

Keywords are literal starter phrases, not authored regular expressions. Import
trims and regex-escapes them and uses case-insensitive matching with Unicode
letter/number/underscore boundaries. Generated category rules assign the matching
category in the destination system; they do not assess correctness or compliance.
Review literal matches before relying on them.

Each `seeds.automations` entry has exactly `name` (nonblank, at most 80 code
points), `trigger` (one object), and `actions` (nonempty list). Explicit starter
names MUST be unique by exact string within that list. No enabled flag, order,
owner, runtime row ID or preset slug can be authored. An empty `seeds` object or
empty automation list is permitted.

### 3.1 Trigger fields

`type` is required and MUST be integer **1 consumption**, **2 document_added** or
**3 document_updated**. All other accepted fields are optional:

| Field(s) | Type / interpretation |
| --- | --- |
| `filter_path`, `filter_filename` | String; Go `filepath.Match` glob syntax. |
| `filter_title_matching`, `filter_content_matching` | String; Go regular expression syntax, matched case-insensitively. |
| `filter_has_tag`, `filter_has_correspondent`, `filter_has_document_type` | String; symbolic metadata names, resolved within the target system. |
| `filter_email_from`, `filter_email_subject` | String; glob syntax. |
| `filter_email_folder` | String; literal folder match, not regex. |
| `filter_email_has_attachment` | Boolean; omitted, true and false are distinct. |

The validator checks trigger codes and glob/regex syntax; it does not prove that
a chosen trigger/filter combination is useful. Optional strings may be empty;
there is no additional field-length limit beyond the whole-file bound.

### 3.2 Action objects

An action has exactly `kind` (string) and `params` (object). The following list is
exhaustive; the parameter object MUST contain only the indicated alternative:

| `kind` | Exact `params` |
| --- | --- |
| `assign_title` | `template`: nonblank string. Portable validation does not further validate template syntax. |
| `assign_tags` | `tag`: nonblank string **or** `tags`: nonempty list of nonblank strings; never both. |
| `assign_correspondent` | `correspondent`: nonblank string. |
| `assign_document_type` | `document_type`: nonblank string. |
| `assign_jd_category` | `jd_category_code`: integer referring to a declared user category in this file. |

These strings and the tag list have no additional declared length/count limit
beyond the file bound. Metadata references use names rather than stored IDs.
Category references use codes, resolved through any import remap **only within the
target system**. Generated 49 Inbox is not a portable assignment target.
`jd_category_id`, a foreign-system target, owner assignment, custom fields,
sensitivity/review settings, ACL actions and credentials are not supported.
There are no standalone seed families for tags, correspondents or other entities.

Skipping starters during import is **not** relaxed parsing: malformed or
unsupported starters MUST still fail validation.

## 4. Normalization and rejection boundaries

Parsing validates raw authorship before flat expansion or Inbox generation.
Serialization reverses recognized normalization, omits generated Inbox, and
reparses its output. A normalized tree supplied to import/export MUST contain
exactly the generated `40 System / 49 Inbox`, with no custom Inbox description or
keywords; renamed/custom reserved content is rejected, not silently discarded.

HuML and TOML represent the same normalized contract, not canonical identical
bytes. Comments, formatting and optional serialization directives need not survive
conversion. Ordering may matter, especially for flat codes and starter order.
Source-byte SHA-256 provenance may differ between semantically equivalent files;
there is no universal canonical-byte hash in v1.

Examples of rejected input include:

- `system=""`, `system="s01"`, `system="AUD"`, `system=" S01"`, or a numeric system.
- A quoted version, float category code, null keyword, duplicate mapping key or
  unknown field even in a nested action parameter.
- An authored area 40, category 10, `inbox`, `categories` with `flat=false`, or
  any `areas` key with `flat=true`.
- A category outside its area's decade, repeated category code, overlong name,
  or action assigning an undeclared category/foreign database row.

Errors are errors, not requests to normalize case, trim codes, grant access,
create hidden document IDs or silently drop unsupported data.

## 5. Systems, first import and merge

A system code MUST match `^[A-Z][0-9]{2}$`: **A00–Z99**, including suffix 00.
A nonempty code is immutable and cannot be reassigned. Display names are editable,
nonblank UTF-8, at most 80 code points. There is no systems-enable preference,
opt-out toggle, system deletion/merge operation or cross-system document transfer
promised by this contract.

Before introduction there is one hidden original system (internal ID 1, empty
code). Users do not configure it or see an extra address layer. Systems are
introduced only by successfully applying the first **prefixed taxonomy import**:

| Input and state | Destination/result |
| --- | --- |
| Unprefixed file before introduction | Existing single archive; no SYS layer is introduced. |
| First prefixed file, ordinary destination | Name the original archive with the incoming code/name and import into it; preserve existing documents, IDs, memberships and ACLs. |
| First prefixed file, explicitly preserve original separately | Give the original archive a distinct valid `existing_system_code` (for example A00), preserving its name; atomically create the incoming file's system. |
| Prefixed file after introduction, existing code | Merge only into that system. |
| Prefixed file after introduction, new code | Atomically create that system, its generated Inbox, tree and supported starters. |
| Unprefixed file after introduction | Import into the captured selected target, or original system 1 when unqualified; never remove SYS. |

`existing_system_code` is an import option, **not a file field**. It is only valid
for the first prefixed import and must differ from the incoming code. An explicit
import target and a file's `system` MUST agree. An API file prefix takes precedence
over the browser's ordinary current-system query fallback, not over a conflicting
explicit body target. A target option alone with an unprefixed file cannot create
a system. CLI `--system CODE` selects a target; omission retains the original
archive unless the file itself names its target. `--existing-system-code CODE`
selects separate preservation on first import.

Existing original memberships survive introduction. A newly created system is
initially enterable only by active instance administrators; ordinary users require
explicit direct membership. While the original system remains hidden, ordinary
new users and demoted administrators are admitted there automatically; after it
is named there is no such automatic membership. Reimporting into an already named
system preserves its locally edited display name rather than adopting a template
name change.

### 5.1 Preview and application

Preview MUST be read-only. Apply requires a matching nonempty preview-state hash
and recomputes the proposal inside its write transaction. API actors are taken
from authentication and rechecked as active instance administrators in that
transaction; trusted local CLI invocation is distinct from a body-supplied actor.

The binding covers source bytes and normalized input, destination/first-import
choice, target identity/provenance/members/creation state, remaps, seed choices,
target tree and relevant rules/references. Unrelated ordinary edits in a different
system do not invalidate it, but a conflicting code creation or target change
does. Stale/failed Apply MUST leave no partly named/created system or partly
changed permissions/tree. Destination changes, tree, starters, last-import
provenance and required projection jobs commit together. Filesystem projection
is asynchronous: committed queued work is not proof that rendered files refreshed.

### 5.2 Ordinary merge rules

- Existing area codes retain local names. Same category code **and exact name**
  retain the row and local description.
- A different name at an occupied category code requires explicit skip or an
  unused nonzero-ending code in the same decade. A code already in the target or
  incoming tree cannot be the remap destination. This is not a cross-system move.
- Existing rule names win, including disabled originals and user-owned edited
  forks. Reimport does not silently re-enable or overwrite them. Skipping or
  failing to resolve a category skips the whole dependent starter, not just one
  action within it.
- Metadata names resolve in the target system: trimmed exact name first, otherwise
  a matching canonical slug. Local canonical names are not overwritten.
- Keyword-rule names incorporate authoring ID and effective category code/name;
  their trigger is document-added and order 100. Explicit starters retain list
  order. Changing a template ID is not an upgrade mechanism for existing rules.

Neutral bootstrap replacement is a narrow initial-setup exception, not a general
reset: no document, including Trash, may be in an unprotected category; the target
must have no automations, saved views, storage paths or email accounts, no selected
preset, and at most its neutral Inbox. Completed initial setup also prevents
replacement of the original archive. The protected Inbox row is retained.

Last-import ID, revision, source hash and authoring snapshot are system-scoped
provenance, not an immutable import history or a promise that the current tree
matches that file. An unchanged revision/hash does not by itself make import a
no-op; missing requested starters may still be added.

## 6. Filing addresses and document identity

Suchi uses `SYS.AC.ID`, for example `S01.13.147`. `AC` is the two-digit category
code, **not** a three-digit `ACC` field. The canonical syntax is:

```text
^([A-Z][0-9]{2})\.([0-9]{2})\.([1-9][0-9]*)$
```

The final component MUST also fit positive signed 64-bit range:
**1–9,223,372,036,854,775,807**. It is the existing installation-global
`documents.id`, across all systems—not a category-local folder counter, authored
seed ID or new namespace-local ID. IDs need not be consecutive; automatic
allocation does not reuse purged numbers. New versions and split children receive
their own document IDs under Suchi's existing behavior.

All addresses below are illustrative and assume Suchi has **already returned** the
stated document IDs; no authoring file reserves them:

| Address | Meaning |
| --- | --- |
| `S01.13.147` | Document 147 currently filed in S01/category 13. |
| `S02.13.148` | Different document 148 in another system's category 13. |
| `S01.14.147` | Document 147 after a same-system correction/refile to category 14. |
| `A00.49.1` | Valid syntax for a document currently in a named system's generated Inbox. |

Refile changes the address, not document identity. The old address is stale, with
no historical-location alias. Existing numeric document URLs retain identity and
can resolve the current location subject to authorization. The address resolver
`GET /api/jd/resolve?address=S01.13.147` returns `{id,system_code,jd_address}` only
for the matching live, viewable document and its current category. Malformed input
is 400 `bad_address`; stale, missing, trashed or inaccessible locations are 404.

`S01.13.01`, `S01.13.0`, signed or overflowing IDs, whitespace, lowercase SYS,
`AUD.13.147`, `S01.3.147` and suffixed extensions such as `S01.13.147/1` are not
accepted aliases. Syntax permits AC 00–99; syntax alone does not establish an
existing or authorable category. Search `jd:13` remains a category filter within
the current system, not a full-address lookup.

## 7. Johnny.Decimal foundations and Suchi adaptations

The official [AC.ID notation](https://johnnydecimal.com/documentation/acid-notation)
uses System, Area, Category and ID; [multiple-systems overview](https://johnnydecimal.com/documentation/multiple-systems-overview)
specifies A00–Z99. Its [guidelines](https://johnnydecimal.com/documentation/multiple-systems-guidelines)
recommend the extension for distinct systems rather than merely because one is
full. The following differences are intentional Suchi design choices, not claims
that official JD prescribes Suchi's database or permissions.

| Topic | Official guidance | Suchi adaptation and rationale |
| --- | --- | --- |
| Hierarchy and analogy | [Introduction](https://johnnydecimal.com/documentation/introduction): room/computer, cabinet/area, drawer/category, manila folder/ID. | System → area → category → documents. “Choose a filing cabinet” is Suchi's simplified system-selection analogy, not the exact official hierarchy. It retains the existing two-level filing UI. |
| Final ID | [IDs](https://johnnydecimal.com/documentation/ids): a two-digit category-local counter identifies a folder that can contain several related items. | A positive global document number identifies one Suchi document row. This preserves numeric links, avoids another allocation workflow and removes a 99-document category cap; it is not canonical JD ID-folder semantics. |
| Management zeros | [The standard zeros](https://johnnydecimal.com/documentation/the-standard-zeros): system/area/category management, including 00.00 JDex and 00.01 Inbox; current prose adds .05 AI on 2026-09-07. | Reserve filesystem 00–09 for the index, generate category 49 in area 40 for Inbox. This preserves Suchi's protected Inbox and every-document-has-category invariant, without implementing the full management-ID hierarchy. |
| Index | [The JDex](https://johnnydecimal.com/documentation/the-jdex): master record of assigned IDs, with locations/notes; explicitly not an inventory of every document. | A generated area/category map, not an assigned-ID register. It can be rebuilt from managed state, without requiring a manually authored note for every document. Neither index is a full document backup. |
| System root | Official multiple-system examples include code and name in the root. | Stable `rendered/<SYS>/`, code only; editable display names do not move every document. |
| Isolation | Official notation organizes and disambiguates information. | System membership plus existing document ACLs is an application boundary; a prefix alone grants no permission or regulatory assurance. |
| Flat layout | Official JD uses area/category/ID organization. | Authoring shorthand is normalized to areas/categories; separate runtime flat rendering remains a Suchi feature, not an alternative official JD standard. |

Suchi does not implement every official zero, ID extension, folder workflow or
future JD convention by accepting the same SYS syntax. The linked primary
sources, rather than this adaptation, define official Johnny.Decimal usage.

## 8. Access and trust boundaries

For an ordinary object operation, authorization requires:

```text
actual system matches any explicit request and token boundary
AND active user can enter that system
AND existing document/object permission allows the operation
```

Membership is direct user membership, with no per-system roles. Instance admins
bypass membership and document ACLs, **not** actual object existence, explicit
system mismatches or a token's bound system. Document ownership, direct/group ACLs
or workflow assignment do not independently grant system entry. Membership alone
does not grant every document. A new user ACL grant MUST target an active user
who can enter the object's system; a grant to a nonmember is rejected. Retained
grants become ineffective when membership is removed. A partner admitted to both
systems still needs document permission.

Unqualified session collections target original system 1, not an arbitrary
accessible system. A browser may explicitly select an accessible system and put
that selection in its route/request; this is not an API fallback. Unqualified
numeric object requests derive the object's actual system. Tokens use one bound
system as both default and ceiling; an external token without a binding is
restricted to the original system. Scope names do not replace membership or ACLs.

System-unavailable and object-not-found responses do not expose foreign labels.
A user with no memberships needs an administrator grant, not a silent fallback.
Membership removal makes retained document grants ineffective and atomically
revokes the user's shares, system-bound API tokens and outstanding mobile pairings
for that system. Re-admission does not revive those credentials. Mutations and
receipt replay recheck authority in their write transaction; already delivered
bytes cannot be retracted.

Documents and namespace-owned metadata do not change systems through ordinary
updates, automations, sidecars or taxonomy import. Version/split/email families
inherit system ownership. A same-user membership in two systems does not make
foreign category/tag/type IDs valid metadata assignments. The deliberate exception
is an authenticated document-link write: the actor must be allowed to change the
source and view the target in their respective systems; inaccessible link targets
are redacted on read. Actorless automation links remain same-system only.

A share contains documents from one system and remains a deliberate bearer
credential; public access rechecks the creator's active system entry and current
shareability. Mobile pairing/API token issuance captures one system, not all
systems. An OAuth mailbox creation handoff named `sealed_secret_b64` is authenticated,
actor- and system-bound server handoff data, not arbitrary reusable at-rest
ciphertext. Sidecar `jd_system` must match the configured intake target and cannot
route into or create another system.

Systems share the server process, SQLite/FTS infrastructure and content-addressed
blob store. Server administrators, host operators and backup holders remain
trusted; SYS is not separate infrastructure, per-system encryption, administrator
exclusion, measured security certification or proof of professional independence.
Configuration, users/groups and server-wide services remain instance-wide. Copies,
backups and data already disclosed need their own controls.

## 9. Rendered tree, exports and recovery

Before introduction, existing default paths have no SYS root or full-address
suffix. Afterwards each system is projected beneath the immutable code root;
default JD layout retains area/category/year/date-title grouping and a full-address
suffix. Current default templates use `.pdf`; explicit templates can differ.
`jd.system.code`, `jd.system.name` and `jd.address` are template values. The system
root is enforced outside user templates; absolute/traversing paths and managed
index collisions are rejected.

Illustrative paths, assuming those document IDs were already returned:

```text
rendered/
  S01/
    00-09 System index/00.00 archive.huml
    10-19 Client document kinds/
      13 GST filings/2026/2026-07-31 GST return__S01.13.147.pdf
  S02/
    00-09 System index/00.00 archive.huml
    10-19 Client document kinds/
      13 GST filings/2026/2026-07-31 GST return__S02.13.148.pdf
```

The managed index is a generated HuML tree snapshot with `system`, `id="archive"`,
`version=1`, current display name and tree metadata. It omits keyword/starter rules,
documents, memberships and grants. Its fixed snapshot ID/revision are not the
last imported source ID/revision; import provenance is retained separately in the
system record. It is neither an authoring-starter backup nor a complete JDex
assigned-folder register.

Index publication uses managed ownership checks and atomic replacement; failures
retain the last good file. Refresh is queued per system and at startup. First
introduction queues render-only moves, not OCR/classification/automation reruns.
Only the original system's index writer removes the proved-managed former root
index after its replacement succeeds. Unknown user files/directories are not
permission to overwrite or recursively clean. Rendered links and the index are
rebuildable projections, not immutable originals.

| Artifact | What it preserves / does not preserve |
| --- | --- |
| Taxonomy export | One system's current portable tree, named `<SYS>.taxonomy.huml` or `.toml` after introduction (`archive.huml`/`.toml` before). Snapshot metadata uses `archive`, revision 1, global market and undetermined language. |
| Taxonomy export with starters | Only representable preset-owned rules, not every automation or user-owned fork. Disabled/unrepresentable rules or unresolved references produce errors rather than silent lossy conversion. Keyword-derived rules export as explicit starters, not reconstructed keywords. |
| Tree-only export / managed index | Omits both keywords and starters; not a faithful copy of the original authoring file or complete provenance record. |
| Native takeout | Partial selected-system export, manifest version `2` carrying system code/name, original bytes and metadata; sidecar format remains `1` with optional `jd_system`/`jd_address`. `--all` means all owners in the selected system. This is not a restore protocol; reimport may allocate new document IDs and source addresses are not promises of destination identity. |
| Full backup | Consistent database, blobs, credential key and operator configuration. This is the route to preserving systems, memberships, IDs, relationships and ID-allocation state exactly; protect it as privileged data. |

Neither passing syntax validation nor successfully importing a taxonomy establishes
security/compliance/domain correctness. Review the [CA walkthrough](examples/in-ca-firm.md)
and [multi-system use cases](examples/multi-system-use-cases.md) before choosing
boundaries for real records.
