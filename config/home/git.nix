{ pkgs, user, ... }:

{
  home = {
    stateVersion = "26.05";
  };

  programs = {
    git = {
      enable = true;
      userName = user.fullName;
      userEmail = user.email;
      package = pkgs.gitFull;

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

      settings = {
        credential = {
          helper = [ "libsecret" ];
        };
      };
    };
    git-credential-oauth = {
      enable = true;
    };
  };
}
