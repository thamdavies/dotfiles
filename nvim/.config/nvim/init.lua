require "config.init"

vim.pack.add({{ src = "https://github.com/ellisonleao/gruvbox.nvim" }})

require "gruvbox".setup({ transparent_mode = true })
require('gruvbox').load()

-- Load pack
require "config.pack"
