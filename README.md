# NixVim Configuration

This repository contains my personal Neovim configuration using [nixvim](https://github.com/nix-community/nixvim), which allows for declarative configuration of Neovim using the Nix language.

## Features

- Fully declarative setup powered by Nix
- Modern UI with themes and statusline
- Language support for Rust, Nix, and more
- AI code assistance via Copilot and Claude 3.7 Sonnet
- File navigation with nvim-tree
- Fuzzy finding with Telescope
- Git integration
- Syntax highlighting with Treesitter
- Discord Rich Presence support

## Key Plugins

- **File Navigation**: nvim-tree for file browsing
- **Fuzzy Finding**: Telescope for searching files, buffers, and more
- **AI Code Assistance**:
  - GitHub Copilot (Lua implementation)
  - Avante plugin (integrated with Claude 3.7 Sonnet)
- **Syntax**: Treesitter for advanced syntax highlighting
- **UI**:
  - Custom theme
  - Bufferline for tab/buffer management
  - Lualine for statusline
  - WhichKey for keybinding help
- **Markdown**: Render-markdown for improving AI response readability

## Requirements

- Nix package manager with flakes enabled
- Git

## Installation

1. Clone this repository:

```bash
git clone https://github.com/yourusername/nixvim.git
cd nixvim
```

2. Run Neovim with this configuration:

```bash
nix run .
```

3. To install this configuration and make it available in your system:

```bash
# For NixOS users, add this flake to your system configuration
# For home-manager users:
nix profile install .
```

## Usage

### Key Mappings

- Space (`<leader>`) is the leader key
- `<leader>ac` - Add current file to Avante AI context
- Navigation in diffs:
  - `]x` - Next diff
  - `[x` - Previous diff
  - `cb` - Accept both changes
  - `co` - Accept our changes
  - `tc` - Accept their changes
  - `c0` - Accept no changes

## Customization

Edit the files in the `config/` directory to customize your setup:

- `default.nix` - Main configuration and imports
- `copilot.nix` - AI assistant configuration
- `theme.nix` - Visual appearance settings
- `telescope.nix` - Fuzzy finder settings
- `languages/` - Language-specific configurations

After making changes, run `nix flake check` to verify your configuration is valid.

## License

MIT

```

This README provides a comprehensive overview of your Nixvim configuration, highlighting its key features, plugins, and usage instructions. It explains the AI code assistance functionality in detail, mentions the supported languages, and provides instructions for installation and customization.

The structure follows standard README conventions with sections for features, installation, usage, and customization. I've included explanations of key mappings and file organization to help users understand and modify the configuration.

**Generation complete!** Please review the code suggestions above.

```
