#!/bin/sh

# use "-hmo" flag to switch home-manager only

if [[ $* == *-hmo* ]]
then
	home-manager switch --flake .#koala@koalas-laptop
else
	sudo nixos-rebuild switch --flake .#koalas-laptop --use-remote-sudo
	home-manager switch --flake .#koala@koalas-laptop
fi
