{ pkgs, user, ... }:

{
  home = {
    stateVersion = "26.05";

    packages = with pkgs; [
      libsecret
      git-credential-manager
    ];
  };

  programs = {
    git = {
      enable = true;
      package = pkgs.gitFull;

      settings = {
        user = {
          name = user.fullName;
          email = user.email;
        };
        alias = {
          st = "status";
          ci = "commit";
          co = "checkout";
          br = "branch";
          lg = "log";
          df = "diff";
          dc = "diff --cached";
          hist = "log --graph --decorate --pretty=format:'%C(auto)%h%d %Cgreen(%ar)%Creset %C(bold blue)%an%Creset %s'";
        };
        credential = {
          credentialStore = "secretservice";
          helper = "${pkgs.git-credential-manager}/bin/git-credential-manager";
          useHttpPath = true;
        };
        push.autoSetupRemote = true;
        core.editor = "hx";
        init.defaultBranch = "master";
      };
    };
  };
}
