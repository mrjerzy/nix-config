# Config

This is a nix home-manager based configuration of my environment.

## Installation

```bash
nix flake clone 'git+https://github.com/mrjerzy/config' --dest ~/nix-config --extra-experimental-features flakes --extra-experimental-features nix-command
cd ~/nix-config
nix shell nixpkgs#home-manager --extra-experimental-features flakes --extra-experimental-features nix-command
home-manager switch --flake '.#mbp'
```

## Update

```bash
nix flake update
home-manager switch --flake '.#mbp'
```
