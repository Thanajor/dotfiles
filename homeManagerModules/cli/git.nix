let
  name = "Thanajor";
  domain = "@" + "outlook" + "." + "com";
  email = "thanajor" + domain; # Auto doxing
  editor = "nvim";
in {
  programs.git = {
    enable = true;
    extraConfig = {
      init.defaultBranch = "main";
      color.ui = true;
      core.editor = editor;
      credential.helper = "store";
      github.user = name;
      push.autoSetupRemote = true;
    };
    userEmail = email;
    userName = name;
  };
}
