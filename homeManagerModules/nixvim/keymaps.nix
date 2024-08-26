{
  programs.nixvim = {
    keymaps = [
      {
        mode = ["n" "v"];
        key = "<leader>ih";
        action = ":lua vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled())<cr>";
        options = {
          desc = "Toogle Inlay Hint";
        };
      }

      {
        mode = ["n" "v"];
        key = "<leader>ih";
        action = ":lua vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled())<cr>";
        options = {
          desc = "Toogle Inlay Hint";
        };
      }

      {
        mode = ["n"];
        key = "<esc>";
        action = ":noh<CR>";
        options = {
          desc = "Esc to clear search result";
        };
      }

      {
        mode = ["i"];
        key = "jk";
        action = "<esc>";
        options = {
          desc = "Normal mode";
        };
      }

      {
        mode = ["n" "v"];
        key = "<leader>y";
        action = ''"+y'';
        options = {
          desc = "Copy to system clipboard";
        };
      }

      {
        mode = ["n" "v"];
        key = "<leader>Y";
        action = ''"+Y'';
        options = {
          desc = "Copy to system clipboard";
        };
      }

      {
        mode = "n";
        key = "<C-d>";
        action = "<C-d>zz";
        options = {
          desc = "Allow C-d and C-u to keep the cursor in the middle";
        };
      }

      {
        mode = "n";
        key = "<C-u>";
        action = "<C-u>zz";
        options = {
          desc = "Allow C-d and C-u to keep the cursor in the middle";
        };
      }

      {
        mode = "n";
        key = "n";
        action = "nzzzv";
        options = {
          desc = "Allow search terms to stay in the middle ";
        };
      }

      {
        mode = "n";
        key = "N";
        action = "Nzzzv";
        options = {
          desc = "Allow search terms to stay in the middle ";
        };
      }

      # Paste stuff without saving the deleted word into the buffer
      {
        mode = "x";
        key = "<leader>p";
        action = ''"_dP'';
        options = {
          desc = "Deletes to void register and paste over";
        };
      }

      # resize with arrows
      {
        mode = ["n"];
        key = "<C-Up>";
        action = ":resize -2<CR>";
        options = {
          desc = "Resize Up";
        };
      }

      {
        mode = ["n"];
        key = "<C-Down>";
        action = ":resize +2<CR>";
        options = {
          desc = "Resize Down";
        };
      }

      {
        mode = ["n"];
        key = "<C-Left>";
        action = ":vertical resize +2<CR>";
        options = {
          desc = "Resize Left";
        };
      }

      {
        mode = ["n"];
        key = "<C-Right>";
        action = ":vertical resize -2<CR>";
        options = {
          desc = "Resize Right";
        };
      }

      {
        mode = "v";
        key = "J";
        action = ":m '>+1<CR>gv=gv";
        options = {
          desc = "Use move command when line is highlighted ";
        };
      }

      {
        mode = "v";
        key = "K";
        action = ":m '>-2<CR>gv=gv";
        options = {
          desc = "Use move command when line is highlighted ";
        };
      }

      # NOTE: Show more in: https://github.com/elythh/nixvim/blob/main/config/keys.nix
    ];
  };
}
