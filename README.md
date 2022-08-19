# Config

This is a nix home-manager based configuration of my environment.

## Installation

```bash
nix shell nixpkgs#home-manager
home-manager switch --flake 'git+https://github.com/mrjerzy/config#mbp'
```

## Update

```bash
nix flake update
home swith home-manager switch --flake '.#mbp'
```
