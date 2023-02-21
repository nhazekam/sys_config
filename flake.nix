{
  description = "My Home Manager flake";

  inputs = {
    nixpkgs = {
      url = "github:nixos/nixpkgs/nixpkgs-unstable";
    };
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    
  };

  outputs = {nixpkgs, home-manager, ...} :
    let
      arch = "x86_64-darwin";
    in  {
      defaultPackage.${arch} = home-manager.defaultPackage.${arch};
 
      homeConfigurations.nicholashazekamp = 
	home-manager.lib.homeManagerConfiguration {
          pkgs = nixpkgs.legacyPackages.${arch};

           modules = [
             ./home.nix
          ];
      };
   };
}
