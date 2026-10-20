# Indian CA firm

[HuML file](in-ca-firm.huml)

Keep client returns, audit working papers and signed engagements separate from the practice’s own finances and staff records. Identify clients with correspondents so new engagements do not require new categories.

## Scope and omissions

Includes ROC/secretarial filings, certificates/UDIN and peer review. Practice tax has no keyword rule: the same phrases occur in client returns, so identify these documents manually. No tax calculation, portal filing, engagement access control or statutory audit checklist.

All categories have document-kind descriptions. Keywords are literal starter
phrases, not measured classification accuracy; review false matches before use.
No explicit automation seeds: category keywords provide the limited starters.
Sensitivity defaults, review cadences, custom fields, standalone seed families,
links and trust/access state are intentionally absent because taxonomy v1 does
not support them. Configure permissions independently before adding real records.

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
