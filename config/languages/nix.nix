{
  plugins = {
    nix.enable = true;
    conform-nvim.settings.formatters_by_ft.nix = ["alejandra"];

    none-ls.sources = {
      formatting.alejandra.enable = true;
      diagnostics.statix.enable = true;
      diagnostics.deadnix.enable = true;
      code_actions.statix.enable = true;
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
