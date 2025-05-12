return {
  "EdenEast/nightfox.nvim",
  priority = 1000,
  lazy = false,
  config = function()
    require("nightfox").setup({
      options = {
        transparent = true,
        terminal_colors = true,
        styles = {
          comments = "italic",
        },
      },
    })

    vim.cmd("colorscheme nightfox")

    vim.cmd([[
      highlight Normal guibg=NONE ctermbg=NONE
      highlight NormalNC guibg=NONE ctermbg=NONE
      highlight NormalFloat guibg=NONE ctermbg=NONE
      highlight FloatBorder guibg=NONE ctermbg=NONE
    ]])
  end,
}
