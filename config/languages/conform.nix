{
  plugins.conform-nvim = {
    enable = true;
    settings = {
      formatters_by_ = builtins.listToAttrs (map (name: {
          inherit name;
          value = {
            __unkeyed-1 = "prettierd";
            __unkeyed-2 = "prettier";
          };
        }) [
          "html"
          "javascript"
          "css"
          "php"
          "markdown"
        ]);
      format_on_save = {
        lspFallback = true;
        timeoutMs = 500;
      };
      notify_on_error = true;
    };
    settings.formatters_by_ft = {
      "_" = ["trim_whitespace"];
      nix = ["alejandra"];
    };
  };
}
