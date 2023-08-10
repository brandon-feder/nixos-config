# System configuration
{ inputs, lib, config, pkgs, ... }: {
	imports = [
		./hardware-configuration.nix
		inputs.hyprland.nixosModules.default
	];

	nix = {
		# This will add each flake input as a registry
		# To make nix3 commands consistent with your flake
		registry = lib.mapAttrs (_: value: { flake = value; }) inputs;

		# This will additionally add your inputs to the system's legacy channels
		# Making legacy nix commands consistent as well, awesome!
		nixPath = lib.mapAttrsToList (key: value: "${key}=${value.to.path}") config.nix.registry;

		settings = {
			# Enable flakes and new 'nix' command
			experimental-features = "nix-command flakes";

			# Deduplicate and optimize nix store
			auto-optimise-store = true;
		};
	};

	# set timezone
	time.timeZone = "America/New_York";

	# enable hyprland
	programs.hyprland.enable = true;

	# limit generations
	boot.loader.systemd-boot.configurationLimit = 5;

	# networkig
	networking.networkmanager.enable = true;
		networking.hostName = "koalas-laptop";

	# bootloader
	boot.loader.systemd-boot.enable = true;

	# set shell
	programs.fish.enable = true;

	# system-wide user settings
	users.users = {
		koala = {
			isNormalUser = true;
			openssh.authorizedKeys.keys = [];
			extraGroups = [ "wheel" ];
			shell = pkgs.fish;
		};
	};

	# enable tlp
	services.tlp.enable = true;

	# enable bluetooth
	services.blueman.enable = true;
	hardware.bluetooth.enable = true;

	# enable sound
	sound.enable = true;
	hardware.pulseaudio.enable = true;

	# https://nixos.wiki/wiki/FAQ/When_do_I_update_stateVersion
	system.stateVersion = "23.05";
}
