{ lib, user, ... }:

{
  users.users.${user.name} = {
    isNormalUser = lib.mkForce true;
    description = lib.mkForce user.fullName;
    extraGroups = lib.mkForce [
      "wheel"
      "networkmanager"
    ];
  };
}
