# Pre-build devShells on nixos-rebuild without putting packages on PATH.
{ lib, flakeDevShells, ... }:
{
  environment.etc."dev-envs".text = lib.concatStringsSep "\n" (
    map (shell: "${shell}") (lib.attrValues flakeDevShells)
  );
}
