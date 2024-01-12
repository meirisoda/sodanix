{
  # Get the repos for stuff you want aka maybe nur later? 
  inputs = {
    nixpkgs = {
      url = github:NixOS/nixpkgs/nixos-23.11;
    };
    home-manager = {
      url = github:nix-community/home-manager;
      inputs.nixpkgs.follows = "nixpkgs"; # instead of using nixpkgs version in home-manager, use the one I definted above! aka. STABLE
    };
    nixos-hardware = {
      url = github:NixOS/nixos-hardware/master;
    };
  }; # MAKE SURE TO UPDATE THE FUCKING FLAKE.LOCK PLEASE

  # build stuff! gives you what you want!! 
  # MAKE SURE TO CALL THE INPUTS HERE (below)
  outputs = { nixpkgs, home-manager, nixos-hardware, ... }: let 
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
      };
      modules = [
        nixos-hardware.nixosModules.asus-zephyrus-ga402
        home-manager.nixosModules.default
        ./configuration.nix
      ];
    };
  };
}