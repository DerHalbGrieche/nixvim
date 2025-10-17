{
  lsp.servers.eslint = {
    enable = true;
    activate = true;
    config = {
      cmd = [
        "vscode-eslint-language-server"
        "--stdio"
      ];
      filetypes = ["javascript" "javascriptreact" "typescript" "typescriptreact"];
      root_markers = [".eslintrc" ".eslintrc.js" ".eslintrc.json" "package.json"];
    };
  };
}
