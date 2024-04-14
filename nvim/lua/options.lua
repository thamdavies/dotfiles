require "nvchad.options"

-- add yours here!

-- Local
local o = vim.o
o.relativenumber = true
o.swapfile = false
o.backup = false
-- o.cursorlineopt ='both' -- to enable cursorline!

-- Global
local g = vim.g
g.copilot_no_tab_map = true
g.copilot_assume_mapped = true
g.copilot_tab_fallback = ""
