{pkgs, ...}: let
  enabled_servers = [
    "clangd"
    "cssls"
    "superhtml"
    "jdtls"
    "eslint"
    "texlab"
    "nil_ls"
    "nixd"
    "phpactor"
    "rust_analyzer"
    "taillwindcss"
  ];
in {
  imports = [
    ./conform.nix
  ];
  lsp = {
    servers = builtins.listToAttrs (map (name: {
        inherit name;
        value = {
          enable = true;
          activate = true;
        };
      })
      enabled_servers);
    inlayHints.enable = true;
    keymaps = [
      {
        key = "gd";
        lspBufAction = "definition";
      }
      {
        key = "gD";
        lspBufAction = "references";
      }
      {
        key = "gt";
        lspBufAction = "type_definition";
      }
      {
        key = "gi";
        lspBufAction = "implementation";
      }
      {
        key = "K";
        lspBufAction = "hover";
      }
    ];
  };
  plugins = {
    #Formatter and Diagnostics
    lsp = {
      enable = true;
    };
    ts-autotag.enable = true;

    # Format on Save, ...

    # Generic LSP Server Setup
    blink-cmp-dictionary.enable = true;
    blink-cmp-git.enable = true;
    blink-cmp-spell.enable = true;
    blink-copilot.enable = true;
    blink-emoji.enable = true;
    blink-cmp = {
      enable = true;
      setupLspCapabilities = true;

      settings = {
        keymap = {
          preset = "none";
          "<Tab>" = ["snippet_forward" "select_next" "fallback"];
          "<C-Tab>" = ["snippet_backward" "select_next" "fallback"];
          "<C-s>" = ["show_signature" "fallback"];
          "<C-e>" = ["cancel"];
          "<C-Space>" = ["show_documentation" "fallback"];
          "<Up>" = ["scroll_documentation_up" "fallback"];
          "<Down>" = ["scroll_documentation_down" "fallback"];
          "<CR>" = ["accept" "fallback"];
          "<C-x>" = ["show" "hide"];
        };

        signature.enabled = true;
        sources = {
          default = [
            "buffer"
            "lsp"
            "path"
            "snippets"
            "copilot"
            "dictionary"
            "emoji"
            "git"
            "spell"
          ];

          providers = {
            dictionary = {
              name = "Dict";
              async = true;
              module = "blink-cmp-dictionary";
              min_keyword_length = 3;
            };
            emoji = {
              name = "Emoji";
              async = true;
              module = "blink-emoji";
              score_offset = 1;
            };
            copilot = {
              name = "copilot";
              module = "blink-copilot";
              async = true;
              score_offset = 3;
            };
            lsp.score_offset = 100;
            spell = {
              name = "Spell";
              async = true;
              module = "blink-cmp-spell";
              score_offset = 1;
            };
            git = {
              name = "Git";
              async = true;
              module = "blink-cmp-git";
              enabled = true;
              score_offset = 100;
              should_show_items.__raw = ''
                function()
                  return vim.o.filetype == 'gitcommit' or vim.o.filetype == 'markdown'
                end
              '';
              opts.git_centers.github.issue = {
                on_error.__raw = "function(_,_) return true end";
              };
            };
          };
        };

        appearance = {
          nerd_font_variant = "mono";
          kind_icons = {
            Text = "󰉿";
            Method = "";
            Function = "󰊕";
            Constructor = "󰒓";

            Field = "󰜢";
            Variable = "󰆦";
            Property = "󰖷";

            Class = "󱡠";
            Interface = "󱡠";
            Struct = "󱡠";
            Module = "󰅩";

            Unit = "󰪚";
            Value = "󰦨";
            Enum = "󰦨";
            EnumMember = "󰦨";

            Keyword = "󰻾";
            Constant = "󰏿";

            Snippet = "󱄽";
            Color = "󰏘";
            File = "󰈔";
            Reference = "󰬲";
            Folder = "󰉋";
            Event = "󱐋";
            Operator = "󰪚";
            TypeParameter = "󰬛";
            Error = "󰏭";
            Warning = "󰏯";
            Information = "󰏮";
            Hint = "󰏭";

            Emoji = "🤶";
          };
        };

        completion = {
          menu = {
            border = "single";
            draw = {
              gap = 1;
              treesitter = ["lsp"];
              columns = [
                {
                  __unkeyed-1 = "label";
                }
                {
                  __unkeyed-1 = "kind_icon";
                  __unkeyed-2 = "kind";
                  gap = 1;
                }
                {__unkeyed-1 = "source_name";}
              ];
            };
          };
          trigger.show_in_snippet = false;
          documentation = {
            auto_show = true;
            window.border = "single";
          };
          accept.auto_brackets.enabled = false;
        };
      };
    };
  };
}
