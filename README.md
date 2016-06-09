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

## Running Ansible

Once the repo's been bootstrapped, machines can be provisioned using Ansible plays.

Useful flags include:

- `-l <host pattern>` — Limits play to hosts matching the given pattern
- `-t <tags>` — Limits play to tasks with the given (comma-separated) tags

Examples:

```bash
# Configure localhost (knows to use ssh_connection=local)
ansible-playbook dotfiles.yml -l localhost

# Configure git everywhere
ansible-playbook dotfiles.yml -t git

# Configure zsh and homebrew (brew will only run on OSX hosts)
ansible-playbook dotfiles.yml -t zsh,brew
```
