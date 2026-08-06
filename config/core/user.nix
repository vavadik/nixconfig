{ pkgs, user, ... }:

{
  users.users.${user.name} = {
    isNormalUser = true;
    description = user.fullName;
    extraGroups = [
      "wheel"
      "networkmanager"
    ];
  };
}
