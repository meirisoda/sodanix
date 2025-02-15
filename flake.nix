{
  inputs = {
    nixpkgs = {
      url = github:NixOS/nixpkgs/nixos-unstable;
    };
    home-manager = {
      url = github:nix-community/home-manager;
    };
    nixos-hardware = {
      url = github:NixOS/nixos-hardware/master;
    };
    nixpkgs-stable = {
      url = github:NixOS/nixpkgs/nixos-24.05;
    };
    nixpkgs-kernel = {
      url = github:NixOS/nixpkgs/955fb771416a6d65bc3ee868221f86f838b40828;
      flake = false; 
    };
    nix-index-database = {
      url = "github:Mic92/nix-index-database";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    # hyprland = {
    #   url = "github:hyprwm/Hyprland/f94264928a8ab4da8759d4ded25a46af44451d38";
    # };
    plasma-manager = {
      url = "github:nix-community/plasma-manager";
      inputs.nixpkgs.follows = "nixpkgs";
      inputs.home-manager.follows = "home-manager";
    };
    sodasddm = {
      url = "github:meirisoda/kde-plasma-sodasddm";
      flake = false;
    };
    auto-cpufreq = {
      url = "github:AdnanHodzic/auto-cpufreq";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    # linux-kernel = {
    #   url = "git+file:///home/soda/Documents/nix/linux";
    #   flake = false; 
    # };
    htms = {
      url = "github:tnichols217/htms";
    };
  }; 

  outputs = { nixpkgs, nixpkgs-stable, nixpkgs-kernel, home-manager, plasma-manager, nixos-hardware, nix-index-database, auto-cpufreq, ... }@attrs: let 
    config = { 
      allowUnfree = true; 
      # cudaSupport = true;
      permittedInsecurePackages = [ 
        "electron-25.9.0" # obsidian
      ];
    };
    rogmodules = [
      nixos-hardware.nixosModules.asus-zephyrus-ga402
      home-manager.nixosModules.default
      nix-index-database.nixosModules.nix-index
      auto-cpufreq.nixosModules.default
      # plasma-manager.homeManagerModules.plasma-manager
      # plasma-manager.homeManagerModules.plasma-manager
      ./configuration.nix
    ];
    xpsmodules = [
      nixos-hardware.nixosModules.dell-xps-13-9380
      home-manager.nixosModules.default
      nix-index-database.nixosModules.nix-index
      # plasma-manager.homeManagerModules.plasma-manager
      # plasma-manager.homeManagerModules.plasma-manager
      ./configuration.nix
    ];
    allConfig = {
      inherit attrs;
      pkgs = import nixpkgs { system = "x86_64-linux"; inherit config; };
      stablepkgs = import nixpkgs-stable { system = "x86_64-linux"; inherit config; };
      kernelpkgs = import nixpkgs-kernel { system = "x86_64-linux"; inherit config; };
      hostname = "sodaROG"; 
    };
  in {
    nixosConfigurations = {
      sodaROG = nixpkgs.lib.nixosSystem { # ROG
        system = "x86_64-linux";
        specialArgs = allConfig;
        modules = rogmodules;
      };
      sodaXPS = nixpkgs.lib.nixosSystem { # XPS
        system = "x86_64-linux";
        specialArgs = allConfig // { hostname = "sodaXPS"; };
        modules = xpsmodules;
      };
    };
  };
}