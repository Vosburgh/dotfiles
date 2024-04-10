{ config, lib, pkgs, ... }:

{
  # Add options for neovim, lock screen for wayland
  options.neovim.enable = lib.mkEnableOption "neovim";

  # Configure neovim if desired
  config = lib.mkIf config.neovim.enable {

    # Configure neovim
    programs.neovim = {
      enable = true;
      viAlias = true;
      vimAlias = true;
      vimdiffAlias = true;
      defaultEditor = true;
      plugins = with pkgs.vimPlugins; [
        ## Treesitter
        nvim-treesitter
        nvim-treesitter.withAllGrammars
        nvim-treesitter-textobjects
        nvim-lspconfig

        trouble-nvim
        telescope-nvim
        telescope-fzf-native-nvim

        ## cmp
        nvim-cmp
        cmp-nvim-lsp
        cmp-buffer
        cmp-cmdline
      ];
    };
  };
}