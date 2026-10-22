# Deutscher Haushalt

[HuML file](de-household.huml) · [Equivalent TOML](de-household.toml) · [Normative reference](../taxonomy-spec.md)

Ausweise, Steuerbescheide und Wohnunterlagen bekommen feste Plätze, die auch beim Umzug verständlich bleiben. Personen, Arbeitgeber und Anbieter werden als Korrespondenten erfasst; Fristen und Zugriffsrechte werden außerhalb dieser Vorlage geprüft.

## Scope and omissions

German names and literal phrases are intentional. No retention schedule, benefit eligibility, medical advice or access control is encoded. Bank/contract and housing categories group document kinds; household members and providers remain correspondents.

All categories have document-kind descriptions. The tree carries no keywords
or automations; write your own matching rules in Suchi's Automations page and
check what they catch before relying on them. Sensitivity defaults, review
cadences, custom fields, links and trust/access state are left out because
taxonomy v1 doesn't support them. Configure permissions independently before adding real records.

## Sources and review

The categories are a filing suggestion, not schema or legal authority. The
following official sources are context or operator starting points, not an exhaustive compliance review:

- [ELSTER (reference entry point)](https://www.elster.de/)
- [Deutsche Rentenversicherung (reference entry point)](https://www.deutsche-rentenversicherung.de/)

Review status: **unreviewed reference example**, prepared 2026-10-20. No
practitioner review, self-use validation, compliance certification or classification
benchmark is claimed. Linked entry points need jurisdiction-specific follow-up.
Passing validation is separate from domain review; run the repository’s
`make check` with your Suchi binary before import or distribution.

Reference content is CC0-1.0; official linked material retains its own terms.
