{pkgs, ...}: {
  # plugins.none-ls = {
  #   enable = true;
  #   enableLspFormat = true;
  #   sources = {
  #     formatting = {
  #       prettierd.enable = true;
  #       prettier = {
  #         enable = true;
  #         settings = {
  #           extra_filetypes = ["html" "markdown" "css" "javascript" "php"];
  #         };
  #       };};
  #     formatting.alejandra.enable = true;
  #     diagnostics.statix.enable = true;
  #     diagnostics.deadnix.enable = true;
  #     code_actions.statix.enable = true;
  #   };
  # };
  plugins.conform-nvim = {
    enable = true;
    settings = {
      formatters_by_ft = {
        "_" = ["trim_whitespace"];
        nix = ["alejandra"];
      };
      format_on_save = {
        lspFallback = true;
        timeoutMs = 500;
      };
      notify_on_error = true;
    };
  };
  extraPackages = with pkgs; [prettier prettierd alejandra];
}
