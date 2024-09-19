{ pkgs , ... }: {
  enable = true;
  settings = {
    width = "33%";
    corner-radius = 10;
    outline-width = 0;

    # Double quotes are needed to avoid Home Manager
    # to left the parameter unset
    prompt-text = "\"\"";

    input-color = "ffffff";
    background-color = "1e1e2e";

    border-width = 4;
    border-color= "be95ff";

    padding-top = "2%";
    padding-bottom = "2%";
    padding-right= "1%";
    padding-left = "1%";

    font = "JetBrains Mono";
    font-size = 20;

    placeholder-text = "Search...";
    placeholder-color = "393939";

    default-result-color = "525252";
    result-spacing = 25;

    selection-color = "ffffff";
    selection-match-color = "82cfff";
  };
}