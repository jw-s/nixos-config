{ pkgs, ... }:

{
  users.users.joel = {
    isNormalUser = true;
    shell = pkgs.zsh;
    description = "Joel";
    extraGroups = [ "networkmanager" "wheel" "clab_admins" "docker" ];
    packages = with pkgs; [
      google-chrome
      spotify
      erlang
      slack
      swi-prolog
      fzf
      tmux
      vim
      gawk
      gnome-builder
      flatpak-builder
      git
      discord-ptb
      gh
      #  thunderbird
    ];
  };
}
