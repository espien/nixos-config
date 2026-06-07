{

  description = "NixOS Flake!";

  # Standard format for flake.nix
  # `inputs` are the dependencies of the flake,
  # and `outputs` function will return all the build results of the flake.
  # Each item in `inputs` will be passed as a parameter to
  # the `outputs` function after being pulled and built.

  inputs = {

    nixpkgs.url = "github:NixOS/nixpkgs/nixos-26.05";

    home-manager = {
      url = "github:nix-community/home-manager/release-26.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };

  };

  outputs = { 
    self, 
    nixpkgs, 
    home-manager,
    ... 
  }: 
    let
      lib = nixpkgs.lib;
      system = "x86_64-linux";
      pkgs = nixpkgs.legacyPackages.${system};
    in {

      nixosConfigurations = {
        nixos = lib.nixosSystem {
          inherit system;
          modules = [ ./hosts/desktop/default.nix ];
        };
      };

      homeConfigurations = {
        eetu = home-manager.lib.homeManagerConfiguration {
          inherit pkgs;
          modules = [ ./home/default.nix ];
        };
      };

    };

}
