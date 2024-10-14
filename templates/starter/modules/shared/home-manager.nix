{ config, pkgs, lib, ... }:

let name = "%NAME%";
    user = "%USER%";
    email = "%EMAIL%"; in
{
  # Shared shell configuration
  zsh = {
    enable = true;
    autocd = false;
    enableCompletion = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;

    plugins = [
    ];

    initExtraFirst = ''
      # General Options
      # ------------------------------------------------------------------------------
      ## List jobs in the long format by default.
      setopt LONG_LIST_JOBS

      ## Disable flow control and hence restore the ability to use C-s and C-q
      setopt NO_FLOW_CONTROL

      if [[ -f /nix/var/nix/profiles/default/etc/profile.d/nix-daemon.sh ]]; then
        . /nix/var/nix/profiles/default/etc/profile.d/nix-daemon.sh
        . /nix/var/nix/profiles/default/etc/profile.d/nix.sh
      fi

      # Starship
      # ------------------------------------------------------------------------------
      eval "$(starship init zsh)"

      # fzf
      # ------------------------------------------------------------------------------
      eval "$(fzf --zsh)"

      # zoxide (better `cd`)
      # ------------------------------------------------------------------------------
      eval "$(zoxide init zsh)"
      alias cd="z"

      # eza (better `ls`)
      # ------------------------------------------------------------------------------
      alias l="eza --icons"
      alias ls="eza --icons"
      alias ll="eza -lg --icons"
      alias la="eza -lag --icons"
      alias lt="eza -lTg --icons"
      alias lt1="eza -lTg --level=1 --icons"
      alias lt2="eza -lTg --level=2 --icons"
      alias lt3="eza -lTg --level=3 --icons"
      alias lta="eza -lTag --icons"
      alias lta1="eza -lTag --level=1 --icons"
      alias lta2="eza -lTag --level=2 --icons"
      alias lta3="eza -lTag --level=3 --icons"

      # Other aliases
      # ------------------------------------------------------------------------------
      alias vim="nvim"
      alias vi="nvim"
      alias n="nvim"
    '';
  };

  git = {
    enable = true;
    ignores = [ "*.swp" ];
    userName = name;
    userEmail = email;
    lfs = {
      enable = true;
    };
    extraConfig = {
      init.defaultBranch = "main";
      core = {
	      editor = "code";
      };
    };
  };

  ssh = {
    enable = true;
    includes = [
      (lib.mkIf pkgs.stdenv.hostPlatform.isLinux
        "/home/${user}/.ssh/config_external"
      )
      (lib.mkIf pkgs.stdenv.hostPlatform.isDarwin
        "/Users/${user}/.ssh/config_external"
      )
    ];
    matchBlocks = {
      "github.com" = {
        identitiesOnly = true;
        identityFile = [
          (lib.mkIf pkgs.stdenv.hostPlatform.isLinux
            "/home/${user}/.ssh/id_ed25519"
          )
          (lib.mkIf pkgs.stdenv.hostPlatform.isDarwin
            "/Users/${user}/.ssh/id_ed25519"
          )
        ];
      };
    };
  };
}
