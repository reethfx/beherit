# nvim.nix - Configuración de Neovim
{ config, pkgs, ... }:

let
  # Ruta donde se instalará Lazy.nvim
  lazy_path = "$HOME/.local/share/nvim/lazy/lazy.nvim";
in2
{
  programs.neovim = {
    enable = true;

    # Configuración básica de Neovim
    vimAlias = true; # Alias para `vim`
    package = pkgs.neovim;

    # Dependencias externas como Node.js y Python
    extraPackages = with pkgs; [
      nodejs2
      python3
      ripgrep
      fzf
    ];

    # Configuración personalizada de Neovim
    extraConfig = ''
      lua <<EOF
        -- Instalar Lazy.nvim si no está instalado
        local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
        if not vim.loop.fs_stat(lazypath) then
          vim.fn.system({
            "git",
            "clone",
            "--filter=blob:none",
            "https://github.com/folke/lazy.nvim.git",
            "--branch=stable",  -- Usar la rama estable
            lazypath
          })
        end
        vim.opt.rtp:prepend(lazypath)

        -- Configuración de Lazy.nvim para gestionar plugins
        require("lazy").setup({
          { "nvim-treesitter/nvim-treesitter", run = ":TSUpdate" },
          { "neovim/nvim-lspconfig" },  -- LSP
          { "nvim-telescope/telescope.nvim" },  -- Fuzzy finder
          { "hrsh7th/nvim-cmp" },  -- Auto-completado
          { "L3MON4D3/LuaSnip" },  -- Snippets
          -- Añade más plugins aquí
        })

        -- Configuración general de Neovim
        vim.opt.timeoutlen = 1000
        vim.opt.ttimeoutlen = 0
      EOF
    '';
  };
}
