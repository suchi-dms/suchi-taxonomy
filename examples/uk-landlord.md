# UK residential landlord

[HuML file](uk-landlord.huml) · [Equivalent TOML](uk-landlord.toml) · [Normative reference](../taxonomy-spec.md)

Keep tenancy agreements, deposit records and safety reports alongside rent and tax paperwork. Use correspondents for each tenant, agent and property; review the rules for the relevant UK nation rather than treating this filing tree as a compliance checklist.

## Scope and omissions

HuML and TOML express the same header and tree. A gas safety record is a good candidate for your own document-type rule, but no rule certifies validity or schedules checks. Requirements differ across England, Wales, Scotland and Northern Ireland. No fixed safety cadence, statutory notice generator, deposit deadline or claim that all tenancies use one legal form.

All categories have document-kind descriptions. The tree carries no keywords
or automations; write your own matching rules in Suchi's Automations page and
check what they catch before relying on them. Sensitivity defaults, review
cadences, custom fields, links and trust/access state are left out because
taxonomy v1 doesn't support them. Configure permissions independently before adding real records.

## Sources and review

The categories are a filing suggestion, not schema or legal authority. The
following official sources are context or operator starting points, not an exhaustive compliance review:

- [GOV.UK: renting out your property](https://www.gov.uk/renting-out-a-property)

Review status: **unreviewed reference example**, prepared 2026-10-20. No
practitioner review, self-use validation, compliance certification or classification
benchmark is claimed. Linked entry points need jurisdiction-specific follow-up.
Passing validation is separate from domain review; run the repository’s
`make check` with your Suchi binary before import or distribution.

Reference content is CC0-1.0; official linked material retains its own terms.
