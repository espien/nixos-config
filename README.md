# NixOS Configuration

My personal NixOS + Home Manager setup, managed as a Nix flake. It targets a single machine, `desktop` (x86_64-linux), running GNOME on `nixos-unstable`.

Home Manager runs as a NixOS module, so the system and user configuration are built and applied together in one step.

## Usage

Apply the configuration (system + Home Manager):

```sh
sudo nixos-rebuild switch --flake .#desktop
```

Build without applying, to check that everything evaluates:

```sh
nix build .#nixosConfigurations.desktop.config.system.build.toplevel
```

Update flake inputs:

```sh
nix flake update
```

## Layout

```
.
├── flake.nix                     # Inputs and the nixosConfigurations.desktop output
├── system/desktop/
│   ├── configuration.nix         # System entry point: users, packages, overlays
│   ├── hardware-configuration.nix
│   └── modules/                  # One file per concern, auto-imported
│       ├── audio.nix
│       ├── boot.nix
│       ├── gnome.nix
│       ├── idea.nix              # IntelliJ IDEA with plugins
│       ├── locale.nix
│       ├── services.nix          # Docker, Steam, Mullvad, Jellyfin
│       └── tailscale.nix
└── home-manager/
    ├── espien/home.nix           # Home Manager entry point for my user
    └── programs/                 # One file per program, auto-imported
        └── simple.nix            # Programs that only need `enable = true;`
```

## Flake inputs

- **nixpkgs** (`nixos-unstable`)
- **home-manager**, following nixpkgs
- **nix-vscode-extensions**: VSCodium extensions from Open VSX, available as `pkgs.open-vsx.<publisher>.<extension>`
- **nix-jetbrains-plugins**: builds IntelliJ IDEA with plugins included

## Notes

- Jellyfin, Docker and Tailscale are configured to not start on boot.
- `nixd` (language server) and `nixfmt` (formatter) are installed system-wide and set up in VSCodium.
