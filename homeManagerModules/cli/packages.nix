{pkgs, ...}: {
  home.packages = with pkgs; [
    xdragon
    wl-clipboard

    grim
    slurp

    # nvtopPackages.amd
    neofetch
    htop
    swww

    duf
    typst
  ];
}
