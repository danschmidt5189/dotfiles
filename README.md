# dotfiles

Manage packages and settings across development machines, namely:

- Install common packages (git, zsh, tree, ...)
- Configure git (ignores, config)
- Customize zsh

To install locally on Mac OSX:

```bash
git clone git@github.com:danschmidt5189/dotfiles.git && cd dotfiles
chmod +x bootstrap-osx.sh
./bootstrap-osx.sh
```

To provision:

```bash
# On the localhost
ansible-playbook setup-current-user.yml -c local -l localhost -v

# On LAP machines
ansible-playbook setup-current-user.yml -l lap -v
```
