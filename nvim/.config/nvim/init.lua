require "config.init"

vim.pack.add({
  { src = "https://github.com/ellisonleao/gruvbox.nvim" },
  { src = "https://github.com/rose-pine/neovim", name = "rose-pine", },
})

-- require "gruvbox".setup({ transparent_mode = true })
-- require('gruvbox').load()
require("rose-pine").setup({
  styles = {
    bold = true,
    italic = true,
    transparency = true,
  },
})

vim.cmd("colorscheme rose-pine")

-- Load pack
require "config.pack"
