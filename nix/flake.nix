{
  description = "Nixos config flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    ghostty = {
      url = "github:ghostty-org/ghostty";
    };

    hyprland = {
      type = "git";
      url = "https://github.com/hyprwm/Hyprland";
      submodules = true;
    };

    hypr-contrib = {
      url = "github:hyprwm/contrib";
    };

    hyprpicker = {
      url = "github:hyprwm/hyprpicker";
    }; 

    nvf = {
      url = "github:notashelf/nvf";
    };

    spicetify-nix = {
      url = "github:gerg-l/spicetify-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    treefmt-nix = {
      url = "github:numtide/treefmt-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    zen-browser = {
      url = "github:0xc000022070/zen-browser-flake";
    };

    yazi-plugins = {
      url = "github:yazi-rs/plugins";
      flake = false;
    };

  };

  outputs =
    {
      self,
      nixpkgs,
      treefmt-nix,
      ...
    }@inputs:
    let
      username = "sakuya";
      system = "x86_64-linux";
      pkgs = import nixpkgs {
        inherit system;
        config.allowUnfree = true;
      };
      lib = nixpkgs.lib;


      treefmtEval = treefmt-nix.lib.evalModule pkgs ./treefmt.nix;
    in
    {
      nixosConfigurations = {
        # desktop = nixpkgs.lib.nixosSystem {
        #   inherit system;
        #   modules = [ ./hosts/desktop ];
        #   specialArgs = {
        #     host = "desktop";
        #     inherit self inputs username;
        #   };
        # };
        laptop = nixpkgs.lib.nixosSystem {
          inherit system;
          modules = [ ./host/laptop ];
          specialArgs = {
            host = "laptop";
            inherit self inputs username;
          };
        };
        # vm = nixpkgs.lib.nixosSystem {
        #   inherit system;
        #   modules = [ ./hosts/vm ];
        #   specialArgs = {
        #     host = "vm";
        #     inherit self inputs username;
        #   };
        # };

      };
    };
}
