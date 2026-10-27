{ pkgs, ... }:

{
  services.printing = {
    enable = true;
    drivers = [ pkgs.hplip pkgs.gutenprint ];
    listenAddresses = [ "*:631" ];
    allowFrom = [ "all" ];
    browsing = true;
    defaultShared = true;
    openFirewall = true;
  };
}
