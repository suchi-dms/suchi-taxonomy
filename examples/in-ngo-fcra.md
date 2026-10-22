# Indian NGO and FCRA administration

[HuML file](in-ngo-fcra.huml) · [Equivalent TOML](in-ngo-fcra.toml) · [Normative reference](../taxonomy-spec.md)

Separate registration and annual filing evidence from funding agreements and program reports. Donors and programs are correspondents, while the filing tree stays usable when the board or funding mix changes.

## Scope and omissions

No eligibility determination, donation acceptance decision, FCRA bank-account workflow, reporting cadence or automatic utilization calculation. Registration names and return labels do not establish which rules apply to this organization.

All categories have document-kind descriptions. The tree carries no keywords
or automations; write your own matching rules in Suchi's Automations page and
check what they catch before relying on them. Sensitivity defaults, review
cadences, custom fields, links and trust/access state are left out because
taxonomy v1 doesn't support them. Configure permissions independently before adding real records.

## Sources and review

The categories are a filing suggestion, not schema or legal authority. The
following official sources are context or operator starting points, not an exhaustive compliance review:

- [Ministry of Home Affairs FCRA portal (reference entry point)](https://fcraonline.nic.in/)
- [Income Tax e-filing (reference entry point)](https://www.incometax.gov.in/iec/foportal/)

Review status: **unreviewed reference example**, prepared 2026-10-20. No
practitioner review, self-use validation, compliance certification or classification
benchmark is claimed. Linked entry points need jurisdiction-specific follow-up.
Passing validation is separate from domain review; run the repository’s
`make check` with your Suchi binary before import or distribution.

Reference content is CC0-1.0; official linked material retains its own terms.
