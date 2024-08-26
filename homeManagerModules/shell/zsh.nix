{pkgs, ...}: {
  programs.zsh = {
    enable = true;
    autosuggestion.enable = true;
    enableCompletion = true;
    oh-my-zsh.enable = true;
    syntaxHighlighting.enable = true;
    # shellAliases = {
    #   ls = "${pkgs.lsd}/bin/lsd";
    # };
    #defaultKeymap = "vicmd";
    plugins = [
      {
        name = "vi-mode";
        src = pkgs.zsh-vi-mode;
        file = "share/zsh-vi-mode/zsh-vi-mode.plugin.zsh";
      }
    ];
  };

  home.sessionVariables = {
    ZVM_VI_ESCAPE_BINDKEY = "jk";
    ZVM_ESCAPE_KEYTIMEOUT = "0.007";
  };
}
