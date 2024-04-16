# NixOS Configuration

Here is my global NixOS configuration

## Install

Check if Nix version is >= 2.4 

```bash
nix --version
```

Allow experimental `flakes`

```bash
export NIX_CONFIG="experimental-features = nix-command flakes"
```

Clone this repo

```bash 
git clone https://github.com/eRgo35/nixos ~/.dots
```

```bash 
cd ~/.dots
```

## Usage

Apply system configuration

```bash 
sudo nixos-rebuild switch --flake .#hostname
```

Apply user configuration

```bash 
home-manager switch --flake .#mike@zion
```
