{
  programs.nixvim = {
    plugins.obsidian = {
      enable = true;
      settings = {
        workspaces = [
          {
            name = "SecondBrain";
            path = "~/SecondBrain";
          }
        ];
      };
    };
  };
}
