function ColorMyPencils(color)
  color = color or "tokyonight-storm"
  vim.cmd.colorscheme(color)

  vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
  vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
end

return {
  {
    "rose-pine/neovim",
    name = "rose-pine",
    config = function()
      require('rose-pine').setup({
        disable_background = true,
        styles = {
          italic = false,
          transparency = true,
        }
      })

      ColorMyPencils();
    end
  },
  {
    "folke/tokyonight.nvim",
    priority = 1000,
    config = function()
      require('tokyonight').setup({
        transparent = true,
        styles = {
          sidebars = 'transparent',  -- Set sidebars (like nvim-tree) to be transparent
          floats = 'transparent',  -- Set floating windows to be transparent
        },
        on_highlights = function(hl)
          hl.TelescopeNormal = {
            bg = "none",
            fg = "none",
          }
          hl.TelescopePromptNormal = {
            bg = "none",
          }
          hl.TelescopePromptBorder = {
            bg = "none",
            fg = "none",
          }
          hl.TelescopePromptTitle = {
            bg = "none",
            fg = "none",
          }
          hl.TelescopePreviewTitle = {
            bg = "none",
            fg = "none",
          }
          hl.TelescopeResultsTitle = {
            bg = "none",
            fg = "none",
          }
          hl.NvimTreeNormal = {
            bg = "none",
            fg = "none",
          }
          hl.NvimTreeRootFolder = {
            bg = "none",
            fg = "none",
          }
        end,
      })

      ColorMyPencils()
    end
  },
  {
    "nickkadutskyi/jb.nvim",
    lazy = false,
    priority = 1000,
    opts = {},
    config = function()
      require("jb").setup({ transparent = true })
      ColorMyPencils()
    end,
  }
}
