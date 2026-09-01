{ ... }:

# WirePlumber session priorities: Bluetooth > PC speakers; headset/gamepad stay low
# (manual only).
#
# How to refresh device names after a reinstall:
# 1. Connect the device you care about (speakers are always present; BT must be paired).
# 2. Run:  wpctl status
#    Under "Sinks", note the id next to each output (e.g. 56).
# 3. Run:  wpctl inspect <id> | grep node.name
#    Example:  node.name = "alsa_output.pci-0000_00_1f.3.analog-stereo"
# 4. Paste that string into the matching binding below (speakers / headphones / dualsense).
# 5. Rebuild:  sudo nixos-rebuild switch
# 6. Restart WirePlumber:  systemctl --user restart wireplumber
#    Then confirm with:  wpctl status  (default sink marked with *)
#
# Alternative listing:  pw-cli list-objects Node | less
# and look for properties.node.name on Audio/Sink nodes.
let
  # --- edit these after reinstall ---
  speakers = "alsa_output.pci-0000_00_1f.3.analog-stereo";
  headphones = "alsa_output.usb-Kingston_HyperX_Cloud_Alpha_S_000000000001-00.analog-stereo";
  dualsense = "alsa_output.hw_Controller_0";
in
{
  services.pipewire.wireplumber = {
    enable = true;
    extraConfig."90-audio-priorities" = {
      "monitor.alsa.rules" = [
        {
          matches = [ { "node.name" = speakers; } ];
          actions.update-props."priority.session" = 2000;
        }
        {
          matches = [ { "node.name" = headphones; } ];
          actions.update-props."priority.session" = 1000;
        }
        {
          matches = [ { "node.name" = dualsense; } ];
          actions.update-props."priority.session" = 100;
        }
      ];

      "monitor.bluez.rules" = [
        {
          matches = [ { "node.name" = "~bluez_output.*"; } ];
          actions.update-props."priority.session" = 3000;
        }
      ];
    };
  };
}
