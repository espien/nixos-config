{

  description = "My flake";

  inputs = {

    nixpkgs.url = "github:NixOS/nixpkgs/nixos-26.05";

    home-manager = {
      url = "github:nix-community/home-manager/release-26.05";

      # Make sure that `nixpkgs.url` and `home-manager.url` stay synchronized 
      inputs.nixpkgs.follows = "nixpkgs";
    };

  };

  outputs = { self, nixpkgs, home-manager, ... }@inputs:
  let
    # Variables to pass below
    
    system = "x86_64-linux";

  in
    {

      # NixOS configuration
      nixosConfigurations = {

        # Desktop configuration
        desktop = nixpkgs.lib.nixosSystem {
          # `inherit` can be used to pass the variables in the above `let`-statement into the configuration.nix file
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

          # Main home-manager configuration file
          modules = [ ./home-manager/espien/home.nix ];
        };
      };

    };

}
