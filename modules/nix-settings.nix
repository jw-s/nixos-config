{ ... }:

{
  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  nix.gc = {
    automatic = true;
    dates = "weekly";
    options = "--delete-older-than 7d";
  };

  services.fwupd.enable = true;

  # NOTE: previously pointed at a channel URL; flake-based autoUpgrade
  # instead rebuilds from this repo's own flake. Update `flake` below if
  # you push this repo to a remote and want upgrades to pull from there
  # instead of the local checkout.
  system.autoUpgrade = {
    enable = true;
    dates = "*-*-* 04:00:00";
    persistent = true;
    allowReboot = true;
    flake = "/home/joel/nixos-config#t480s";
  };

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It's perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "24.05"; # Did you read the comment?
}
