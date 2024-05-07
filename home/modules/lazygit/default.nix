{ config, lib, pkgs, ... }:

{
  # Add options for lazygit
  options.lazygit.enable = lib.mkEnableOption "lazygit";

  # Configure lazygit if desired
  config = lib.mkIf config.lazygit.enable {
  
    programs.lazygit = {
    enable = true;
    settings = {
      gui.theme = {
      border = "rounded";
      theme = {
        activeBorderColor = [ "#5ef1ff" ];
        inactiveBorderColor = [ "#7b8496" ];
        searchingActiveBorderColor = [ "#ff5ef1" ];
        optionsTextColor = [ "#3c4048" ];
        selectedLineBgColor = [ "#3c4048" ];
        cherryPickedCommitBgColor = [ "#3c4048" ];
        cherryPickedCommitFgColor = [ "#ff5ea0" ];
        unstagedChangesColor = [ "#ffbd5e" ];
        defaultFgColor = [ "#ffffff" ];
        };
      };
      };
    };

      

   
  };
}