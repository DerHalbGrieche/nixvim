{
  plugins = {
    copilot-lua = {
      enable = true;
      settings = {
        suggestion.enabled = false;
        panel.enabled = false;
        filetypes = {
          markdown = true;
          help = true;
        };
      };
    };
    avante = {
      enable = true;

      lazyLoad.settings.event = ["BufEnter"];
      settings = {
        mappings = {
          files = {
            add_current = "<leader>ac";
          };
        };
        providers = {
          copilot = {
            model = "claude-sonnet-4";
            endpoint = "https://api.githubcopilot.com";
            allow_insecure = false;
            extra_request_body = {
              temperature = 0;
            };
            reasoning_effort = "high";
          };
        };
        diff = {
          autojump = true;
          debug = false;
          list_opener = "copen";
        };
        highlights = {
          diff = {
            current = "DiffText";
            incoming = "DiffAdd";
          };
        };
        hints.enabled = true;
        mappings = {
          diff = {
            both = "cb";
            next = "]x";
            none = "c0";
            ours = "co";
            prev = "[x";
            theirs = "tc";
          };
        };
        provider = "copilot";
        windows = {
          sidebar_header = {
            align = "right";
            rounded = false;
          };
          width = 30;
          wrap = true;
        };
      };
    };

    render-markdown = {
      enable = true;
      lazyLoad.settings = {
        ft = ["Avante"];
      };
      settings = {
        file_types = [
          "Avante"
        ];
      };
    };
  };
}
