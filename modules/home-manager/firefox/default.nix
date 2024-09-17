{ pkgs, nur, ... }: {
    enable = true;
    package = pkgs.firefox-devedition-bin;

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

      # extensions = with pkgs.nur.repos.rycee.firefox-addons; [
      #   multi-account-containers
      #   ublock-origin
      #   clearurls
      #   indie-wiki-buddy
      #   wappalyzer
      #   foxy-proxy
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
