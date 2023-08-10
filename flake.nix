{
	description = "Brandons NixOS Config";

	inputs = {
		nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";

		home-manager = {
			url = "github:nix-community/home-manager";
			inputs.nixpkgs.follows = "nixpkgs";

		};

		hyprland.url = "github:hyprwm/Hyprland";
	};

	outputs = { nixpkgs, home-manager, hyprland, ... }@inputs: {	
		nixosConfigurations.koalas-laptop = nixpkgs.lib.nixosSystem {
			specialArgs = { inherit inputs; };
			modules = [ ./nixos/configuration.nix ];
		};

		homeConfigurations."koala@koalas-laptop" = home-manager.lib.homeManagerConfiguration { 
			pkgs = nixpkgs.legacyPackages."x86_64-linux";
			extraSpecialArgs = {inherit inputs;};
			modules = [ ./home-manager/home.nix ];
		};
	};
}
