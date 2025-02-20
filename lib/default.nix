{ lib, ... }:
{
  # Scan the current directory (relative to where the Nix file is)
  relativeToRoot = lib.path.append ../.;
  scanPaths = path:
    let
      # Read the directory contents
      files = builtins.readDir path;

      # Filter to include only directories or .nix files, but avoid the current file
      filteredFiles = builtins.attrNames (
        lib.attrsets.filterAttrs (
          path: _type:
            (_type == "directory") # Include directories
            || (
              (path != "default.nix") # Ignore default.nix
              && (lib.strings.hasSuffix ".nix" path) # Include .nix files
            )
        ) files
      );

      # Map the filtered files to full paths
    in builtins.map (f: "${path}/${f}") filteredFiles;
}
