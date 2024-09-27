return {
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
}