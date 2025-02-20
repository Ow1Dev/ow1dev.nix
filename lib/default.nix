{ lib, ... }:

let
  # Helper function to get paths
  getScanPaths = path: let
    # Ensure we are not adding paths back to the root directory or looping over itself
    filteredPaths = builtins.filter (p: p != path) (builtins.attrNames (lib.attrsets.filterAttrs (
      path' : _type: (_type == "directory") || (
        (path' != "default.nix") && (lib.strings.hasSuffix ".nix" path')
      )
    ) (builtins.readDir path)));
  in builtins.map (f: path + "/${f}") filteredPaths;
in
{
  relativeToRoot = lib.path.append ../.;
  scanPaths = getScanPaths;
}

