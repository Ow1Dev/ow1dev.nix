# List available commands
default:
    @just --list

# Switch to flake
switch:
    @nix run nixpkgs#home-manager -- switch --flake .

# Update flake
update:
    @nix flake update

# Check flake
check:
    @nix flake check