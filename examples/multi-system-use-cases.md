# Multi-system use cases: distinct entities and capacities

[Normative reference](../taxonomy-spec.md) · [Reference collection](../README.md) ·
[Sharma walkthrough and both formats](in-ca-firm.md)

These are **unreviewed filing suggestions**, not legal advice, compliance
checklists, practitioner-approved workflows or accuracy guarantees. Primary sources
below support particular organizational/recordkeeping distinctions. None requires
Suchi, a SYS prefix, a separate server or this proposed filing tree. They do not
measure how many mid-scale firms need multiple systems.

All company names, people, shared staff/server arrangements, category choices and
addresses below are **illustrative**, unless a source is specifically described as
discussing that type of arrangement. Each address assumes that Suchi has **already
returned** the illustrated positive installation-global document ID. These are not
observed uploads, authored IDs, category-local counters or promises of allocation.
The named categories in these sketches are proposed examples, not additional
complete authoring templates or categories prescribed by law.

Use a SYS boundary for a genuinely distinct managed archive, not merely because
another client, year or department arrived. A nearby **non-case** means that the
stated distinction alone does not justify another SYS—not that confidentiality,
accounting, restricted funds or document permissions cease to matter. The generic
ten reference trees stay unprefixed; the two full Sharma variants demonstrate
entity-bound import without inventing template inheritance.

## 1. Audit and advisory organizations

### UK: Northmere Audit / Northmere Advisory

