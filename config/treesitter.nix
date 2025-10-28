{
  plugins = {
    treesitter = {
      enable = true;

      nixvimInjections = true;
      folding = true;
      settings = {
        indent.enable = true;
        highlight.enable = true;
        ensure_installed = "all";
        auto_install = true;
      };
    };

    treesitter-refactor = {
      enable = true;
      settings.highlight_definitions = {
        enable = true;
        clearOnCursorMove = false;
      };
    };

    hmts.enable = true;
  };
}
