# https://github.com/nix-community/nix-direnv?tab=readme-ov-file
{
  programs = {
    direnv = {
      enable = true;
      # NOTE: CHANGE THIS IF YOU CHANGE YOUR SHELL
      enableZshIntegration = true; # see note on other shells below
      nix-direnv.enable = true;
    };
  };
}
