{ config, pkgs, ... }:

{
  programs.neovim = {
    enable = true;

    # Installing Neovim
    package = pkgs.neovim;

    # Additional dependencies for Neovim plugins
    extraPackages = with pkgs; [
      nodejs   # For plugins that require Node.js
      python3  # For plugins that need Python
      ripgrep  # For search functionalities (used by Telescope)
      fzf      # Fuzzy finder
    ];

    # Lazy.nvim plugin manager and Neovim configuration
    extraConfig = ''
      lua <<EOF
        -- Setup Lazy.nvim
        local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
        if not vim.loop.fs_stat(lazypath) then
          vim.fn.system({
            "git",
            "clone",
            "--filter=blob:none",
            "https://github.com/folke/lazy.nvim.git",
            "--branch=stable", 
            lazypath
          })
        end
        vim.opt.rtp:prepend(lazypath)

        -- Setup Lazy.nvim and plugins
        require("lazy").setup({
          -- Essential plugins
          { "nvim-treesitter/nvim-treesitter", run = ":TSUpdate" },
          { "neovim/nvim-lspconfig" },  -- LSP support
          { "nvim-telescope/telescope.nvim" },  -- Fuzzy finder
          { "hrsh7th/nvim-cmp" },  -- Completion engine
          { "L3MON4D3/LuaSnip" },  -- Snippets engine
          { "lewis6991/gitsigns.nvim" },  -- Git integration
          { "kyazdani42/nvim-tree.lua" },  -- File explorer
          { "hoob3rt/lualine.nvim" },  -- Status line
          { "windwp/nvim-autopairs" },  -- Autoclose pairs
          -- Add more plugins as needed
        })

        -- General Neovim settings
        vim.opt.timeoutlen = 1000
        vim.opt.ttimeoutlen = 0
      EOF
    '';
  };
}
