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
      url = github:NixOS/nixpkgs/nixos-23.11;
    };
    sodasddm = {
      url = github:meirisoda/kde-plasma-sodasddm;
      flake = false;
    };
    watershot = {
      url = github:Kirottu/watershot; # RUST_BACKTRACE=1 also not working, current open issue on repo
    };
  }; 

  outputs = { nixpkgs, nixpkgs-stable, home-manager, nixos-hardware, sodasddm, watershot,... }: let 
    config = { 
      allowUnfree = true; 
      permittedInsecurePackages = [ 
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