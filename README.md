# nixos-config

Personal NixOS flake configuration for my ThinkPad T480s.

## Layout

```
flake.nix          inputs and the nixosConfigurations output
hosts/
  t480s/           this machine: hostname, hardware scan, module imports
modules/           shared configuration, one file per subsystem
```

Modules are grouped by subsystem (boot, locale, networking, desktop,
audio/bluetooth, printing, shell, gaming, virtualisation, users, packages,
nix settings) — read the files directly rather than a list here, they're
short and the names say what they are.

## Adding a second host

1. `mkdir hosts/<name>`, add its `hardware-configuration.nix`.
2. Write `hosts/<name>/default.nix` importing whichever `modules/*.nix` apply,
   plus any host-only options.
3. Add a `nixosConfigurations.<name>` entry in `flake.nix`.

## Rebuilding

```
cd ~/nixos-config
sudo nixos-rebuild switch --flake .#t480s
```

New files must be `git add`ed before rebuilding — flakes only see files known
to git (tracked or staged).

## Updating

```
nix flake update
sudo nixos-rebuild switch --flake .#t480s
```

Commit the updated `flake.lock` once you're happy with the result.
