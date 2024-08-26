# https://github.com/mrcjkb/rustaceanvim/tree/master
{
  programs.nixvim = {
    plugins.rustaceanvim = {
      enable = false;
    };

    keymaps = [
      {
        mode = ["n"];
        key = "<leader>ca";
        action = ":lua vim.cmd.RustLsp('codeAction')<cr>";
        options = {
          desc = "Rust Code Action";
        };
      }
    ];
  };
}
