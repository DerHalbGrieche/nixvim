{
  self,
  pkgs,
  ...
}: {
  # Import all your configuration modules here
  imports = [
    #./theme.nix
    ./autosave.nix
    ./bufferline.nix
    ./copilot.nix
    ./dashboard.nix
    ./git.nix
    ./languages
    ./lualine.nix
    ./nvim-tree.nix
    ./noice.nix
    ./telescope.nix
    ./treesitter.nix
    ./ufo.nix
    ./which-key.nix
  ];
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
    cord.enable = true;
    leetcode.enable = true;
    lz-n.enable = true;
    nix.enable = true;
    nui.autoLoad = true;
    nui.enable = true;
    nvim-autopairs.enable = true;
    snacks.enable = true;
  };
  opts = {
    number = true;
    relativenumber = true;
  };
}
