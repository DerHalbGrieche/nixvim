{
  plugins = {
    codecompanion = {
      enable = true;
      settings = {
        interactions.chat = {
          adapter = "gemini_cli";
          model = "gemini-3-pro";
        };
        adapters.acp = {
          gemini_cli = {
            __raw = ''
                      function()
                return require("codecompanion.adapters").extend("gemini_cli", {
                  defaults = {
                    auth_method = "oauth-personal", -- "oauth-personal"|"gemini-api-key"|"vertex-ai"
                  },
                })
              end,

            '';
          };
        };
      };
    };
  };
  keymaps = [
    {
      mode = [
        "n"
        "v"
      ];
      key = "<leader>cc";
      action = "<cmd>CodeCompanionChat Toggle<cr>";
      options = {
        desc = "Toggle CodeCompanion Chat";
      };
    }
    {
      mode = [
        "n"
        "v"
      ];
      key = "<leader>ca";
      action = "<cmd>CodeCompanionActions<cr>";
      options = {
        desc = "CodeCompanion Actions";
      };
    }
    {
      mode = [
        "n"
        "v"
      ];
      key = "<leader>ci";
      action = "<cmd>CodeCompanion<cr>";
      options = {
        desc = "CodeCompanion Inline";
      };
    }
  ];
}
