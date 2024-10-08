{ pkgs, lib, config, ... }:
{
  programs.neovim = {
    enable = true;


    plugins = with pkgs.vimPlugins; [
      # Base distro
      LazyVim
      conform-nvim
      nvim-lint
      markdown-preview-nvim
      headlines-nvim

      # Tema
      catppuccin-nvim

      # UI
      bufferline-nvim
      gitsigns-nvim
      edgy-nvim
      dashboard-nvim
      toggleterm-nvim
      trouble-nvim
      lualine-nvim
      which-key-nvim
      nvim-web-devicons
      mini-nvim
      noice-nvim
      nui-nvim
      nvim-notify
      nvim-lsp-notify
      neo-tree-nvim
      nvim-navic
      dressing-nvim
      aerial-nvim

      # Project management
      project-nvim
      neoconf-nvim
      persistence-nvim

      # Smart typing
      indent-blankline-nvim
      guess-indent-nvim
      vim-illuminate

      # LSP
      nvim-lspconfig
      rust-tools-nvim
      crates-nvim
      null-ls-nvim
      nvim-lightbulb  # Quick actions
      neodev-nvim
      SchemaStore-nvim  # JSON and YAML formats

      # Autocompletado (cmp)
      nvim-cmp
      cmp-buffer
      cmp-path
      cmp_luasnip
      cmp-nvim-lsp

      # Snippets
      luasnip
      friendly-snippets

      # Funcionalidad de búsqueda
      plenary-nvim
      telescope-nvim
      telescope-fzf-native-nvim
      nvim-spectre
      flash-nvim

      # Treesitter
      nvim-treesitter-context
      nvim-ts-autotag
      nvim-treesitter-textobjects
      nvim-treesitter.withAllGrammars

      # Comentarios
      nvim-ts-context-commentstring
      todo-comments-nvim

      # Leap
      vim-repeat
      leap-nvim
      flit-nvim

      # DAP (Depuración)
      nvim-dap
      nvim-dap-ui
      nvim-dap-virtual-text

      # Neotest
      neotest
      neotest-rust

      # Otros plugins
      lazy-nvim
      vim-startuptime
      neocord
    ];

    # Paquetes adicionales requeridos por Neovim o sus plugins
    extraPackages = with pkgs; [
      stylua  # Formateador Lua
      shfmt  # Formateador de shell

      # Markdown extra
      nodePackages.markdownlint-cli
      marksman

      # Docker extra
      nodePackages.dockerfile-language-server-nodejs
      hadolint
      docker-compose-language-service

      # JSON y YAML extra
      nodePackages.vscode-json-languageserver
      nodePackages.yaml-language-server

      # Custom
      editorconfig-checker
      shellcheck
    ];

    # Configuración adicional en Lua
    extraLuaConfig = ''
      vim.g.mapleader = " "
      require("lazy").setup({
        spec = {
          { "LazyVim/LazyVim", import = "lazyvim.plugins" },
          -- Extras y plugins personalizados
      
          { import = "plugins" },
        },
        defaults = {
          lazy = false,
          version = false,
        },
        performance = {
          reset_packpath = false,
          rtp = {
            reset = false,
            disabled_plugins = {
              "gzip",
              "tarPlugin",
              "tohtml",
              "tutor",
              "zipPlugin",
            },
          },
        },
      })
    '';
  };

  # Almacena la configuración en ~/.config/nvim/
  xdg.configFile.".config/nvim/lua" = {
      recursive = true;
      source = ./lua;
  };

}
