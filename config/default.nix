{
  self,
  pkgs,
  ...
}: {
  # Import all your configuration modules here
  imports = [
    ./bufferline.nix
    #./theme.nix
    ./languages
    ./nvim-tree.nix
    ./telescope.nix
    ./which-key.nix
    ./copilot.nix
    ./treesitter.nix
    ./lualine.nix
    ./ufo.nix
    ./dashboard.nix
    ./git.nix
    ./autosave.nix
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
  };
  opts = {
    number = true;
    relativenumber = true;
  };
}
