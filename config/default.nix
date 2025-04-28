{self, ...}: {
  # Import all your configuration modules here
  imports = [./bufferline.nix ./theme.nix ./languages ./nvim-tree.nix ./telescope.nix ./presence.nix ./which-key.nix ./copilot.nix ./treesitter.nix ./lualine.nix ./ufo.nix ./dashboard.nix];
  globals.mapleader = " ";
  viAlias = true;
  vimAlias = true;

  luaLoader.enable = true;
  dependencies = {
    fzf.enable = true;
    ripgrep.enable = true;
    tree-sitter.enable = true;
    nodejs.enable = true;
    gcc.enable = true;
    rust-analyzer.enable = true;
  };
  plugins = {
    lz-n.enable = true;
    nui.enable = true;
    nui.autoLoad = true;
  };
  extraConfigLua =
    # lua
    ''
      vim.o.fillchars = [[eob: ,fold: ,foldopen:,foldsep: ,foldclose:]]
      vim.o.foldcolumn = "0"
    '';
}
