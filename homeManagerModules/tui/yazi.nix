{
  pkgs,
  lib,
  ...
}: let
  dragon = "${pkgs.xdragon}/bin/dragon";
  wl-copy = "${pkgs.wl-clipboard}/bin/wl-copy";
in {
  programs.yazi = {
    enable = true;
    enableZshIntegration = true;

    keymap = {
      manager.prepend_keymap = [
        {
          on = ["<C-y>"];
          run = ["shell --confirm 'for path in $@; do echo file://$path; done | ${wl-copy} -t text/uri-list'" "escape"];
          desc = "Copy to the clipboard - Wayland";
        }

        {
          on = ["<C-n>"];
          run = ["shell --confirm '${dragon} -x -a -T $@ '"];
          desc = "Window to drag files";
        }

        {
          on = ["<C-A-n>"];
          run = ["shell --confirm '${dragon} -T $@ '"];
          desc = "Window to drag files";
        }
      ];
    };

    settings = {
      manager = {
        show_hidden = false;
        sort_by = "modified";
        sort_dir_first = true;
        sort_reverse = true;
      };
    };
  };
}
