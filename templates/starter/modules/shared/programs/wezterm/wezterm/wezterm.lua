-- Pull in the wezterm API
local wezterm = require("wezterm")

-- This will hold the configuration.
local config = require("config")
require("events")

-- and finally, return the configuration to wezterm
return config