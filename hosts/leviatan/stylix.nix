{pkgs, ...}: {
  stylix.targets.nixvim.enable = false;
  # stylix.targets.hyprland.enable = false;
  stylix = {
    enable = true;
    image = ./fish.png;

    base16Scheme = "${pkgs.base16-schemes}/share/themes/nord.yaml";

    polarity = "dark";

    cursor = {
      package = pkgs.bibata-cursors;
      name = "Bibata-Mordern-Ice";
      size = 15;
    };
  };
}
