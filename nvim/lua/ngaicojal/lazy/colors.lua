-- return {
--   {
--     "rose-pine/neovim",
--     name = "rose-pine",
--     config = function()
--       require("rose-pine").setup({
--         variant = "moon", -- auto, main, moon, or dawn
--         dark_variant = "moon", -- main, moon, or dawn
--       })
--
--       vim.cmd("colorscheme rose-pine-moon")
--     end
--   },
-- }
return {
  "navarasu/onedark.nvim",
  name = "onedark",
  config = function()
    require("onedark").setup({
      style = "light",
    })
    require("onedark").load()
  end
}
