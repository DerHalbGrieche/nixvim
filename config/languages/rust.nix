{
  lsp.servers.rust_analyzer = {
    enable = true;
    activate = true;
    config = {
      cmd = [
        "rust-analyzer"
      ];
      filetypes = [
        "rust"
      ];
      root_markers = [
        "Cargo.toml"
      ];
    };
  };
}
