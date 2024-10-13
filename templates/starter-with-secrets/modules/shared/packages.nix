{ pkgs }:

with pkgs; [
  # General packages for development and system management

  # Encryption and security tools
  age
  age-plugin-yubikey
  gnupg
  libfido2

  # Cloud-related tools and SDKs

  # Media-related packages
  nerdfonts

  # Node.js development tools

  # Text and terminal utilities
  jetbrains-mono
  tmux

  # Python packages

  # Productivity Tools
  mas
  starship
]
