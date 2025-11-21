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
        provider = "copilot";
        providers = {
          copilot = {
            model = "claude-sonnet-4.5";
            endpoint = "https://api.githubcopilot.com";
            extra_request_body = {
              temperature = 0.75;
            };
            reasoning_effort = "high";
          };
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
