# Configure formatter for .nix and other repo files
{ pkgs, ... }:
{
  projectRootFile = "flake.nix";

  programs = {
    # Python
    ruff-check.enable = true;
    ruff-format.enable = true

    # Rust
    rustfmt.enable = true;


    # Nix
    deadnix = {
      enable = true;
      no-lambda-pattern-names = true;
    };
    nixfmt = {
      enable = true;
      package = pkgs.nixfmt-rfc-style;
    };
  };

  settings = {
    on-unmatched = "info";
  };
}
