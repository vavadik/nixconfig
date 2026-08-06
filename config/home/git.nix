{ pkgs, user, ... }:

{
  home = {
    stateVersion = "26.05";

    packages = with pkgs; [
      git
    ];
  };

  programs.git = {
    enable = true;
    userName = user.fullName;
    userEmail = user.email;
  };
}
