{
  lib,
  user,
  devEnvs,
  ...
}:
let
  flakeRef = "/home/${user.name}/nixconfig";
  packagesFile = "${flakeRef}/config/dev-envs.nix";

  envrcPath = path: "${lib.removeSuffix "/" path}/.envrc";

  envrcFiles = lib.mapAttrs' (name: cfg: {
    name = envrcPath cfg.path;
    value = {
      text = ''
        watch_file ${packagesFile}
        use flake ${flakeRef}#dev-${name}
      '';
    };
  }) devEnvs.envs;
in
{
  home.file = envrcFiles;
}
