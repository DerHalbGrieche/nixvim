{
  plugins.dashboard = {
    enable = true;
    autoLoad = true;
    settings = {
      theme = "hyper";
      config = {
        week_header.enable = true;
        footer = [""];
        shortcut = [
          {
            action.__raw = "function() vim.cmd[[ene]] end";
            key = "n";
            desc = "New";
            icon = "🆕";
          }
        ];
      };
    };
  };
}
