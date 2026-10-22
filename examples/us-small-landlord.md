# US small landlord

[HuML file](us-small-landlord.huml) · [Equivalent TOML](us-small-landlord.toml) · [Normative reference](../taxonomy-spec.md)

Keep deeds, insurance and repair evidence separate from leases, deposits and rental income records. Properties and tenants are correspondents; state and local requirements need separate review before relying on any document list.

## Scope and omissions

No state-specific deposit deadline, notice language or eviction workflow. Schedule E is an example document kind, not a ruling on which tax schedule applies. No rental ledger calculation, insurance coverage assessment or property access grants.

All categories have document-kind descriptions. The tree carries no keywords
or automations; write your own matching rules in Suchi's Automations page and
check what they catch before relying on them. Sensitivity defaults, review
cadences, custom fields, links and trust/access state are left out because
taxonomy v1 doesn't support them. Configure permissions independently before adding real records.

## Sources and review

The categories are a filing suggestion, not schema or legal authority. The
following official sources are context or operator starting points, not an exhaustive compliance review:

- [IRS: rental income and expenses](https://www.irs.gov/taxtopics/tc414)

Review status: **unreviewed reference example**, prepared 2026-10-20. No
practitioner review, self-use validation, compliance certification or classification
benchmark is claimed. Linked entry points need jurisdiction-specific follow-up.
Passing validation is separate from domain review; run the repository’s
`make check` with your Suchi binary before import or distribution.

Reference content is CC0-1.0; official linked material retains its own terms.
