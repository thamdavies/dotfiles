require "config.init"

vim.pack.add({{ src = "https://github.com/navarasu/onedark.nvim" }})

require "onedark".setup({ transparent = true })
require('onedark').load()

-- Load pack
require "pack"
