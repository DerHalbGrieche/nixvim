{
  plugins = {
    neogit = {
      enable = true;
    };
  };
  keymaps = [
    {
      mode = "n";
      key = "<leader>g";
      action = "<cmd>Neogit<CR>";
      options = {
        silent = true;
        desc = "Open Neogit";
      };
    }
  ];
}
