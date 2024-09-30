{lib, ...}: {
    enable = true;
    settings = {
      format = lib.concatStrings [
        "$directory$git_branch$git_status$python$nodejs$rust$dotnet\n"
        "$character"
      ];

     character = {
        success_symbol = "[](#dd7878)";
        error_symbol = "[](#dd7878)";
      };

      directory = {
        format = "[ $path]($style)( [$read_only]($read_only_style))";
        style = "#f38ba8";
        home_symbol = "~";
        read_only = "";
        truncation_symbol = "~/";
      };

      git_branch = {
        format = "( [$branch(:$remote_branch)]($style))";
        style = "#8087A4";
        symbol = "";
      };

      git_status = {
        format = "( [$all_status]($style))";
        modified = "󱈸";
      };

      python = {
        format = "( [$symbol \${version}]($style ) [$virtualenv]($style italic))";
        python_binary = "python";
        style = "yellow";
        symbol = "";
        version_format = "$raw";
      };

      nodejs = {
        format = "( [$symbol \${version}]($style ) [$symbol \${symbol}]($style italic))";
        style = "green";
        symbol = "󰎙";
        version_format = "$raw";
      };

      rust = {
        format = "( [$symbol \${version}]($style ) [$symbol \${symbol}]($style italic))";
        style = "red";
        symbol = "";
        version_format = "$raw";
      };

      dotnet = {
        format = "( [$symbol \${version}]($style ) [$symbol \${symbol}]($style italic))";
        style = "blue";
        symbol = "󰪮";
        version_format = "$raw";
      };
  };
}