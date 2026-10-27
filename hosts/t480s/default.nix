{ ... }:

{
  imports = [
    ./hardware-configuration.nix

    ../../modules/boot.nix
    ../../modules/locale.nix
    ../../modules/networking.nix
    ../../modules/desktop.nix
    ../../modules/audio-bluetooth.nix
    ../../modules/printing.nix
    ../../modules/shell.nix
    ../../modules/gaming.nix
    ../../modules/virtualisation.nix
    ../../modules/users.nix
    ../../modules/packages.nix
    ../../modules/nix-settings.nix
  ];

  networking.hostName = "nixos";
}
