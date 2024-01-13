{
  # Get the repos for stuff you want aka maybe nur later? 
  inputs = {
    nixpkgs = {
      url = github:NixOS/nixpkgs/nixos-unstable;
    };
    home-manager = {
      url = github:nix-community/home-manager;
      # instead of using nixpkgs version in home-manager, use the one I defined above! aka. STABLE
    };
    nixos-hardware = {
      url = github:NixOS/nixos-hardware/master;
    };
    nixpkgs-stable = {
      url = github:NixOS/nixpkgs/nixos-23.11;
    };
    sodasddm = {
      url = github:meirisoda/kde-plasma-sodasddm;
      flake = false;
    };
  }; # MAKE SURE TO UPDATE THE FUCKING FLAKE.LOCK PLEASE

  # build stuff! gives you what you want!! 
  # MAKE SURE TO CALL THE INPUTS HERE (below)
  outputs = { nixpkgs, nixpkgs-stable, home-manager, nixos-hardware, sodasddm, ... }: let 
    config = { 
      allowUnfree = true; 
      permittedInsecurePackages = [ # FUCK OBSIDIAN
        "electron-25.9.0"
      ];
    };
  in {
    nixosConfigurations."sodanix" = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      specialArgs = {
        pkgs = import nixpkgs { 
          inherit config; # it's up there
          system = "x86_64-linux"; 
        };
        stablepkgs = import nixpkgs-stable { 
          inherit config; # it's up there
          system = "x86_64-linux"; 
        };
        inherit sodasddm;
      };
      modules = [
        nixos-hardware.nixosModules.asus-zephyrus-ga402
        home-manager.nixosModules.default
        ./configuration.nix
      ];
    };
  };
}