**Sourced facts.** The [FRC Revised Ethical Standard 2024](https://media.frc.org.uk/documents/Revised_Ethical_Standard_2024_orZHKLq.pdf),
paragraph **5.25**, describes safeguards that *may* be effective depending on the
circumstances, including separate teams and, where circumstances require,
effective physical and electronic segregation of team members and documentation
throughout the services. It also addresses Ethics Partner policies and procedures
and effective engagement-quality review. Paragraph **5.26** requires refusing the
service/engagement or withdrawing as appropriate where safeguards cannot eliminate
or sufficiently reduce the threat; doubtful cases go to the Ethics Partner/Function.

Paragraph **5.40** imposes a permitted-services restriction for statutory audits
of public-interest entities, covering the firm and network members and requiring
audit-committee approval after assessment. It is not general permission for
advisory work behind an electronic boundary, and permitted services cannot include
prohibited elements. Appendix **A2.4** makes network-firm circumstances relevant
even where that firm's work is not used in the engagement. Whether firms form a
network is a separate professional assessment.

**Illustrative Suchi organization.** Posit Northmere Audit **N01** and Northmere
Advisory **N02** as separate managed archives, with category 11 for engagement
letters in each:

```text
N01 Northmere Audit       / 10-19 Engagement records / 11 Engagement letters
  N01.11.147             audit engagement letter, returned document ID 147
N02 Northmere Advisory    / 10-19 Engagement records / 11 Engagement letters
  N02.11.148             advisory engagement letter, returned document ID 148
```

Admit only the appropriate direct members to each system and apply document ACLs
within it. A dual-member partner still needs document permission; an auditor's
foreign document grant alone cannot confer entry. This may support one part of an
assessed arrangement, but a common administrator, host and backup remain trusted
across both. Shared staffing or deployment must be assessed against the actual
safeguards required. **Separate entities, names or SYS codes are not an
independence safe harbour and do not override network obligations or prohibitions.**

**Nearby non-case.** Individual clients or engagements within one firm are not
automatically systems. Correspondents, engagement metadata and document ACLs may
be the appropriate distinction, subject to actual confidentiality requirements.

### Nebraska variant: Prairie CPA / Prairie Advisory

**Sourced facts.** The Nebraska Board's live
[Alternate Practice Structure Guidelines](https://nbpa.nebraska.gov/firms/alternate-practice-structure-guidelines)
describe an APS as a CPA/CPA firm associated with a non-CPA business. Professional
CPA services must be supplied through a properly licensed CPA firm or sole
proprietorship, not directly through the non-CPA business. Engagement letters and
communications must identify the licensed provider clearly and must not imply
that the non-CPA business is licensed. Some materials may be shared while keeping
that distinction clear.

The page expressly warns that experience requirements in its linked September
2022 PDF are **no longer current and changed in July 2026**; consult its live
[Experience Requirements](https://nbpa.nebraska.gov/individuals/experience) rather
than carrying the old PDF's qualification rules into a filing guide. This is
Nebraska-specific guidance, not a national US CPA rule.

**Illustrative Suchi organization.** Prairie CPA **P01** and Prairie Advisory
**P02** could use separate engagement-letter archives: **P01.11.149** and
**P02.11.150**, assuming returned document IDs 149 and 150. The source supports
clear service-provider attribution; it neither approves these fictional firms nor
authorizes unrestricted information sharing. SYS does not establish professional
independence, firm licensing or a lawful APS.

**Nearby non-case.** Clients, services or staff teams within the licensed firm do
not automatically become separate systems. Preserve the actual provider identity
and appropriate access regardless of the filing choice.

## 2. UK property-owning companies

**Sourced facts.** [Companies Act 2006, section 386(1)–(3)](https://www.legislation.gov.uk/ukpga/2006/46/section/386)
requires every company to keep adequate accounting records: sufficient to explain
its transactions, disclose its financial position with reasonable accuracy and
enable compliant accounts, including day-to-day receipts/expenditure and
assets/liabilities. The statutory site's revised-legislation notices still need
attention; this is not a comprehensive legal-status opinion.
[GOV.UK's company and accounting records guide](https://www.gov.uk/running-a-limited-company/company-and-accounting-records)
explains the company's separate legal/financial identity and lists governance and
accounting evidence such as contracts, bank statements and correspondence.

**Illustrative Suchi organization.** Suppose the same administrative team manages
Fenbridge Homes **H01** and Fenbridge Commercial **C01**, distinct property-owning
companies. Give each its own tree and company-specific lease records:

```text
H01 Fenbridge Homes       / 10-19 Property records / 11 Leases / H01.11.201
C01 Fenbridge Commercial  / 10-19 Property records / 11 Leases / C01.11.202
```

The final numbers assume already-returned IDs 201 and 202. The leases are
illustrative relevant contracts; s386 does not prescribe category 11 or require
separate filing systems/servers. A shared operator can be admitted to both systems
without making company metadata or document permissions global.

**Nearby non-case.** Several properties, tenants or maintenance suppliers belonging
to one company need not each become a system. Use asset/counterparty metadata
within the company archive while preserving adequate records and necessary access
controls. SYS is not a substitute for accounting books or legal attribution.

## 3. US franchise operating businesses

**Sourced facts.** [IRS Publication 583](https://www.irs.gov/publications/p583),
revised December 2024, under “Choosing an Accounting Method → More than one
business” and “Kinds of Records To Keep,” says to keep a complete and separate set
of books and records for each business. It also allows a suitable recordkeeping
system that clearly shows income and expenses, subject to applicable exceptions.
Supporting document filing does not replace accounting books.

[16 CFR §436.1(h), (i), (n) and (s), official 1 January 2025 edition](https://www.govinfo.gov/content/pkg/CFR-2025-title16-vol1/pdf/CFR-2025-title16-vol1-sec436-1.pdf)
defines franchise relationships through trademark association, significant
franchisor control/assistance and required payment, and permits a franchisee to be
an individual or entity. A franchise is not, by definition, its own incorporated
company. This is the retrieved **2025 edition**, not a claim that the September
2026 consolidation was verified; no historical dollar threshold is inferred here.

**Illustrative Suchi organization.** Assume Mesa Coffee **F01** and Mesa Fitness
**F02** are distinct operating businesses, not merely two brands of one undivided
operation. A central administrator might file royalty statements as
**F01.21.301** and **F02.21.302** (returned document IDs 301 and 302), in each
system's `20-29 Business money / 21 Royalty statements` category. Same-named
franchisor correspondents or rule starters remain system-scoped.

The legal/accounting identity is an explicit assumption in this illustration;
two franchise brands alone do not establish it. Neither source mandates the SYS
boundary or certifies that a shared deployment satisfies recordkeeping duties.

**Nearby non-case.** Several outlets in one coherent operating business are not
automatically separate systems. Location metadata may suffice for filing; the
sources do not decide whether particular operations are separate businesses for
tax purposes. Assess that before turning a site list into a system list.

## 4. German operating and property GmbHs

**Sourced facts.** [GmbHG §13(1)](https://www.gesetze-im-internet.de/gmbhg/__13.html)
states that a GmbH has its own rights and obligations and can hold property and
sue/be sued. [§41](https://www.gesetze-im-internet.de/gmbhg/__41.html) requires
managing directors to ensure proper bookkeeping for the company.
[§51a](https://www.gesetze-im-internet.de/gmbhg/__51a.html) provides shareholder
information and inspection rights, with the specified anticipated-misuse and
substantial-detriment refusal conditions in subsection (2) and limits on variation
in subsection (3). These English descriptions paraphrase the official German
texts; they are not official translations.

**Illustrative Suchi organization.** Posit Eichenwerk Maschinenbau **G01** and
Eichenwerk Immobilien **G02** as distinct companies. Their annual accounts could
be **G01.21.401** and **G02.21.402** (returned IDs 401 and 402), under each tree's
`20-29 Company money / 21 Annual accounts`. The source supports company-specific
identity, bookkeeping and inspection responsibilities; these provisions are not a
complete accounts-preparation or retention schedule.

A common administrator may help both firms while system-scoped membership and
document permissions separate ordinary access. Do not translate shareholder
inspection rights into an automatic unrestricted software account: actual requests,
conditions and access arrangements need appropriate handling. Separate company
records do not mandate separate physical servers.

**Nearby non-case.** Departments, machines, branches or properties within the same
GmbH are not automatically systems. Entity ownership and appropriate document
controls matter more than the number of assets or organizational boxes.

## 5. Australian trustee capacities

**Sourced facts.** [Income Tax Assessment Act 1997, section 960-100, Compilation
266 dated 1 July 2026](https://www.legislation.gov.au/C2004A05138/2026-07-01/2026-07-01/text/original/epub/OEBPS/document_10/document_10.html)
includes a trust in its tax-entity definition (1)(f), explains the trustee entity
(2), and treats a legal person acting in different capacities as a different entity
in each capacity (3). Its examples distinguish the trustee of each trust; subsection
(4) distinguishes a company from that company acting as trustee.

[ABN Lookup, “Other trust”](https://abr.business.gov.au/Help/EntityTypeDescription/00030)
explains the trustee holding property/income for beneficiaries and states that a
trust is **not a separate legal entity**. There is no contradiction: a tax-law
“entity” need not be a separate legal person. The Act's interpretation provision
is not itself a retention schedule or separate-server requirement.

**Illustrative Suchi organization.** Use the relevant capacities explicitly:

```text
T01 Wattle Administration as trustee for Family Trust
  10-19 Trust governance / 11 Executed deeds / T01.11.501
T02 Wattle Administration as trustee for Property Unit Trust
  10-19 Trust governance / 11 Executed deeds / T02.11.502
```

These are assumed returned IDs 501 and 502. The distinction is one legal person's
two trustee capacities, not two newly invented legal persons. A shared
administrator can select the appropriate capacity before intake and receive
membership only where appropriate; SYS cannot decide the legal capacity in which
a document was executed or cure misattribution.

**Nearby non-case.** Beneficiaries, properties, investment accounts or income
streams within one trustee capacity do not automatically become systems. A new
asset or beneficiary does not by itself create a different trust. Restricted or
sensitive information may still warrant document-level controls.

## 6. England/Wales education charity and trading subsidiary

**Sourced facts.** The Charity Commission's
[Guidance for charities with a connection to a non-charity](https://www.gov.uk/guidance/guidance-for-charities-with-a-connection-to-a-non-charity)
applies to **England and Wales** and expressly includes charities owning trading
subsidiaries. Principle 2, “Oversight and review of your subsidiary trading
company,” describes the company as legally separate, with its own directors and
the charity as shareholder; trustees monitor performance/support, prioritize the
charity's interests and handle conflicts.

Principle 5 requires separate financial structures and clarity about which
organization donors or others are dealing with. Principle 6 expressly discusses
sharing staff, services, property and data: appropriate agreements, protection
against inappropriate costs/liabilities and data-protection compliance remain
necessary. Shared resources do not erase distinct responsibilities.

**Illustrative Suchi organization.** Beacon Learning **E01**, an education charity,
and Beacon Events **E02**, its trading subsidiary, might file governance minutes
as **E01.11.601** and **E02.11.602** (returned IDs 601 and 602), in each tree's
`10-19 Governance / 11 Minutes`. Posit shared administrative staff, but admit them
to each archive only as appropriate and keep beneficiary/donor document permissions
separate from the trading team's needs.

Neither SYS nor a corporate connection creates a lawful basis for unrestricted
personal-data sharing. The [ICO's lawful-basis guidance](https://ico.org.uk/for-organisations/uk-gdpr-guidance-and-resources/data-sharing/data-sharing-a-code-of-practice/lawful-basis-for-sharing-personal-data/)
says to identify a lawful basis before sharing and document the consideration.
That page is marked under review following the Data (Use and Access) Act; it is
cited only for this narrow general point, not as a complete current legal analysis.
Software permissions cannot replace that assessment or trustee duties.

**Nearby non-case.** Programmes, courses, campaigns or departments within the same
charity need not each become a system. Restricted-fund accounting and sensitive
programme records still require their own controls; one archive is not permission
to commingle funds or expose all beneficiary records.

## Choosing a boundary without adding a tenant framework

Across these cases the small model is: select the appropriate managed archive,
then use its existing area/category filing tree. Membership permits entry;
existing document permissions permit opening a record. Ordinary owners, ACL
grantees and workflow assignees cannot bypass missing system membership. Admins
remain trusted, and even admins cannot escape an explicit request or bound-token
system boundary.

A first prefixed import names the existing archive by default, or explicitly
preserves it under a different code while creating the incoming system. It is not
a bulk transfer tool for already mixed entities. New systems initially admit only
instance admins. Codes are immutable; names can change. There is no opt-out,
per-system role hierarchy, deletion/merge or cross-system document transfer implied
by these examples. Read the [specification](../taxonomy-spec.md) for precise semantics.

Each named system receives its own managed `00.00 archive.huml` tree map, not a
separate encryption key, database or full backup. A consistent full database,
blobs, credential key and configuration backup carries the privileged cross-system
state. Administrators, host/backup operators, copies and already delivered bytes
remain part of the trust assessment.

## Sources and review status

Prepared **2026-10-20** from the linked primary material. The FRC passages, live
Nebraska pages, UK recordkeeping sources, IRS guidance, dated 2025 CFR source,
German statutes, dated Australian compilation and Charity Commission guidance
support only the narrow statements attributed above. No practitioner review,
compliance certification, deployment approval or prevalence study is claimed.
The newer US franchise-rule consolidation was not successfully retrieved; the
explicitly dated official edition is used instead. Current-law and
jurisdiction-specific assessment remains necessary before operational reliance.

Reference content is **CC0-1.0**; official linked material retains its own terms.
