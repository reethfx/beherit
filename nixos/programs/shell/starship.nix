{ config, pkgs, ... }:

{
  programs.starship = {
    enable = true;
    settings = {
      add_newline = false;
      prompt_order = [
        "username",
        "hostname",
        "directory",
        "git_branch",
        "git_status",
        "rust",
        "nodejs",
        "dotnet",
        "line_break",
        "jobs",
        "cmd_duration",
        "line_break",
        "battery",
        "time",
        "character"
      ];
    };
  };
}
