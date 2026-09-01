{
  lib,
  user,
  devEnvs,
  ...
}:
let
  flakeRef = "/home/${user.name}/nixconfig";

  envrcPath = path: "${lib.removeSuffix "/" path}/.envrc";

  envrcFiles = lib.mapAttrs' (name: cfg: {
    name = envrcPath cfg.path;
    value = {
      text = "use flake ${flakeRef}#dev-${name}\n";
    };
  }) devEnvs.envs;
in
{
  home.file = envrcFiles;
}
