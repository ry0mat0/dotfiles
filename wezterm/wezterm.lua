-- Pull in the wezterm API
local wezterm = require 'wezterm'

-- This table will hold the configuration.
local config = {}

-- In newer versions of wezterm, use the config_builder which will
-- help provide clearer error messages
if wezterm.config_builder then
  config = wezterm.config_builder()
end

-- This is where you actually apply your config choices

-- For example, changing the color scheme:
config.use_ime = true
config.color_scheme = 'iceberg-dark'
config.font = wezterm.font('HackGen Console NF')
config.font_size = 14.0
config.audible_bell = 'Disabled'

-- and finally, return the configuration to wezterm
return config

