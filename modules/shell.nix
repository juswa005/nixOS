{ config, pkgs, ... }:

{
  # Shell configuration
  programs.fish = {
    enable = true;
    interactiveShellInit = ''
      set -g fish_greeting ""
      starship init fish | source
      zoxide init fish | source
      alias ls="eza --icons"
      alias ll="eza -l --icons"
      alias la="eza -la --icons"
    '';
  };
}
