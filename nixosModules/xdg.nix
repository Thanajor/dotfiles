{pkgs, ...}: {
  xdg = {
    autostart.enable = true;
    mime.enable = true;
  };

  xdg.portal = {
    enable = true;

    xdgOpenUsePortal = true;
    wlr.enable = true;
    config.common.default = "*";
    extraPortals = [
      pkgs.xdg-desktop-portal-gtk
      pkgs.xdg-desktop-portal-wlr
      pkgs.xdg-desktop-portal
    ];
  };

  environment.systemPackages = with pkgs; [
    xdg-utils
  ];
}
