{ pkgs, ... }:
let
  screenshot = pkgs.writeScriptBin "screenshot" (
    builtins.readFile ./script/screenshot.sh
  );
in
{
  home.packages = with pkgs; [
  #
  ];
}

