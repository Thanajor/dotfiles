{
  programs.mpv = {
    enable = true;
    config = {
      #profile = "gpu-hq";
      save-position-on-quit = true;
      ytdl-format = "bestvideo+bestaudio";
      cache = true;
      cache-pause = false;
    };

    #Add to Scripts
    # scripts = [
    #   pkgs.mpvScripts.mpv-cheatsheet
    #   pkgs.mpvScripts.webtorrent-mpv-hook
    #   pkgs.mpvScripts.quality-menu
    # ]; # See "scriptOpts" option for mpv
  };
}
