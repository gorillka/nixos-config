{ pkgs, config, ...}:

{
    #      the standard path under ~/.config/
	#           to find the file       Where the file is located relative to this .nix file
	#                    |                             |
	#
    home.file.".wezterm.lua".source = ./wezterm.lua;
}