{
  plugins = {
    neogit = {
      enable = true;
    };
    gitsigns = {
      enable = true;
    };
  };
  keymaps = [
    {
      mode = "n";
      key = "<leader>go";
      action = "<cmd>Neogit<CR>";
      options = {
        silent = true;
        desc = "Open Neogit";
      };
    }
    {
      mode = "n";
      key = "<leader>gb";
      action = "<cmd>Gitsigns blame_line<CR>";
      options = {
        desc = "Git Blame";
      };
    }
  ];
}
