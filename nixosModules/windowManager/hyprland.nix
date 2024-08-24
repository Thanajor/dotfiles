# NixOS Module: enables critical components needed to run Hyprland properly
# Without this, you may have issues with XDG Portals, or missing session files in your Display Manager.
# See more in: https://wiki.hyprland.org/Nix/Hyprland-on-NixOS/
{
  inputs,
  pkgs,
  ...
}: {
  programs.hyprland = {
    enable = true;
    package = inputs.hyprland.packages.${pkgs.system}.hyprland;
    xwayland.enable = true;
  };
}
