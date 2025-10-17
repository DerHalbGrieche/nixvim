{
  plugins = {
    conform-nvim.settings.formatters_by_ft.cpp = ["clang_format"];
    none-ls.sources.formatting.clang_format.enable = true;
  };
  lsp.servers = {
    clangd = {
      enable = true;
      activate = true;
      config = {
        cmd = [
          "clangd"
          "--background-index"
        ];
        filetypes = [
          "c"
          "cpp"
        ];
        root_markers = [
          "compile_commands.json"
          "compile_flags.txt"
        ];
      };
    };
  };
}
