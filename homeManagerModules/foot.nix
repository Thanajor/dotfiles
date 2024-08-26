{
  lib,
  pkgs,
  stylix,
  config,
  ...
}: {
  # home.packages = with pkgs; [
  #   foot
  # ];

  programs.foot = {
    enable = true;

    # See more settings in https://codeberg.org/dnkl/foot/src/branch/master/foot.ini

    settings = {
      colors.alpha = lib.mkForce 0.7;
      #   main = {
      #     term = "xterm-256color";
      #
      #     font = "Fira Code:size=11";
      #     dpi-aware = "yes";
      #   };
      #
      #   mouse = {
      #     hide-when-typing = "yes";
      #   };
    };
  };
}
