# dotfiles

Manage packages and settings across development machines, namely:

- Install common packages (git, zsh, tree, ...)
- Configure git (ignores, config)
- Customize zsh

## Bootstrapping OSX

Local provisioning on OSX can be done via a bootstrap script `bin/bootstrap-osx.sh`. Its only dependency is xcode-select, which must be installed via the app store.

```bash
source <(curl -s "https://raw.githubusercontent.com/danschmidt5189/dotfiles/master/bin/bootstrap-osx.sh?token=ACbfgVNDn4BTXaCFf9NauVzOE4IlPGR0ks5XYYzawA%3D%3D") \
    ./dotfiles \
    git@github.com:danschmidt5189/dotfiles.git
```

### Running Plays

```bash
chmod +x site.yml
./site.yml -i some-host,
```

### GitHub HostKey

Known bug — Ansible stalls on Oh-My-Zsh installation if GitHub's hostkey hasn't been accepted yet.
