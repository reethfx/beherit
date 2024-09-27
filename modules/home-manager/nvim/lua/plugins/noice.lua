return     -- messages, cmdline and the popupmenu
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
}