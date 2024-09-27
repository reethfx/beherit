return {
    "echasnovski/mini.nvim",
    version = false,
    config = function()
      require("mini.animate").setup({
        resize = {
          enable = false,
        },
        open = {
          enable = false,
        },
        close = {
          enable = false,
        },
        scroll = {
          enable = true,
          timing = require("mini.animate").gen_timing.linear({ duration = 100, unit = "total" }),
          subscroll = require("mini.animate").gen_subscroll.equal({
            move = true,
          }),
        },
      })
    end,
},