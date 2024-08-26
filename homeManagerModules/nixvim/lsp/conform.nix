{
  programs.nixvim = {
    plugins.conform-nvim = {
      enable = true;
      notifyOnError = true;
        # Map of filetype to formatters

              formatOnSave = ''
        function(bufnr)
          -- Disable "format_on_save lsp_fallback" for lanuages that don't
          -- have a well standardized coding style. You can add additional
          -- lanuages here or re-enable it for the disabled ones.
          local disable_filetypes = { c = true, cpp = true }
          return {
            timeout_ms = 500,
            lsp_fallback = not disable_filetypes[vim.bo[bufnr].filetype]
          }
        end
      '';

    formattersByFt =
    {
      lua = [ "stylua" ];
      # Conform will run multiple formatters sequentially
      python = [ "isort" "black" ];
      # Use a sub-list to run only the first available formatter
      javascript = [ [ "prettierd" "prettier" ] ];
      nix = ["alejandra"];
    };
    };
  };
}

