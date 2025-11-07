{pkgs, ...}: {
  plugins = {
    lsp-format.enable = true;
    none-ls = {
      enable = true;
      enableLspFormat = true;
      sources = {
        formatting = {
          alejandra.enable = true;
          phpcbf.enable = true;
        };
        diagnostics = {
          statix.enable = true;
          deadnix.enable = true;
          phpstan.enable = true;
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
          php = ["prettier_html"];
        };
        formatters = {
          php-cs-fixer = {
            command = "php-cs-fixer";
            args = ["fix" "$FILENAME" "--using-cache=no" "--allow-risky=yes" "--quiet"];
            stdin = false;
          };
          prettier_html = {
            command = "prettier";
            args = ["--parser" "html"];
            stdin = true;
          };
        };
        format_on_save = {
          lspFallback = true;
          timeoutMs = 500;
        };
        notify_on_error = true;
      };
    };
  };
  extraPackages = with pkgs; [prettier prettierd alejandra php84Packages.php-cs-fixer];
}
