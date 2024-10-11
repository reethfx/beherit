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
              -- import any extras modules here
              { import = "lazyvim.plugins.extras.dap.core" },
              { import = "lazyvim.plugins.extras.dap.nlua" },
              { import = "lazyvim.plugins.extras.ui.edgy" },
              { import = "lazyvim.plugins.extras.editor.aerial" },
              { import = "lazyvim.plugins.extras.editor.leap" },
              { import = "lazyvim.plugins.extras.editor.navic" },
              { import = "lazyvim.plugins.extras.lang.docker" },
              { import = "lazyvim.plugins.extras.lang.json" },
              { import = "lazyvim.plugins.extras.lang.markdown" },
              { import = "lazyvim.plugins.extras.lang.rust" },
              { import = "lazyvim.plugins.extras.lang.yaml" },
              { import = "lazyvim.plugins.extras.test.core" },
              { import = "lazyvim.plugins.extras.ui.mini-animate" },
              -- import/override with your plugins
              -- { import = "plugins" },
            },
            defaults = {
              -- By default, only LazyVim plugins will be lazy-loaded. Your custom plugins will load during startup.
              -- If you know what you're doing, you can set this to `true` to have all your custom plugins lazy-loaded by default.
              lazy = true,
              -- It's recommended to leave version=false for now, since a lot the plugin that support versioning,
              -- have outdated releases, which may break your Neovim install.
              version = false, -- always use the latest git commit
              -- version = "*", -- try installing the latest stable version for plugins that support semver
            },
            performance = {
              -- Used for NixOS
              reset_packpath = false,
              rtp = {
                  reset = false,
                  -- disable some rtp plugins
                  disabled_plugins = {
                    "gzip",
                    -- "matchit",
                    -- "matchparen",
                    -- "netrwPlugin",
                    "tarPlugin",
                    "tohtml",
                    "tutor",
                    "zipPlugin",
                  },
                }
              },

              dev = {
                patterns = {"folke", "nvim-telescope", "hrsh7th", "akinsho", "stevearc", "LazyVim", "catppuccin-mocha", "saadparwaiz1", "nvimdev", "rafamadriz", "lewis6991", "lukas-reineke", "nvim-lualine", "L3MON4D3", "williamboman", "echasnovski", "nvim-neo-tree", "MunifTanjim", "mfussenegger", "rcarriga", "neovim", "nvim-pack", "nvim-treesitter", "windwp", "JoosepAlviste", "nvim-tree", "nvim-lua", "RRethy", "dstein64", "Saecki", "ggandor", "iamcco", "nvim-neotest", "rouge8", "theHamsta", "SmiteshP", "jbyuki", "simrat39", "b0o", "tpope", "kosayoda" },
              },

            install = {
              missing = false,
            },
          })
        '';

  };

  # home.file.".config/nvim/lua" = {
  #   source = ./lua;
  #   recursive = true;
  # };

}
