{
  description = "Example kickstart Home Manager environment.";

  inputs = {
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
    home-manager.url = "github:nix-community/home-manager";
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";

    ow1dev-nvim = {
      url = "github:Ow1Dev/ow1dev.nvim";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = {
    self,
    flake-parts,
    nixpkgs,
    home-manager,
    ...
  } @ inputs:
    flake-parts.lib.mkFlake {inherit inputs;} {
      flake = let
        inherit (self) outputs;
      in {
        homeConfigurations = {
          "ow1@nestop" = home-manager.lib.homeManagerConfiguration {
            pkgs = nixpkgs.legacyPackages."x86_64-linux";
            extraSpecialArgs = {inherit inputs outputs;};
            modules = [./module/home-manager.nix];
          };
          "ow1@Ow1PC" = home-manager.lib.homeManagerConfiguration {
            pkgs = nixpkgs.legacyPackages."x86_64-linux";
            extraSpecialArgs = {inherit inputs outputs;};
            modules = [./module/home-manager.nix];
          };
          "vscode" = home-manager.lib.homeManagerConfiguration {
            pkgs = nixpkgs.legacyPackages."x86_64-linux";
            extraSpecialArgs = { inherit inputs outputs; };
            modules = [ ./module/home-manager.nix ];
          };
        };

        overlays = import ./overlays {inherit inputs;};
      };

      systems = [
        "x86_64-linux"
      ];

      perSystem = {pkgs, ...}: let
        inherit (pkgs) alejandra just nixos-rebuild mkShell;
      in {
        devShells = {
          default = mkShell {
            nativeBuildInputs = [just alejandra nixos-rebuild];

            # Enable Nix experimental features automatically
            shellHook = ''
              export NIX_CONFIG="experimental-features = nix-command flakes"
            '';
          };
        };

        formatter = alejandra;
      };
    };
}
