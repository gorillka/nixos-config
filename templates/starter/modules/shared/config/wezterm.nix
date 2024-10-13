{ pkgs, config, ...}:

let
    config = ''
                    -- Pull in the wezterm API
                    local wezterm = require("wezterm")

                    -- This will hold the configuration.
                    local config = wezterm.config_builder()

                    -- This is where you actually apply your config choices

                    config.font = wezterm.font("JetBrains Mono")
                    config.font_size = 15

                    -- config.enable_tab_bar = false
                    config.hide_tab_bar_if_only_one_tab = true

                    -- Option control whether the tab bar is used at all
                    config.enable_tab_bar = true

                    -- Option controls which tab bar style is used
                    --	When set to true (the default), the tab bar is rendered in a native style with proportional fonts.
                    -- 	When set to false, the tab bar is rendered using a retro aesthetic using the main terminal font.
                    config.use_fancy_tab_bar = false

                    config.window_decorations = "RESIZE"

                    config.window_background_opacity = 0.75
                    config.macos_window_background_blur = 10

                    config.color_scheme = 'Tokyo Night Moon'

                    config.window_close_confirmation = 'NeverPrompt'

                    -- my coolnight colorscheme:

                    config.colors = {
                    -- 	foreground = "#CBE0F0",
                        -- background = "#011423",
                    -- 	cursor_bg = "#47FF9C",
                    -- 	cursor_border = "#47FF9C",
                    -- 	cursor_fg = "#011423",
                    -- 	selection_bg = "#033259",
                    -- 	selection_fg = "#CBE0F0",
                    -- 	ansi = { "#214969", "#E52E2E", "#44FFB1", "#FFE073", "#0FC5ED", "#a277ff", "#24EAF7", "#24EAF7" },
                    -- 	brights = { "#214969", "#E52E2E", "#44FFB1", "#FFE073", "#A277FF", "#a277ff", "#24EAF7", "#24EAF7" },
                    }

                    -- and finally, return the configuration to wezterm
                    return config
                '';
in
{
    ".wezterm.lua" = {
        text = config;
    };
}