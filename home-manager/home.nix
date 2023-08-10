{ inputs, lib, config, pkgs, ... }: 

let 
	tex = with pkgs; (texlive.combine {
		inherit (texlive) scheme-medium
		tcolorbox environ geometry titling zref needspace
		titlesec mdframed enumitem lipsum cleveref;
});
in {
	# You can import other home-manager modules here
	imports = [
		inputs.hyprland.homeManagerModules.default
		../config/hyprland.nix
		../config/waybar.nix
		../config/neovim.nix
		../config/git.nix
		../config/fuzzel.nix
	];

	nixpkgs = {
		# Compile waybar with support for thw "wlr/..." modules
		overlays = [
			(self: super: {
				waybar = super.waybar.overrideAttrs (oldAttrs: {
					mesonFlags = oldAttrs.mesonFlags ++ [ "-Dexperimental=true" ];
				});
			})
    ];             


  	config = {
			# allow unfree packages
			allowUnfree = true;
			allowUnfreePredicate = (_: true);
      permittedInsecurePackages = [
        "openssl-1.1.1u"
      ];
		};
	};

	home = {
  	username = "koala";
    homeDirectory = "/home/koala";

    packages = with pkgs; [
			# kernel packages
			linuxKernel.packages.linux_zen.v4l2loopback
			
      # display manager
      ly

			# file utilities
			evince
      zathura
      gnome.eog
			gnome.nautilus
			xdg-desktop-portal-hyprland

			# settings
			pulseaudio
			alsa-utils
			pavucontrol
			wlr-randr
			hyprpaper
			
      # tex
      tex

			# misc
			mount
			wl-clipboard
			neofetch
			nerdfonts
			grim
			slurp
			tlp
			networkmanagerapplet
			ffmpeg

			# python and python packages (currently v11)
			python311

			# other apps
			zoom-us
			notion-app-enhanced
			sublime4
			system76-keyboard-configurator
      gimp
      discord

			# gnome
      gnome.adwaita-icon-theme

      # website building
      ruby
      jekyll

      # C++ development
      cmake
      gnumake
      gcc
		];
	};

	programs.home-manager.enable = true;
	
	programs.chromium.enable = true;
	programs.btop.enable = true;
	programs.sagemath.enable = true;
	programs.alacritty.enable = true;
	programs.fish = {    
		enable = true;
		interactiveShellInit = ''
			set fish_greeting # Disable greeting
		'';
	};

	programs.obs-studio = {
		enable = true;
		plugins = [
			pkgs.obs-studio-plugins.wlrobs
		];
	};

	# Nicely reload system units when changing configs
	systemd.user.startServices = "sd-switch";

	# https://nixos.wiki/wiki/FAQ/When_do_I_update_stateVersion
	home.stateVersion = "23.05";
}
