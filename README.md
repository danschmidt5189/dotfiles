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

## Ansible

### Custom Inventory

Inventory files are stored in the `inventory` directory. Dotfiles ships with only `inventory/localhost`, which points to the local machine, but you can include a custom inventory by defining it elsewhere and symlinking it to `inventory`.

For example, the bootstrap script includes `/etc/ansible/dotfiles.hosts`.

### Custom Facts

Dotfiles allows host-specific customizations by specifying variables in `/etc/ansible/facts.d/dotfiles.fact`.

For example, this can be used to customize the Git config like so:

```bash
cat /etc/ansible/facts.d/dotfiles.fact
[git]
git_config_email = foo@bar.com
```

### Running Plays

```bash
# Provision all machines
ansible-playbook dotfiles.yml

# Provision localhost only
ansible-playbook dotfiles.yml -l localhost

# Run only the "git" tasks
ansible-playbook dotfiles.yml -t git

# Run "zsh" and "brew" tasks, but only on hosts in the "laptops" group
ansible-playbook dotfiles.yml -t zsh,brew -l laptops
```
