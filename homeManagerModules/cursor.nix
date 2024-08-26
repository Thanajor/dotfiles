{
  pkgs,
  lib,
  ...
}: {
  home = {
    pointerCursor = lib.mkForce {
      package = pkgs.bibata-cursors;
      name = "Bibata-Mordern-Ice";
      size = 22;
      gtk.enable = true;
      x11 = {
        enable = true;
        defaultCursor = true;
      };
    };
  };
  gtk = {
    enable = true;
    cursorTheme.size = 22;
    cursorTheme = {
      package = pkgs.bibata-cursors;
      name = "Bibata-Mordern-Ice";
    };
  };
}
