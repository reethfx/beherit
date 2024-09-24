{ pkgs, lib, config, inputs, ... }: 

  let
    nurPkgs = import inputs.nur { inherit pkgs; };
  in {
    enable = true;
    package = pkgs.firefox-devedition-bin;

    #FIXME change your profile name for FireFox
    profiles.reeth = {
      id = 0;
      name = "reeth";

      search = {
        default = "Google";
        force = true;
      };

      containersForce = true;
      containers.work = {
        id = 1;
        name = "work";
        color = "red";
        icon = "briefcase";
      };

      # extensions = with nurPkgs.repos.rycee.firefox-addons; [
      #   multi-account-containers
      #   ublock-origin
      #   clearurls
      #   wappalyzer
      # ];

      bookmarks = [
        {
          name = "Toolbar";
          toolbar = true;
          bookmarks = import ./bookmarks.nix;
        }
      ];

      settings = import ./settings.nix;

      userContent = import ./user-content.nix;

      userChrome = import ./user-chrome.nix;
    };
}
