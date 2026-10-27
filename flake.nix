{
  description = "Joel's NixOS configuration";

  inputs = {
    # Pinned to the channel this machine was already on at migration time,
    # so switching to flakes is a no-op rebuild. Bump deliberately later.
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-26.05";

    musnix = {
      url = "github:musnix/musnix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, musnix, ... }: {
    nixosConfigurations.t480s = nixpkgs.lib.nixosSystem {
      modules = [
        musnix.nixosModules.musnix
        ./hosts/t480s
      ];
    };
  };
}
