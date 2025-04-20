{self, ...}: {
  # Import all your configuration modules here
  imports = [./bufferline.nix ./theme.nix ./languages ./nvim-tree.nix ./telescope.nix];
  plugins = {
    lualine.enable = true;
    treesitter.enable = true;
  };
  globals.mapleader = " ";
  viAlias = true;
  vimAlias = true;

  luaLoader.enable = true;
  plugins.lz-n.enable = true;
}
