# Indian residential landlord

[HuML file](in-landlord.huml) · [Equivalent TOML](in-landlord.toml) · [Normative reference](../taxonomy-spec.md)

Keep ownership papers, society correspondence and tenancy evidence in stable document-kind categories. Properties and tenants stay in correspondents so another letting does not require renumbering the archive.

## Scope and omissions

No assumption that every tenancy has an eleven-month term. State registration, stamp duty, police verification and municipal rules differ; the operator must identify applicable authorities. No automatic renewal, tax calculation or tenant-data permissions.

All categories have document-kind descriptions. Keywords are literal starter
phrases, not measured classification accuracy; review false matches before use.
No explicit automation seeds: category keywords provide the limited starters.
Sensitivity defaults, review cadences, custom fields, standalone seed families,
links and trust/access state are intentionally absent because taxonomy v1 does
not support them. Configure permissions independently before adding real records.

## Sources and review

The categories are a filing suggestion, not schema or legal authority. The
following official sources are context or operator starting points, not an exhaustive compliance review:

- [Department of Land Resources (reference entry point)](https://dolr.gov.in/)
- [Income Tax Department: forms and house-property context](https://www.incometax.gov.in/iec/foportal/help/individual/return-applicable-1)

Review status: **unreviewed reference example**, prepared 2026-10-20. No
practitioner review, self-use validation, compliance certification or classification
benchmark is claimed. Linked entry points need jurisdiction-specific follow-up.
Passing validation is separate from domain review; run the repository’s
`make check` with your Suchi binary before import or distribution.

Reference content is CC0-1.0; official linked material retains its own terms.
