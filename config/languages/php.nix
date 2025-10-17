{
  lsp.servers.phpactor = {
    enable = true;
    activate = true;
    config = {
      command = ["phpactor" "language-server"];
      filetypes = ["php"];
    };
  };
}
