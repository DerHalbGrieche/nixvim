{
  plugins = {
    bacon.enable = true;
    conform-nvim.settings.formatters_by_ft.rust = ["rustfmt"];

    lsp.servers.rust_analyzer = {
      enable = true;
      installCargo = true;
      installRustc = true;
      installRustfmt = true;
    };
    lsp.servers.wgsl_analyzer.enable = true;
  };
}
