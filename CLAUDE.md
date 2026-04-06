# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## What This Is

A modularized Neovim config based on [kickstart.nvim](https://github.com/nvim-kickstart/kickstart.nvim). Plugin management via [lazy.nvim](https://lazy.folke.io/).

## Formatting

Run `stylua <file>` — config in `.stylua.toml` (2-space indent, single quotes, no call parens, 160 col width).

## Architecture

`init.lua` → `lua/core/init.lua` → loads options, keymaps, then lazy.nvim.

- `lua/core/options.lua` — editor settings (tabs, clipboard, search, UI)
- `lua/core/keymaps.lua` — global keybindings. Leader (`<Space>`) is set here and **must** load before plugins
- `lua/core/lazy.lua` — bootstraps lazy.nvim and declares which directories to auto-import

### Plugins

`lua/plugins/*.lua` — **auto-discovered** by lazy.nvim. Each file returns a [lazy.nvim plugin spec](https://lazy.folke.io/spec). Drop a new file here to add a plugin — no registration step needed.

`lua/plugins/lsp/` — also auto-imported. Contains the full LSP pipeline (Mason → mason-lspconfig → lspconfig → blink.cmp). To add a language server, add an entry to the `servers` table in `lsp.lua`.

`lua/kickstart/plugins/` — **not** auto-imported. These are opt-in modules (debug, lint). To activate one, add its path to the import list in `core/lazy.lua`.

### Where to Put Things

| Change | Location |
|---|---|
| New plugin | New file in `lua/plugins/` |
| New language server | `servers` table in `lua/plugins/lsp/lsp.lua` |
| Global keybinding | `lua/core/keymaps.lua` |
| Plugin-specific keybinding | Inside the plugin's own spec file (`keys` field or `config` function) |
| Editor option | `lua/core/options.lua` |
| Formatter for a filetype | `formatters_by_ft` in `lua/plugins/lsp/lsp.lua` (conform.nvim section) |
| Linter for a filetype | `linters_by_ft` in `lua/kickstart/plugins/lint.lua` |

## Conventions

- `vim.g.have_nerd_font = true` — icon-dependent plugins check this flag
- Plugin-specific keymaps belong in the plugin's spec file, not in `core/keymaps.lua`
- Each plugin gets its own file — don't bundle unrelated plugins together
- Colorscheme is set in `lua/plugins/tokyonight.lua` with `priority = 1000` to load first

## Documentation References

- Lazy.nvim plugin spec: https://lazy.folke.io/spec
- Plugin search: https://dotfyle.com/ or https://github.com/rockerBOO/awesome-neovim
- LSP server list: `:help lspconfig-all` or https://github.com/neovim/nvim-lspconfig/blob/master/doc/configs.md
- Mason package registry: https://mason-registry.dev/registry/list
- Neovim Lua guide: `:help lua-guide`
