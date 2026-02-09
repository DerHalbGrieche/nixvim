{pkgs, ...}: {
  plugins = {
    lsp-format.enable = true;
    none-ls = {
      enable = true;
      enableLspFormat = true;
      sources = {
        formatting = {
          phpcbf.enable = true;
          prettier.enable = true;
        };
        diagnostics = {
          statix.enable = true;
          deadnix.enable = true;
          phpstan.enable = true;
          phpstan.package = pkgs.phpstan;
          phpcs.enable = true;
        };
        code_actions.statix.enable = true;
      };
    };
    conform-nvim = {
      enable = true;
      settings = {
        formatters_by_ft = {
          "_" = ["trim_whitespace"];
          nix = ["alejandra"];
          json = ["jq"];
          java = ["google-java-format"];
          xml = ["lsp_format"];
        };
        format_on_save = {
          lspFallback = true;
          timeoutMs = 500;
        };
        notify_on_error = true;
      };
    };
  };
  extraPackages = with pkgs; [
    prettier
    prettierd
    alejandra
    php84Packages.php-cs-fixer
    jq
    google-java-format
  ];
}
