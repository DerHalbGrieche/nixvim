{
  plugins.nvim-tree = {
    enable = true;
    settings = {
      disable_netrw = false;
      hijack_netrw = true;

      diagnostics = {
        enable = true;
      };

      view = {
        width = 40;
        side = "left";
        number = false;
        relativenumber = false;
      };

      renderer = {
        indent_markers = {
          enable = true;
        };
        add_trailing = true;
        group_empty = true;
        highlight_git = true;
        root_folder_label = ":t";
      };

      hijack_directories = {
        enable = true;
        auto_open = true;
      };

      update_focused_file = {
        enable = true;
        ignore_list = [];
      };

      actions = {
        use_system_clipboard = true;
        change_dir = {
          enable = true;
        };
        open_file = {
          quit_on_open = true;
          resize_window = false;
        };
      };

      git = {
        enable = true;
        ignore = false;
      };

      filters = {
        dotfiles = false;
        custom = [
          ".trash"
          ".direnv"
        ];
      };
    };
  };

  keymaps = [
    {
      key = "<leader>e";
      action = "<cmd>NvimTreeToggle<cr>";
      options = {
        silent = true;
        noremap = true;
        desc = "NvimTree";
      };
    }
  ];
}
