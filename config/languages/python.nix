{
  plugins = {
    conform-nvim.settings.formatters_by_ft.python = ["black"];
    none-ls.sources.formatting.black.enable = true;
  };
  lsp.servers = {
    pylsp.enable = true;
    pyright.enable = true;
    ruff.enable = true;
  };
}
