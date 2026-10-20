# Suchi taxonomy examples

Ten generic document-kind filing trees and two complete Sharma firm variants for
`suchi-taxonomy/v1`, each in HuML and equivalent TOML: **12 pairs / 24 authoring
files**. This is a static CC0 reference collection,
not a runtime catalog, marketplace, pack repository or Suchi dependency.

All examples are **unreviewed**. They are filing suggestions, not legal advice,
compliance checklists, practitioner-approved workflows or accuracy guarantees.
Read the adjacent notes before enabling literal keyword starters. Only the UK
example adds an explicit automation, to identify a document type.

## Examples

| Intended user | Filing files | Sources, omissions and review status |
| --- | --- | --- |
| Indian CA firm | [HuML](examples/in-ca-firm.huml) · [TOML](examples/in-ca-firm.toml) | [Notes](examples/in-ca-firm.md) |
| Indian NGO and FCRA administration | [HuML](examples/in-ngo-fcra.huml) · [TOML](examples/in-ngo-fcra.toml) | [Notes](examples/in-ngo-fcra.md) |
| Indian residential landlord | [HuML](examples/in-landlord.huml) · [TOML](examples/in-landlord.toml) | [Notes](examples/in-landlord.md) |
| UK residential landlord | [HuML](examples/uk-landlord.huml) · [TOML](examples/uk-landlord.toml) | [Notes](examples/uk-landlord.md) |
| UK limited-company director | [HuML](examples/uk-ltd-director.huml) · [TOML](examples/uk-ltd-director.toml) | [Notes](examples/uk-ltd-director.md) |
| US small landlord | [HuML](examples/us-small-landlord.huml) · [TOML](examples/us-small-landlord.toml) | [Notes](examples/us-small-landlord.md) |
| US nonprofit 501(c)(3) | [HuML](examples/us-nonprofit-501c3.huml) · [TOML](examples/us-nonprofit-501c3.toml) | [Notes](examples/us-nonprofit-501c3.md) |
| Deutscher Haushalt | [HuML](examples/de-household.huml) · [TOML](examples/de-household.toml) | [Notes](examples/de-household.md) |
| Deutscher Verein | [HuML](examples/de-verein.huml) · [TOML](examples/de-verein.toml) | [Notes](examples/de-verein.md) |
| Cross-border and expat household | [HuML](examples/global-expat.huml) · [TOML](examples/global-expat.toml) | [Notes](examples/global-expat.md) |
| Sharma & Associates, S01 | [HuML](examples/in-ca-firm-s01.huml) · [TOML](examples/in-ca-firm-s01.toml) | [CA walkthrough](examples/in-ca-firm.md) |
| Sharma Advisory LLP, S02 | [HuML](examples/in-ca-firm-s02.huml) · [TOML](examples/in-ca-firm-s02.toml) | [CA walkthrough](examples/in-ca-firm.md) |

The generic ten remain unprefixed. The S01/S02 files are full entity-bound copies
of the CA tree, not fragments or inherited overlays. Read the normative
[Suchi taxonomy v1 reference](taxonomy-spec.md) for exact fields, limits, JD adaptations,
import behavior and access boundaries. The researched
[multi-system use cases](examples/multi-system-use-cases.md) distinguish legal
recordkeeping facts from illustrative filing choices, with a nearby non-case for
each. Organization names and document addresses in walkthroughs are illustrative,
not endorsements or allocated-ID promises.

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
or falls back to an installed `suchi`. Its discovery covers all 24 authoring files,
stopping on failure. Record the tested binary revision and results with a review;
success checks structure, not domain correctness. All TOML counterparts were
generated through Suchi's actual core `presetfile.Parse`/`Marshal`; there is no
repository-local parser. Integration must compare each pair through the core
parser, not byte hashes: serialization and source-provenance hashes may differ.

Preview imports in setup or Settings before applying. Use correspondents for
growing clients, properties, donors, members and family members. Suchi generates
`40 System / 49 Inbox` and the separate `00.00 archive.huml` filing map: never
declare reserved areas, `inbox`, or category-level protected `system` flags.
The optional **top-level** `system = "S01"` header is valid and has a different
meaning. First prefixed import atomically names the original archive by default;
its preview also offers preserving the original under a distinct code and creating
the incoming system separately. No enable toggle or later opt-out is needed.

Later prefixed imports target their code; an unprefixed import never disables
systems. New systems initially admit only instance admins. Grant direct system
membership separately from document permissions: neither replaces the other.
Codes are immutable, display names editable. SYS is application access isolation
on a shared server, not independent infrastructure or proof of audit independence.
Later imports merge rather than reset, and existing local/disabled rules survive.
Index/path refresh work can remain queued until processed. The generated tree map
is not an authoring-starter backup, document inventory or full backup.

## Authoring changes

Use the normative [reference](taxonomy-spec.md) alongside the
[core authoring guide](https://github.com/johnnybravo-xyz/suchi/blob/main/docs/jd.mdx).
Retain category codes for their existing document kinds within an ID; bump content
revision for edited reference content. Flat authoring is shorthand, distinct from
runtime flat rendering, and list reordering can change codes. Never add unsupported
fields or runtime document IDs. A full address such as `S01.13.147` uses an
already-returned installation-global document ID, not a category-local counter.
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
