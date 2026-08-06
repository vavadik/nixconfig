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
    package = pkgs.gitFull;
    userName = user.fullName;
    userEmail = user.email;
    aliases = {
      st = "status";
      ci = "commit";
      co = "checkout";
      br = "branch";
      lg = "log";
      df = "diff";
      dc = "diff --cached";
      hist = "log --graph --decorate --pretty=format:'%C(auto)%h%d %Cgreen(%ar)%Creset %C(bold blue)%an%Creset %s'";
    };
  };

  programs.git-credential-oauth.enable = true;
}
