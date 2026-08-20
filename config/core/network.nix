{ pkgs, lib, ... }:

{
  networking.firewall.allowedTCPPorts = [ 3000 ];
}
