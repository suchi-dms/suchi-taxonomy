# Suchi taxonomy examples

Ten complete document-kind filing trees for `suchi-taxonomy/v1`, in HuML, plus
an equivalent UK landlord TOML file. This is a static CC0 reference collection,
not a runtime catalog, marketplace, pack repository or Suchi dependency.

All examples are **unreviewed**. They are filing suggestions, not legal advice,
compliance checklists, practitioner-approved workflows or accuracy guarantees.
Read the adjacent notes before enabling literal keyword starters. Only the UK
example adds an explicit automation, to identify a document type.

## Examples

| Intended user                      | Filing file                                                                       | Sources, omissions and review status    |
| ---------------------------------- | --------------------------------------------------------------------------------- | --------------------------------------- |
| Indian CA firm                     | [in-ca-firm.huml](examples/in-ca-firm.huml)                                       | [Notes](examples/in-ca-firm.md)         |
| Indian NGO and FCRA administration | [in-ngo-fcra.huml](examples/in-ngo-fcra.huml)                                     | [Notes](examples/in-ngo-fcra.md)        |
| Indian residential landlord        | [in-landlord.huml](examples/in-landlord.huml)                                     | [Notes](examples/in-landlord.md)        |
| UK residential landlord            | [uk-landlord.huml](examples/uk-landlord.huml) · [TOML](examples/uk-landlord.toml) | [Notes](examples/uk-landlord.md)        |
| UK limited-company director        | [uk-ltd-director.huml](examples/uk-ltd-director.huml)                             | [Notes](examples/uk-ltd-director.md)    |
| US small landlord                  | [us-small-landlord.huml](examples/us-small-landlord.huml)                         | [Notes](examples/us-small-landlord.md)  |
| US nonprofit 501(c)(3)             | [us-nonprofit-501c3.huml](examples/us-nonprofit-501c3.huml)                       | [Notes](examples/us-nonprofit-501c3.md) |
| Deutscher Haushalt                 | [de-household.huml](examples/de-household.huml)                                   | [Notes](examples/de-household.md)       |
| Deutscher Verein                   | [de-verein.huml](examples/de-verein.huml)                                         | [Notes](examples/de-verein.md)          |
| Cross-border and expat household   | [global-expat.huml](examples/global-expat.huml)                                   | [Notes](examples/global-expat.md)       |

The [five core built-ins](https://github.com/johnnybravo-xyz/suchi/tree/main/core/jd/presets)
remain maintained in Suchi; they are not duplicated here.

## Validate and use

Use a Suchi binary that includes the `taxonomy` command.
Validation runs offline without server config, data-directory or database creation.

```sh
make check SUCHI_BIN=/absolute/path/to/suchi
/absolute/path/to/suchi taxonomy import examples/uk-landlord.huml
/absolute/path/to/suchi taxonomy import examples/uk-landlord.huml --apply
```

`SUCHI_BIN` is mandatory, including in CI; Make never downloads or builds a binary
or falls back to an installed `suchi`. It invokes Suchi for all ten HuML files and
the UK TOML file, stopping on failure. Record the tested binary revision and results
with a review; success checks structure, not domain correctness. UK equivalence
must also be checked through the core parser during integration, not by a second
parser added here. The two byte hashes intentionally differ.

Preview imports in setup or Settings before applying. Use correspondents for
growing clients, properties, donors, members and family members. Suchi generates
System/49 Inbox and the separate 00.00 filing index: never declare reserved areas,
`inbox` or `system` in author files. Later imports merge rather than reset, and
existing local/disabled rules survive. The index refresh may remain queued until
the server processes it.

## Authoring changes

Use the [core authoring guide](https://github.com/johnnybravo-xyz/suchi/blob/main/docs/jd.mdx),
not a repository-local schema. Retain category codes for their existing document
kinds within an ID; bump content revision for edited reference content. Flat list
reordering can change codes. Never add unsupported fields or runtime IDs.
New v1-compatible examples and translations do not need a new schema; new portable
capabilities do. Future packs, signatures/key rotation and managed upgrades are
separate work, not prerequisites for these static files.

Each contribution must include meaningful descriptions, restrained distinctive
keywords, supported starters only when useful, source links, omissions and an
honest review status. Do not infer practitioner endorsement from passing validation.

## Licence

Reference files, notes and supporting repository content are dedicated under
[CC0-1.0](LICENSE). Linked official source material and Suchi core code retain
their own licences. No trademark rights or domain warranties are granted.
