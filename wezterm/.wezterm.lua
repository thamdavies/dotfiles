-- Pull in the wezterm API
local wezterm = require 'wezterm'

-- This will hold the configuration.
local config = wezterm.config_builder()
local home_dir = os.getenv("HOME")

-- This is where you actually apply your config choices

-- For example, changing the color scheme:
-- config.font = wezterm.font 'JetBrainsMono Nerd Font'
config.font_size = 12

config.window_background_image = home_dir .. '/personal/dotfiles/images/1.jpg'
config.enable_tab_bar = false

config.window_decorations = "RESIZE"
config.window_background_opacity = 1
config.window_background_image_hsb = {
  hue = 1.0,
  saturation = 0.7,
  brightness = 0.03,
}

-- and finally, return the configuration to wezterm
return config

