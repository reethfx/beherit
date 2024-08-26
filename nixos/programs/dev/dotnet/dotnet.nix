{ config, pkgs, ... }:

{
  programs.dotnet-core-sdk.enable = true;
  
  environment.systemPackages = with pkgs; [
    dotnet-sdk
  ];

  # Disable .NET telemetry
  environment.variables.DOTNET_CLI_TELEMETRY_OPTOUT = "1";
}
