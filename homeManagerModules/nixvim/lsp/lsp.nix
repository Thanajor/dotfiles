{
  programs.nixvim = {
    plugins = {
      lsp-format = {enable = true;};
      lsp = {
        enable = true;
        servers = {
          html = {enable = true;};
          lua-ls = {enable = true;};
          nixd = {enable = true;};
          nil-ls = {enable = true;};
          pyright = {enable = true;};
          yamlls = {
            enable = true;
          };
        };

        keymaps = {
          silent = true;
          lspBuf = {
            gd = {
              action = "definition";
              desc = "Goto Definition";
            };
            gr = {
              action = "references";
              desc = "Goto References";
            };
            gD = {
              action = "declaration";
              desc = "Goto Declaration";
            };
            gI = {
              action = "implementation";
              desc = "Goto Implementation";
            };
            gT = {
              action = "type_definition";
              desc = "Type Definition";
            };
            K = {
              action = "hover";
              desc = "Hover";
            };
            "<leader>cw" = {
              action = "workspace_symbol";
              desc = "Workspace Symbol";
            };
            "<leader>cr" = {
              action = "rename";
              desc = "Rename";
            };
          };
          diagnostic = {
            "<leader>cd" = {
              action = "open_float";
              desc = "Line Diagnostics";
            };
            "gj" = {
              action = "goto_next";
              desc = "Next Diagnostic";
            };
            "gk" = {
              action = "goto_prev";
              desc = "Previous Diagnostic";
            };
          };
        };
      };
    };
  };
}
