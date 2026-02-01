-- Pull in the wezterm API
local wezterm = require 'wezterm'

-- This will hold the configuration.
local config = wezterm.config_builder()
local home_dir = os.getenv("HOME")

-- This is where you actually apply your config choices

config.font_size = 14
config.font = wezterm.font { family = 'JetbrainsMono Nerd Font' }

config.font_rules = {
  {
    intensity = 'Bold',
    italic = true,
    font = wezterm.font {
      family = 'JetbrainsMono Nerd Font',
      weight = 'SemiBold',
      style = 'Italic',
    },
  },
  {
    italic = true,
    intensity = 'Normal',
    font = wezterm.font {
      family = 'JetbrainsMono Nerd Font',
      style = 'Italic',
      weight = 'Regular',
    },
  },
}

local background_image_path = os.getenv("WEZTERM_BG_IMAGE") or (home_dir .. '/personal/dotfiles/images/1.jpg')
config.window_background_image = background_image_path
config.enable_tab_bar = false

config.window_decorations = "RESIZE"
config.window_background_opacity = 1
config.window_background_image_hsb = {
  hue = 1.0,
  saturation = 0.7,
  brightness = 0.03,
}

config.color_scheme = "Catppuccin Macchiato"

-- and finally, return the configuration to wezterm

return config

