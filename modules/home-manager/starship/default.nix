{lib, ...}: {
    enable = true;
    settings = {
      format = lib.concatStrings [
        "$directory$git_branch$git_status$python\n"
        "$character"
      ];

      character = {
        success_symbol = "[▶](bold green)";
        error_symbol = "[▶](bold red)";
      };

      directory = {
        format = "[$path]($style)( [$read_only]($read_only_style))";
        home_symbol = "~";
        read_only = "";
        truncation_symbol = ".../";
      };

      git_branch = {
        format = "( [$branch(:$remote_branch)]($style))";
        style = "#8087A4";
      };

      git_status = {
        format = "( [$all_status]($style))";
        modified = "󱈸";
      };

      python = {
        format = "( [$symbol \${version}]($style bold) [$virtualenv]($style italic))";
        python_binary = "python";
        style = "yellow";
        symbol = "";
        version_format = "$raw";
      };

      nodejs = {
        format = "( [$symbol \${version}]($style bold) [$symbol \${symbol}]($style italic))";
        node_binary = "node";
        style = "green";
        symbol = "";
        version_format = "$raw";
      };

      rust = {
        format = "( [$symbol \${version}]($style bold) [$symbol \${symbol}]($style italic))";
        rust_binary = "rustc";
        style = "red";
        symbol = "";
        version_format = "$raw";
      };

      dotnet = {
        format = "( [$symbol \${version}]($style bold) [$symbol \${symbol}]($style italic))";
        dotnet_binary = "dotnet";
        style = "blue";
        symbol = "";
        version_format = "$raw";
      };
  };
}