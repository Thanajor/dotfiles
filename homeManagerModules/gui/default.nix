{pkgs, ...}: {
  home.packages = with pkgs; [
    #aplications
    prismlauncher
    firefox-devedition
    vesktop
    zotero
    nemo
  ];
}
