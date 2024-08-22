{
  description = "Thanajor's dotfiles";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    stable.url = "github:nixos/nixpkgs/nixos-24.05";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    hyprland = {
      type = "git";
      url = "https://github.com/hyprwm/hyprland";
      submodules = true;
      # ref = "refs/tags/v0.41.2";
    };

    split-monitor-workspaces = {
      url = "github:Duckonaut/split-monitor-workspaces";
      inputs.hyprland.follows = "hyprland";
    };

    hyprsplit = {
      url = "github:shezdy/hyprsplit";
      inputs.hyprland.follows = "hyprland";
    };

    stylix.url = "github:danth/stylix";

    nixvim = {
      url = "github:nix-community/nixvim";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    spicetify.url = "github:the-argus/spicetify-nix";
  };

  outputs = {
    self,
    nixpkgs,
    stable,
    home-manager,
    ...
  } @ inputs: let
    systems = [
      "aarch64-linux"
      "i686-linux"
      "x86_64-linux"
      "aarch64-darwin"
      "x86_64-darwin"
    ];

    pkgs = import nixpkgs {
      system = "x86_64-linux";
      config.allowUnfree = true;
    };
  in {
    nixosConfigurations.leviatan = nixpkgs.lib.nixosSystem {
      specialArgs = {
        stable = import stable {
          config.allowUnfree = true;
        };
        inherit inputs;
      };
      modules = [
        ./hosts/leviatan/configuration.nix
        inputs.stylix.nixosModules.stylix
      ];
    };

    homeConfigurations.thanajor = home-manager.lib.homeManagerConfiguration {
      pkgs = pkgs; #nixpkgs.legacyPackages.x86_64-linux; # x86_64-darwin for mac
      extraSpecialArgs = {inherit inputs;};
      modules = [
        ./hosts/leviatan/home.nix
        inputs.stylix.homeManagerModules.stylix
        inputs.nixvim.homeManagerModules.nixvim
      ];
    };
  };
}
