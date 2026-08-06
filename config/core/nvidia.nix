{ pkgs, config, ... }:
{
  hardware = {
    graphics.enable = true;
    nvidia = {
      open = true;
      modesetting.enable = true;

      /*
        - production, new_feature, beta:
          NVIDIA's official production / new feature / beta release branches.

        - stable:
          The default; the highest stable version.

        - latest:
          Whichever is newer of `production` and `new_feature`.

        - bleeding_edge:
          Whichever is newer of `latest` and `beta`.

        - legacy_580:
          The long-lived 580 series (LTSB), for GPUs that newer driver branches
          no longer support (often Maxwell through Volta; roughly GeForce GTX 9xx
          through 10xx, plus rare Volta cards like TITAN V).

        - vulkan_beta:
          The Vulkan developer beta driver, for users interested in testing new
          Vulkan features.
      */
      branch = "new_feature";
    };
  };
  services.xserver.videoDrivers = [ "nvidia" ];
}
