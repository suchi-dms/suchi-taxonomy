# Indian CA firm

[HuML file](in-ca-firm.huml) · [Equivalent TOML](in-ca-firm.toml) · [Normative reference](../taxonomy-spec.md)

Entity-bound copies: **Sharma & Associates / S01**
([HuML](in-ca-firm-s01.huml) · [TOML](in-ca-firm-s01.toml)) and
**Sharma Advisory LLP / S02**
([HuML](in-ca-firm-s02.huml) · [TOML](in-ca-firm-s02.toml)).

Keep client returns, audit working papers and signed engagements separate from the practice’s own finances and staff records. Identify clients with correspondents so new engagements do not require new categories.

## Scope and omissions

Includes ROC/secretarial filings, certificates/UDIN and peer review. Practice tax has no keyword rule: the same phrases occur in client returns, so identify these documents manually. No tax calculation, portal filing, engagement access control or statutory audit checklist.

All categories have document-kind descriptions. Keywords are literal starter
phrases, not measured classification accuracy; review false matches before use.
No explicit automation seeds: category keywords provide the limited starters.
Sensitivity defaults, review cadences, custom fields, standalone seed families,
links and trust/access state are intentionally absent because taxonomy v1 does
not support them. Configure permissions independently before adding real records.

## Sharma audit/advisory walkthrough

The firms, people and staffing arrangement below are **illustrative**, not facts
about real firms. Posit one audit practice, Sharma & Associates, and a separately
managed advisory practice, Sharma Advisory LLP, using one trusted Suchi server.
The two files repeat the complete generic CA tree verbatim, including descriptions
and keywords; only their system/content identity and display-name headers differ.
They do not add an audit-independence model, inheritance or a new classification
scheme. No Indian professional/legal conclusion follows from this organization.
Assess actual engagement, confidentiality and independence requirements separately.
The [international comparisons](multi-system-use-cases.md) show the same caution.

### 1. Begin with the ordinary archive

Use the generic [HuML](in-ca-firm.huml) or [TOML](in-ca-firm.toml) if the existing
archive is still one coherent practice. Preview before Apply. It is unprefixed,
so it introduces no SYS selection or new filename layer. An abbreviated current
tree after ordinary import is:

```text
Original archive (no displayed SYS)
  10-19 Client document kinds
    11 Engagement and KYC
    12 Income tax filings
    13 GST filings
    14 Audit and working papers
    15 ROC and secretarial filings
    16 Certificates and UDIN
  20-29 Practice money
    21 Fees and receivables
    22 Practice tax
  30-39 Practice administration
    31 Registrations and membership
    32 Staff and articles
    33 Peer review
  40-49 System
    49 Inbox                         generated, never authored
```

Use client correspondents such as **Sharma Traders** and **Mehta Manufacturing**,
not a new category or system for every client/year. A client's GST return belongs
in 13; the practice's own return belongs in 22. The deliberately absent practice-tax
keyword avoids confusing the same phrases in client filings with the firm's tax.
Correspondents in two systems can have the same name without being one shared row.

### 2. Introduce S01 through the normal import

Choose [in-ca-firm-s01.huml](in-ca-firm-s01.huml) or its
[TOML counterpart](in-ca-firm-s01.toml). The first prefixed preview offers:

- **Use this archive:** name the existing archive **S01 / Sharma & Associates**
  and apply the ordinary merge there. Existing documents, numeric IDs, memberships
  and document grants remain; no documents are copied or moved between entities.
- **Create separately:** preserve the original archive under a distinct valid code,
  for example **A00**, retaining its display name, and create S01 separately.
  Choose this when existing records do not all belong to the audit practice.
  Naming the current archive S01 is not a tool to sort a mixed-entity archive.

These are destinations for one atomic import, not an enable checkbox or a later
switchable mode. Only Apply commits the choice; failed/stale previews or failed
Apply must not partly name/create a system. In the CLI the separate choice is
`--existing-system-code A00`; it is not a taxonomy-file field.

For example, the ordinary adoption path is preview then Apply:

```sh
/absolute/path/to/suchi taxonomy import examples/in-ca-firm-s01.huml
/absolute/path/to/suchi taxonomy import examples/in-ca-firm-s01.huml --apply
```

