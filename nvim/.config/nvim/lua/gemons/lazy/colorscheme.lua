return {
  "catppuccin/nvim",
  name = "catppuccin",
  lazy = false, -- make sure we load this during startup if it is your main colorscheme
  priority = 1000, -- make sure to load this before all the other plugins
  config = function()
    -- NOTE: you do not need to call setup if you don't want to.
    require("catppuccin").setup({
      -- optional configuration here
      flavour = "auto",
      transparent_background = true,
    })
    vim.cmd("colorscheme catppuccin")
  end
}
