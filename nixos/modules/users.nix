 { config, pkgs, ... }:
 {
  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.reeth = {
    isNormalUser = true;
    description = "reeth";
    extraGroups = [ "networkmanager" "wheel" ];
    packages = with pkgs; [
	git
	curl
    ];
  };
}