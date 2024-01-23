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

  outputs = { nixpkgs, nixpkgs-stable, home-manager, nixos-hardware, sodasddm, watershot,... }@attrs: let 
    config = { 
      allowUnfree = true; 
      cudaSupport = true;
      permittedInsecurePackages = [ 
        "electron-25.9.0"
      ];
    };
    # TODO figure out a better way to do this
    rogmodules = [
      nixos-hardware.nixosModules.asus-zephyrus-ga402
      home-manager.nixosModules.default
      ./configuration.nix
    ];
    xpsmodules = [
      nixos-hardware.nixosModules.dell-xps-13-9380
      home-manager.nixosModules.default
      ./configuration.nix
    ];
    allConfig = {
      inherit attrs;
      pkgs = import nixpkgs { system = "x86_64-linux"; inherit config; };
      stablepkgs = import nixpkgs-stable { system = "x86_64-linux"; inherit config; };
      inherit sodasddm; 
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