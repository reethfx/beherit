return {
    -- messages, cmdline and the popupmenu
    {
      "folke/noice.nvim",
      config = function()
        require("noice").setup({
          cmdline = {
            view = "cmdline",
          },
          presets = {
            bottom_search = true,
            command_palette = true,
            lsp_doc_border = true,
          },
          -- views = {
          --   cmdline_popup = {
          --     filter_options = {},
          --     win_options = {
          --       winhighlight = "NormalFloat:NormalFloat,FloatBorder:FloatBorder",
          --     },
          --   },
          -- },
        })
      end,
    },
    {
      "amrbashir/nvim-docs-view",
      lazy = true,
      cmd = "DocsViewToggle",
      opts = {
        position = "right",
        width = 60,
      },
    },
  
    -- Notifications
    {
      "rcarriga/nvim-notify",
      opts = {
        render = "compact",
        background_colour = "#1a1b26",
        timeout = 5000,
      },
    },
  
    -- statusline
    {
      "nvim-lualine/lualine.nvim",
      event = "VeryLazy",
      requires = { "nvim-tree/nvim-web-devicons", opt = true },
      opts = {
        options = {
          -- globalstatus = false,
          theme = "everforest",
          icons_enabled = true,
        },
        sections = {
          lualine_a = {
            {
              "mode",
              icon = "𒌐",
            },
          },
        },
      },
    },
  
    -- filename
    {
      "b0o/incline.nvim",
      event = "BufReadPre",
      priority = 1200,
      config = function()
        require("incline").setup({
          window = { margin = { vertical = 0, horizontal = 1 } },
          hide = {
            cursorline = true,
          },
          render = function(props)
            local filename = vim.fn.fnamemodify(vim.api.nvim_buf_get_name(props.buf), ":t")
            if vim.bo[props.buf].modified then
              filename = "[+] " .. filename
            end
  
            local icon, color = require("nvim-web-devicons").get_icon_color(filename)
            return { { icon, guifg = color }, { " " }, { filename } }
          end,
        })
      end,
    },

    {
      "nvimdev/dashboard-nvim",
      event = "VimEnter",
      opts = function(_, opts)
        local logo = [[
  ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
  ⠀⠀⠀⠀⠀⠀⣰⣾⠁⠀⢦⣾⣤⠆⠀⠻⣧⠀⠀⠀⠀⠀⠀
  ⠀⠀⠀⠀⢠⣼⠏⠀⠀⠀⠀⣿⡇⠀⠀⠀⠈⢷⣄⠀⠀⠀⠀
  ⠀⠀⢀⣸⣿⠃⠀⠀⠀⠀⠀⣿⡇⠀⠀⠀⠀⠀⢿⣧⡀⠀⠀
  ⠀⢰⣾⣿⡁⠀⠀⠀⠀⠀⠀⣿⡇⠀⠀⠀⠀⠀⢀⣿⣿⠖⠀
  ⠀⠀⠈⠻⣿⣦⣄⠀⠀⠀⠀⣿⡇⠀⠀⠀⢀⣴⣿⠟⠁⠀⠀
  ⠀⠀⠀⠀⠈⠻⢿⣷⣄⡀⠀⣿⡇⠀⣠⣾⣿⠟⠁⠀⠀⠀⠀
  ⠀⠀⠀⠀⠀⠀⠀⠙⢿⣿⣦⣿⣧⣾⣿⠟⠁⠀⠀⠀⠀⠀⠀
  ⠀⠀⠀⠀⠀⠀⠀⠀⠀⢙⣿⣿⣿⣿⡀⠀⠀⠀⠀⠀⠀⠀⠀
  ⠀⠀⠀⠀⠀⠀⠀⢀⣴⣿⣿⣿⣿⣿⣿⣦⡀⠀⠀⠀⠀⠀⠀
  ⠀⠀⠀⠀⠀⢀⣴⣿⣿⠟⠁⣻⣿⠈⠙⢿⣿⣦⡀⠀⠀⠀⠀
  ⠀⠀⠀⢀⣴⣿⡿⠋⠀⠀⠀⣽⣿⠀⠀⠀⠙⢿⣿⣦⣄⠀⠀
  ⠀⣠⣴⣿⡿⠋⠀⠀⠀⠀⠀⢼⣿⠀⠀⠀⠀⠀⠈⢻⣿⣷⣄
  ⠈⠙⢿⣿⣦⣄⠀⠀⠀⠀⠀⢸⣿⠀⠀⠀⠀⠀⣠⣾⣿⠟⠁
  ⠀⠀⠀⠙⢿⣿⣷⣄⠀⠀⠀⢸⣿⠀⠀⠀⣠⣾⣿⠟⠁⠀⠀
  ⠀⠀⠀⠀⠀⠙⢻⣿⣷⡄⠀⢸⣿⠀⠀⣼⣿⣿⠃⠀⠀⠀⠀
  ⠀⠀⠀⠀⠀⠀⠈⠻⢿⣿⣦⣸⣿⣠⣾⣿⠟⠁⠀⠀⠀⠀⠀
  ⠀⠀⠀⠀⠀⠀⠀⠀⠈⠙⢿⣿⣿⣿⡿⠁⠀⠀⠀⠀⠀⠀⠀
  ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠙⠿⠋⠀⠀⠀⠀⠀⠀⠀⠀⠀
  ]]
        logo = string.rep("\n", 8) .. logo .. "\n\n"
        opts.config.header = vim.split(logo, "\n")
      end,
    },
  }
  