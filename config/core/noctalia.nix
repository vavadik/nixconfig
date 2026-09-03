{ inputs, pkgs, ... }:
{
  imports = [
    inputs.noctalia.nixosModules.default
    inputs.noctalia-greeter.nixosModules.default
  ];

  programs.dconf.enable = true;
  services.gvfs.enable = true;
  services.gnome.gnome-keyring.enable = true;

  programs.noctalia = {
    enable = true;

    # Enables NetworkManager, Bluetooth, UPower, and a power profile service.
    recommendedServices.enable = true;

    systemd = {
      enable = false;
    };
  };

  programs.noctalia-greeter = {
    enable = true;
    settings = {
      cursor = {
        theme = "capitaine-cursors";
        size = 24;
        path = "${pkgs.capitaine-cursors}/share/icons";
      };
      keyboard = {
        layout = "us";
      };
      session = {
        default = "Umbriel";
      };
    };
  };
}
