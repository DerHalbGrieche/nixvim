{pkgs, ...}: {
  imports = [
    ./nix.nix
    ./rust.nix
    ./markdown.nix
  ];
  plugins = {
    #Formatter and Diagnostics
    none-ls.enable = true;

    # Format on Save, ...
    conform-nvim = {
      enable = true;
      package = pkgs.vimPlugins.conform-nvim;
      settings = {
        format_on_save = {
          lspFallback = true;
          timeoutMs = 500;
        };
        notify_on_error = true;
      };
      settings.formatters_by_ft = {
        "_" = ["trim_whitespace"];
      };
    };

    # Generic LSP Server Setup
    lsp = {
      enable = true;
      inlayHints = true;
      keymaps = {
        diagnostic = {
          "<leader>E" = "open_float";
          "[" = "goto_prev";
          "]" = "goto_next";
        };
        lspBuf = {
          "gD" = "declaration";
          "gd" = "definition";
          "gr" = "references";
          "gI" = "implementation";
          "gy" = "type_definition";
          "<leader>h" = "hover";
          "<leader>Cf" = "format";
          "<leader>Ca" = "code_action";
          "<leader>Cr" = "rename";
          "<leader>CD" = "declaration";
          "<leader>Cd" = "definition";
          "<leader>CR" = "references";
          "<leader>CI" = "implementation";
          "<leader>Cy" = "type_definition";
          "<leader>Wl" = "list_workspace_folders";
          "<leader>Wr" = "remove_workspace_folder";
          "<leader>Wa" = "add_workspace_folder";
        };
      };
      preConfig =
        # lua
        ''
          vim.lsp.handlers['textDocument/hover'] = vim.lsp.with(
            vim.lsp.handlers.hover,
            {border = 'rounded'}
          )

          vim.lsp.handlers['textDocument/signatureHelp'] = vim.lsp.with(
            vim.lsp.handlers.signature_help,
            {border = 'rounded'}
          )
        '';
      postConfig =
        # lua
        ''
          vim.diagnostic.config {
            signs = {
              text = {
                [vim.diagnostic.severity.ERROR] = " ",
                [vim.diagnostic.severity.WARN] = " ",
                [vim.diagnostic.severity.INFO] = " ",
                [vim.diagnostic.severity.HINT] = " ",
              },
              numhl = {
                [vim.diagnostic.severity.ERROR] = "DiagnosticSignError",
                [vim.diagnostic.severity.WARN] = "DiagnosticSignWarn",
                [vim.diagnostic.severity.INFO] = "DiagnosticSignInfo",
                [vim.diagnostic.severity.HINT] = "DiagnosticSignHint",
              },
            },
          }
        '';
    };
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
              module = "blink-cmp-dictionary";
              min_keyword_length = 3;
            };
            emoji = {
              name = "Emoji";
              module = "blink-emoji";
              score_offset = 1;
            };
            copilot = {
              name = "copilot";
              module = "blink-copilot";
              async = true;
              score_offset = 100;
            };
            lsp.score_offset = 4;
            spell = {
              name = "Spell";
              module = "blink-cmp-spell";
              score_offset = 1;
            };
            git = {
              name = "Git";
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
