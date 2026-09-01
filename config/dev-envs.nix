# Declarative direnv environments anywhere under $HOME.
# Each entry becomes a flake devShell (dev-<name>) and a .envrc in the target directory.
{ pkgs }:
{
  envs = {
    work = {
      path = "work";
      packages = with pkgs; [
        nodejs_24
        pnpm
      ];
    };

    projects = {
      path = "Projects";
      packages = with pkgs; [
        nodejs_24
        pnpm
        sl
      ];
    };

    # Example: a different location under $HOME
    # personal-project = {
    #   path = "projects/personal-foo";
    #   packages = with pkgs; [
    #     python3
    #     uv
    #   ];
    # };
  };
}
