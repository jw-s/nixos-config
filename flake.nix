{
  description = "Joel's NixOS configuration";

  inputs = {
    # Pinned to a known-good commit; bump deliberately with `nix flake update`.
    nixpkgs.url = "github:NixOS/nixpkgs/da6dc0e7b26060f2f71ce3ef7088fb56ee44fa36";

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
