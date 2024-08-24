{pkgs, ...}: {
  fonts.fontDir.enable = true;
  fonts.packages = with pkgs; [
    fira-code
    monocraft
    font-awesome
    nerdfonts
  ];
}
