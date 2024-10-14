{ pkgs, config, ...}:

let
    config = ''
        -- Helper function:
        -- returns color scheme dependant on operating system theme setting (dark/light)
        local function color_scheme_for_appearance(appearance)
        if appearance:find "Dark" then
            return "Tokyo Night"
        else
            return "Tokyo Night Day"
        end
        end

        -- Pull in WezTerm API
        local wezterm = require 'wezterm'

        -- Initialize actual config
        local config = {}
        if wezterm.config_builder then
            config = wezterm.config_builder()
        end

        config.window_close_confirmation = 'NeverPrompt'

        -- Appearance
        config.font = wezterm.font 'JetBrainsMono Nerd Font'
        config.font_size = 14.0
        config.color_scheme = color_scheme_for_appearance(wezterm.gui.get_appearance())
        config.window_decorations = "RESIZE"
        config.hide_tab_bar_if_only_one_tab = true
        config.native_macos_fullscreen_mode = false

        config.window_background_opacity = 0.75
        config.macos_window_background_blur = 10

        -- Option control whether the tab bar is used at all
        config.enable_tab_bar = true

        -- Option controls which tab bar style is used
        --	When set to true (the default), the tab bar is rendered in a native style with proportional fonts.
        -- 	When set to false, the tab bar is rendered using a retro aesthetic using the main terminal font.
        config.use_fancy_tab_bar = false

        -- Keybindings
        config.keys = {
        -- Default QuickSelect keybind (CTRL-SHIFT-Space) gets captured by something
        -- else on my system
        {
            key = 'A',
            mods = 'CTRL|SHIFT',
            action = wezterm.action.QuickSelect,
        },
        -- Quickly open config file with common macOS keybind
        {
            key = ',',
            mods = 'SUPER',
            action = wezterm.action.SpawnCommandInNewWindow({
            cwd = os.getenv 'WEZTERM_CONFIG_DIR',
            args = { os.getenv 'SHELL', '-c', '$VISUAL $WEZTERM_CONFIG_FILE' },
            }),
        },
        }

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