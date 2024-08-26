{pkgs, ...}: {
  imports = [
    ./utils
    ./treesitter
    ./ui
    ./lsp
    ./keymaps.nix
    ./dap
  ];

  programs.nixvim = {
    enable = true;
    defaultEditor = true;

    globals.mapleader = " ";
    clipboard.providers.wl-copy.enable = true;

    opts = {
      number = true; # Show line numbers

      relativenumber = true; # Show relative line numbers
      shiftwidth = 2; # Tab width should be 2
      tabstop = 2;
      softtabstop = 2;
      expandtab = true;

      cursorline = true;
      cursorlineopt = "number";
      winminwidth = 5;

      conceallevel = 2;

      pumblend = 0;
      pumheight = 10;
      numberwidth = 2;
      fileencoding = "utf-8";
      smoothscroll = true;

      signcolumn = "yes";
      splitbelow = true;
      splitright = true;
      splitkeep = "screen";
      termguicolors = true;
      virtualedit = "block";
    };

    colorschemes = {
      nightfox = {
        enable = true;

        flavor = "nordfox";

        settings = {
          disable_background = true;
        };
      };
    };
  };
}
