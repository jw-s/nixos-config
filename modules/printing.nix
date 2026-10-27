{ pkgs, ... }:

{
  services.printing = {
    enable = true;
    drivers = [ pkgs.hplip pkgs.gutenprint ];
    # Local-only by default — this laptop roams across untrusted networks,
    # and CUPS has no business being reachable on all of them. Loosen
    # deliberately (e.g. to a specific LAN subnet) if you need to print
    # from another device on a trusted network.
    listenAddresses = [ "127.0.0.1:631" ];
    allowFrom = [ "localhost" ];
    browsing = false;
    defaultShared = false;
    openFirewall = false;
  };
}
