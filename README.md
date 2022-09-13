<p align="center">
  <img src="header.png" alt="header" height="285"/>
</p>

## Helix Themes

A few themes ported to the [helix editor](https://github.com/helix-editor/helix).

*For preview images go here: [PREVIEWS.md](PREVIEWS.md)*

### Included themes and variants

- [Edge](https://github.com/sainnhe/edge)
  - Default
  - Aura
  - Neon
  - Light
- [Everforest](https://github.com/sainnhe/everforest)
  - Dark
    - Hard
    - Medium
    - Soft
    - HC (customized high contrast version)
  - Light
    - Hard
    - Medium
    - Soft
- [Gruvbox (Material)](https://github.com/sainnhe/gruvbox-material) (all variants: `material` / `mix` / `original`)
  - Dark
    - Hard
    - Medium
    - Soft
  - Light
    - Hard
    - Medium
    - Soft
- [Sonokai](https://github.com/sainnhe/sonokai)
  - Default
  - Atlantis
  - Andromeda
  - Shusia
  - Maia
  - Espresso

### Download

The latest build of the `main` branch can be downloaded from the GitHub releases page [here](https://github.com/CptPotato/helix-themes/releases/tag/latest).

### Building manually

Themes are split into a color scheme or "mapping" ("constants are purple") and one or more palettes ("purple is `#b39df3`").
Each theme is built by simply merging the [scheme](schemes) with one of the corresponding [palettes](palettes).

You can generate all themes by running `build.sh` from the root of the repository.

Or just generate a single one:

```bash
cat "schemes/gruvbox" "palettes/gruvbox/material_dark_medium" > "theme.toml"
```

On Windows you can run the shell script (or `cat` command above) from the git bash that comes with git or use the executable directly (`<git path>/usr/bin/sh.exe build.sh`).
