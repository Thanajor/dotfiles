{
  programs.nixvim = {
    plugins.harpoon = {
      enable = true;

      keymaps = {
        addFile = "<C-a>";

        toggleQuickMenu = "<C-h>";

        navFile = {
          "1" = "<C-j>";
          "2" = "<C-k>";
          "3" = "<C-l>";
          "4" = "<C-m>";
        };
      };
    };
  };
}
