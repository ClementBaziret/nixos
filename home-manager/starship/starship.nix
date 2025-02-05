{
  lib,
  ...
}:

{
  programs.starship = {
    enable = true;
    enableBashIntegration = true;

    settings = {
      add_newline = true;

      format = lib.concatStrings [
        "$username"
        "$directory"
        "$git_branch"
        "$git_state"
        "$git_status"
        "$cmd_duration"

        "$line_break"

        "$shlvl"
        "$status"
        "$character "
      ];

      shlvl = {
        disabled = false;
        threshold = 1;
        symbol = "";
        format = "[ $shlvl$symbol ]($style)";
        style = "bright-green";
      };
      username = {
        show_always = true;
        style_user = "bold yellow";
        style_root = "bold red";
        format = "\\[[$user]($style)\\]";
      };
      directory = {
        truncation_symbol = "…/";
        truncation_length = 3;
        truncate_to_repo = false;
        style = "bold blue";
        read_only_style = "white";
        read_only = " ";
        format = "\\[[$read_only]($read_only_style)[$path]($style)\\]";
      };
      git_branch = {
        style = "bold green";
        symbol = "";
        format = "\\[[$branch]($style)";
      };
      git_state = {
        style = "bold green";
        format = "[ $state($progress_current/$progress_total)]($style)";
      };
      git_status = {
        style = "bold green";
        format = "[ $ahead_behind]($style)\\]";

        ahead = "󰶼\${count}";
        behind = "󰶹\${count}";
        diverged = "󰶹\${ahead_count} 󰶼\${behind_count}";
        up_to_date = "";
      };
      character = {
        success_symbol = "[](bright-green)";
        error_symbol = "[](bright-red)";
        format = "$symbol";
      };
      status = {
        disabled = false;
        format = "[$status ]($style)";
        style = "bold fg:bright-red";
      };
      cmd_duration = {
        style = "bold white";
        format = "\\[[⏱ $duration]($style)\\]";
        min_time = 1000;
        show_milliseconds = true;
      };
    };
  };
}
