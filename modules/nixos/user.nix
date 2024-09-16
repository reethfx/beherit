{ inputs, outputs, lib, config, pkgs, ... }: 
{
# FIXME: Add the rest of your current configuration
  # TODO: Set your hostname
  networking.hostName = "beherit";
  # TODO: Configure your system-wide user settings (groups, etc), add more users as needed.
  users.users = {
    # FIXME: Replace with your username
    reeth = {
      isNormalUser = true;
      # TODO: Be sure to add any other groups you need (such as audio, docker, etc)
      extraGroups = ["wheel" "networkmanager"];
      shell = pkgs.fish;
    };
  };
}