{
  #
  # Flakes file. For more information see: https://nixos.wiki/wiki/Flakes
  #

  description = "My flake";

  inputs = {

    nixpkgs.url = "github:NixOS/nixpkgs/nixos-26.05";

    home-manager = {
      url = "github:nix-community/home-manager/release-26.05";

      # Make sure that `nixpkgs.url` and `home-manager.url` stay synchronized
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nix-vscode-extensions.url = "github:nix-community/nix-vscode-extensions";

  };

  outputs =
    {
      self,
      nixpkgs,
      home-manager,
      nix-vscode-extensions,
      ...
    }:
    let
      # Variables to pass below

      system = "x86_64-linux";

    in
    {

      # NixOS configuration
      nixosConfigurations = {

        # Desktop configuration
        desktop = nixpkgs.lib.nixosSystem {

          inherit system;

          # Main nixos "system-level" configuration file
          modules = [ ./system/desktop/configuration.nix ];
        };

      };

      # Home-manager configuration
      homeConfigurations = {

        # espien home-manager configuration
        espien = home-manager.lib.homeManagerConfiguration {
          # Home-manager requires 'pkgs' instance
          pkgs = nixpkgs.legacyPackages.${system};

          # Can be used to pass flake inputs to external configuration files
          extraSpecialArgs = {
            inherit nix-vscode-extensions;
          };

          # Main home-manager configuration file
          modules = [ ./home-manager/espien/home.nix ];
        };
      };

    };

}
