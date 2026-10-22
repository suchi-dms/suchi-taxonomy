# Suchi taxonomy examples

Example filing trees for [Suchi](https://github.com/johnnybravo-xyz/suchi), in
the `suchi-taxonomy/v1` format. Each tree comes as an equivalent TOML and HuML
pair: ten generic trees plus two entity-bound variants of the CA firm tree, for
**12 pairs / 24 files**.

This is a static CC0 reference collection. It is not a runtime catalog, a
marketplace, or a Suchi dependency; Suchi never fetches from it.

> [!WARNING]
> All examples are **unreviewed**. They are filing suggestions, not legal
> advice, compliance checklists, practitioner-approved workflows or accuracy
> guarantees. Read each tree's notes before relying on it.

## Examples

| Intended user | Filing files | Sources, omissions and review status |
| --- | --- | --- |
| Indian CA firm | [TOML](examples/in-ca-firm.toml) · [HuML](examples/in-ca-firm.huml) | [Notes](examples/in-ca-firm.md) |
| Indian NGO and FCRA administration | [TOML](examples/in-ngo-fcra.toml) · [HuML](examples/in-ngo-fcra.huml) | [Notes](examples/in-ngo-fcra.md) |
| Indian residential landlord | [TOML](examples/in-landlord.toml) · [HuML](examples/in-landlord.huml) | [Notes](examples/in-landlord.md) |
| UK residential landlord | [TOML](examples/uk-landlord.toml) · [HuML](examples/uk-landlord.huml) | [Notes](examples/uk-landlord.md) |
| UK limited-company director | [TOML](examples/uk-ltd-director.toml) · [HuML](examples/uk-ltd-director.huml) | [Notes](examples/uk-ltd-director.md) |
| US small landlord | [TOML](examples/us-small-landlord.toml) · [HuML](examples/us-small-landlord.huml) | [Notes](examples/us-small-landlord.md) |
| US nonprofit 501(c)(3) | [TOML](examples/us-nonprofit-501c3.toml) · [HuML](examples/us-nonprofit-501c3.huml) | [Notes](examples/us-nonprofit-501c3.md) |
| Deutscher Haushalt | [TOML](examples/de-household.toml) · [HuML](examples/de-household.huml) | [Notes](examples/de-household.md) |
| Deutscher Verein | [TOML](examples/de-verein.toml) · [HuML](examples/de-verein.huml) | [Notes](examples/de-verein.md) |
| Cross-border and expat household | [TOML](examples/global-expat.toml) · [HuML](examples/global-expat.huml) | [Notes](examples/global-expat.md) |
| Sharma & Associates, system `S01` | [TOML](examples/in-ca-firm-s01.toml) · [HuML](examples/in-ca-firm-s01.huml) | [CA walkthrough](examples/in-ca-firm.md) |
| Sharma Advisory LLP, system `S02` | [TOML](examples/in-ca-firm-s02.toml) · [HuML](examples/in-ca-firm-s02.huml) | [CA walkthrough](examples/in-ca-firm.md) |

The `S01`/`S02` files are complete copies of the CA tree bound to a filing
system, not fragments or inherited overlays. The generic ten carry no system
header. Organization names and category addresses in the walkthroughs are
illustrative, not endorsements.

The [multi-system use cases](examples/multi-system-use-cases.md) separate legal
recordkeeping facts from illustrative filing choices, with a nearby non-case for
each.

Suchi's [five built-in trees](https://github.com/johnnybravo-xyz/suchi/tree/main/core/jd/presets)
are maintained in Suchi and are not duplicated here.

## Validate

You need a `suchi` binary that includes the `taxonomy` command. Validation runs
offline and creates no config, data directory or database.

```sh
make check SUCHI_BIN=/absolute/path/to/suchi
```

`SUCHI_BIN` is required, including in CI. Make never downloads or builds a
binary, and never falls back to a `suchi` on `PATH`. It validates all 24 files
and stops at the first failure. Passing checks structure only, not domain
correctness; record the binary revision you tested with any review.

There is no repository-local parser. The TOML files are Suchi's own
`presetfile.Marshal` output. The HuML files are written by hand for readability
and start with `%HUML v0.2.0`, so a parser for a different HuML version rejects
them instead of misreading them. Compare a pair by parsing both through Suchi,
not by byte hash.

The files carry no keywords or automations. Since Suchi 0.3.0, filing trees
describe structure only; write matching rules in Suchi's Automations page.

## Import

Preview first, then apply. Import from the CLI, from first-run setup, or from
Settings in the web app:

```sh
suchi taxonomy import examples/uk-landlord.toml           # preview only
suchi taxonomy import examples/uk-landlord.toml --apply
```

What to expect:

- **Imports merge.** Applying a tree adds to existing local state; it does not
  reset it. Imports never create, change or remove automations.
- **Suchi owns the system area.** It generates `40 System / 49 Inbox` and the
  separate `00.00 archive.huml` filing map. Never declare reserved areas,
  `inbox`, or category-level `system` flags.
- **Use correspondents for growing lists.** Clients, properties, donors, members
  and family members belong in correspondents, not in new categories.
- **Index and path refreshes are queued** and can take a moment to finish after
  Apply. The generated filing map is not a document inventory or backup.

### Multiple filing systems

The optional top-level `system = "S01"` header binds a tree to a filing system;
it is unrelated to the category-level flag above.

- The first prefixed import names the original archive after that system by
  default. Its preview also offers keeping the original under a different code
  and creating the incoming system separately.
- Later prefixed imports target their own code. An unprefixed import never
  disables systems.
- New systems admit only instance admins at first. Grant system membership
  separately from document permissions; neither replaces the other.
- Codes are permanent; display names are editable.
- Systems isolate application access on one shared server. They are not
  separate infrastructure or proof of audit independence.

## Authoring

Read the normative [Suchi taxonomy v1 reference](taxonomy-spec.md) together with Suchi's
[filing systems guide](https://github.com/johnnybravo-xyz/suchi/blob/main/docs/jd.mdx).

- Keep each category code on the same document kind within an `id`; bump
  `version` when you edit reference content.
- Reordering a flat list can renumber codes. Flat authoring is shorthand and is
  unrelated to flat rendering at runtime.
- Never add unsupported fields or runtime document IDs.
- Filing addresses locate a category: `AREA.AC` before systems are introduced,
  `SYS.AC` afterwards. Many documents share an address; the document ID is
  separate and installation-global.
- New examples and translations fit v1 as-is. New portable capabilities need a
  new schema version.

Each contribution needs meaningful descriptions, source links, known omissions
and an honest review status. Passing validation does not imply practitioner
endorsement.

## Licence

Reference files, notes and supporting content are dedicated under
[CC0-1.0](LICENSE). Linked source material and Suchi itself keep their own
licences. No trademark rights or domain warranties are granted.

Johnny.Decimal is a trademark of Coruscade Pty Ltd. Suchi is independent and not
affiliated with or endorsed by Johnny.Decimal.
