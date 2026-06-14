{

  description = "My flake";

  # `inputs` is an attribute set that defines all the dependencies of this flake.
  # These dependencies will be passed as arguments to the `outputs`-function.
  # see more @ https://nixos-and-flakes.thiscute.world/other-usage-of-flakes/inputs
  inputs = {

    nixpkgs.url = "github:NixOS/nixpkgs/nixos-26.05";

    home-manager = {
      url = "github:nix-community/home-manager/release-26.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nix-vscode-extensions.url = "github:nix-community/nix-vscode-extensions";
  };

  # `outputs` is a function that takes the dependencies from `inputs`
  # as its parameters and its return value is an attribute set, which
  # represents the build results of the flake.
  # see more @ https://nixos-and-flakes.thiscute.world/other-usage-of-flakes/outputs
  outputs =
    inputs@{
      self,
      nixpkgs,
      home-manager,
      ...
    }:
    {

      nixosConfigurations = {
        desktop = nixpkgs.lib.nixosSystem {
          modules = [
            ./system/desktop/configuration.nix
          ];
        };
      };

      homeConfigurations = {

        espien = home-manager.lib.homeManagerConfiguration {
          pkgs = nixpkgs.legacyPackages.x86_64-linux;
          extraSpecialArgs = {
            inherit inputs;
          };
          modules = [
            ./home-manager/espien/home.nix
          ];
        };
      };

    };

}
