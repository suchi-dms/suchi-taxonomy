# UK limited-company director

[HuML file](uk-ltd-director.huml) · [Equivalent TOML](uk-ltd-director.toml) · [Normative reference](../taxonomy-spec.md)

Keep statutory company records, tax submissions and director payment evidence apart from day-to-day banking and expenses. The categories describe documents, not customers, suppliers or successive accounting years.

## Scope and omissions

Bank statements/reconciliations, supplier expenses and director expense/loan evidence complete the banking outline. No accounting ledger, payroll calculation, dividend legality decision, HMRC submission or filing calendar. Company tax records are separate from the director’s personal tax.

All categories have document-kind descriptions. The tree carries no keywords
or automations; write your own matching rules in Suchi's Automations page and
check what they catch before relying on them. Sensitivity defaults, review
cadences, custom fields, links and trust/access state are left out because
taxonomy v1 doesn't support them. Configure permissions independently before adding real records.

## Sources and review

The categories are a filing suggestion, not schema or legal authority. The
following official sources are context or operator starting points, not an exhaustive compliance review:

- [GOV.UK: running a limited company](https://www.gov.uk/running-a-limited-company)

Review status: **unreviewed reference example**, prepared 2026-10-20. No
practitioner review, self-use validation, compliance certification or classification
benchmark is claimed. Linked entry points need jurisdiction-specific follow-up.
Passing validation is separate from domain review; run the repository’s
`make check` with your Suchi binary before import or distribution.

Reference content is CC0-1.0; official linked material retains its own terms.
