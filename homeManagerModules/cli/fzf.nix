{
  programs.fzf = {
    enable = true;
    enableZshIntegration = true;

    historyWidgetOptions = [
      "--bind 'ctrl-y:execute-silent(echo -n {2..} | wl-copy)+abort'"
      "--color header:italic "
      "--header 'Press CTRL-Y to copy command into clipboard'"
    ];
  };
}
