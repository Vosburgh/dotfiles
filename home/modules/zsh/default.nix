{ config, lib, pkgs, ... }:

{
  # Add options for zsh
  options.zsh.enable = lib.mkEnableOption "zsh";

  # Configure zsh if desired
  config = lib.mkIf config.zsh.enable {

    # Configure zsh
    programs.zsh = {
      enable = true;
      enableCompletion = true;
      autosuggestion.enable = true;
      syntaxHighlighting.enable = true;

      shellAliases = {
        deploy = "nixos-rebuild switch --flake ~/.config/nix#artorias --use-remote-sudo";
        deploy-home = "home-manager switch -b backup --flake  ~/.config/nix#nick@artorias --verbose";
        cd-nix = "cd /home/nick/.config/nix";
        update = "(cd /home/nick/.config/ && nix nix flake update)";
        take-out-the-trash = "sudo nix-collect-garbage";
        unfuck = "sudo nix-store --repair --verify --check-contents";
      };
      history.size = 10000;
      history.path = "${config.xdg.dataHome}/zsh/history";

    };
  };
}