For an already imported generic tree, ordinary same-code/name merge preserves
local rows/descriptions and rules. These entity-bound files have distinct content
IDs, so keyword-rule names are distinct from generic-file names. If the existing
generic starters are already sufficient, choose `--skip-seeds` (or the import
preview's starter choice) to avoid adding another equivalent set; skipping
starters never relaxes file validation.

### 3. Add S02 and then grant entry

Next preview and apply [in-ca-firm-s02.huml](in-ca-firm-s02.huml) or
[in-ca-firm-s02.toml](in-ca-firm-s02.toml). It targets the new S02 code even when
the browser was displaying S01. An explicit `--system` or API body target must
agree with the file; it cannot redirect S02's file into S01.

After the ordinary S01 adoption followed by S02 creation:

```text
S01 Sharma & Associates
  10-19 Client document kinds / 11, 12, 13, 14, 15, 16
  20-29 Practice money / 21, 22
  30-39 Practice administration / 31, 32, 33
  40-49 System / 49 Inbox
S02 Sharma Advisory LLP
  10-19 Client document kinds / 11, 12, 13, 14, 15, 16
  20-29 Practice money / 21, 22
  30-39 Practice administration / 31, 32, 33
  40-49 System / 49 Inbox
```

The repeated category numbers are intentional. Each system owns its tree,
correspondents, other document metadata and rules. Names can be edited later
(nonblank, up to 80 code points); codes cannot. Reimport into a named system
preserves its locally edited name. An unprefixed import afterwards targets the
selected system, or original system 1 for unqualified clients, and never disables
systems. There is no ordinary delete/transfer shortcut.

S02 initially has **no ordinary members**; instance admins enter implicitly.
In the system membership panel an administrator can arrange:

| Account | S01 membership | S02 membership | Document access |
| --- | --- | --- | --- |
| Anita, audit staff | Yes | No | Only S01 documents allowed by existing ownership/ACL rules. |
| Advisory staff | No | Yes | Only S02 documents allowed by existing ownership/ACL rules. |
| Partner, ordinary user | Yes | Yes | Still needs document permission separately in each system. |
| Instance administrator | Implicit | Implicit | Trusted across systems, but explicit request/token boundaries still apply. |

Retained original memberships are not automatically removed by S01 adoption.
Review them before adding real records. Membership grants entry, not a blanket
right to every document; importing a tree grants no ordinary user access to a new
system. No per-system role hierarchy is needed.

### 4. File documents using IDs actually returned by Suchi

The following numbers are **illustrative receipts**, not promises of future
allocation: assume Suchi has already returned document IDs **147** and **148**.
Substitute real upload/detail IDs when following the walkthrough. Neither file
authors these numbers, and they are not local folder counters.

- A Sharma Traders GST return in S01/category 13 has address **S01.13.147**.
- A distinct advisory-system GST document in S02/category 13 has address
  **S02.13.148**. The client name can recur there as S02's own correspondent.
- If document 147 was actually audit evidence and is corrected within S01 to
  category 14, its address becomes **S01.14.147**. Its numeric identity stays 147;
  the former full address is stale. Its existing numeric document link remains
  an authorized route to the current location.

The final component is the positive installation-global `documents.id`, not
`.01` through `.99` allocated anew in each category. New versions and split
children receive their own document IDs. Document assignment cannot move 147 to
S02; membership in both systems does not make a foreign category ID a valid target.

### 5. Demonstrate the two permission gates

Suppose an authorized owner/admin attempts to give Anita a direct document-view
grant to S02 document 148. **The grant request fails** because Anita cannot enter
S02. If a grant already existed before her S02 membership was removed, its row
can remain, but it cannot provide entry: her S02 detail, search and download
requests still remain unavailable.

Conversely, Partner can enter both systems but cannot read another owner's
restricted S02 document without a document grant. Removing Partner's S02
membership makes retained S02 document grants ineffective, revokes Partner's
S02 shares and system-bound tokens/pairings, and leaves S01 access independent.
Adding the membership again does not resurrect those bearer credentials.
Membership removal cannot retract bytes already delivered.

This is application-level isolation on a shared SQLite/CAS/server, not protection
from the server administrator, host or backup operator. Whether a shared deployment,
staffing arrangement or access policy is professionally permissible needs its own
assessment. **S01/S02 do not satisfy audit independence by themselves.**

### 6. Wait for projection, and back up the real archive

First introduction queues render-only moves and per-system index refreshes; it
does not rerun extraction, classification or automations. Queue completion and
actual filesystem publication are separate from successful import.

Illustrative default paths, using the already-returned IDs above:

```text
Before SYS:
  rendered/00-09 System index/00.00 archive.huml
  rendered/10-19 Client document kinds/13 GST filings/2026/
    2026-07-31 GST return__147.pdf
After SYS:
  rendered/S01/00-09 System index/00.00 archive.huml
  rendered/S01/10-19 Client document kinds/13 GST filings/2026/
    2026-07-31 GST return__S01.13.147.pdf
  rendered/S02/00-09 System index/00.00 archive.huml
  rendered/S02/10-19 Client document kinds/13 GST filings/2026/
    2026-07-31 GST return__S02.13.148.pdf
```

This path sketch precedes the optional refile to category 14. System roots use
codes only, so renaming the firm label does not move all documents. The generated
`00.00 archive.huml` is a managed area/category map, with current system name and
snapshot identity `archive`/revision 1. It is not the original CA authoring file,
the last-import provenance record, a keyword/starter backup or a document inventory.
Only proved-managed old index/link artifacts are cleaned up during projection;
an unknown user file is not safe to overwrite.

Keep the reference authoring files separately if you need their descriptions,
keywords and source identity. A taxonomy export is current portable configuration,
and a native takeout is a partial selected-system export whose reimport can allocate
new IDs. Preserve IDs, memberships, document ACLs, relationships and credentials
through a consistent **full database + blobs + credential key + configuration**
backup. Protect those backups and their operators as trusted across both systems.

## Sources and review

The categories are a filing suggestion, not schema or legal authority. The
following official sources are context or operator starting points, not an exhaustive compliance review:

- [Income Tax Department: returns and forms](https://www.incometax.gov.in/iec/foportal/help/individual/return-applicable-1)
- [ICAI UDIN portal (reference entry point)](https://udin.icai.org/)
- [Ministry of Corporate Affairs (reference entry point)](https://www.mca.gov.in/)

Review status: **unreviewed reference example**, prepared 2026-10-20. No
practitioner review, self-use validation, compliance certification or classification
benchmark is claimed. Linked entry points need jurisdiction-specific follow-up.
Passing validation is separate from domain review; run the repository’s
`make check` with your Suchi binary before import or distribution.

Reference content is CC0-1.0; official linked material retains its own terms.
