{
  lsp.servers.phpactor = {
    enable = true;
    activate = true;
    config = {
      cmd = ["phpactor" "language-server"];
      filetypes = ["php"];
    };
  };
}
