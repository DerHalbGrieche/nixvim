{
  plugins = {
    nix.enable = true;
    conform-nvim.settings.formatters_by_ft.nix = ["alejandra"];

    none-ls.sources = {
    };
  };
  lsp.servers = {
    nixd = {
      enable = true;
      activate = true;
    };

    nil_ls = {
      enable = true;
      activate = true;
    };
  };
}
