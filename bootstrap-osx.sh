#!/bin/bash

# NOTE: Install XCode from the app store.

# Homebrew
if [ command -v brew >/dev/null 2>&1 ]; then
  echo "Installing Homebrew..."
  ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
else
  echo "Homebrew already installed, skipping..."
fi

# Ansible
if [ command -v ansible >/dev/null 2>&1 ]; then
  echo "Installing Ansible..."
  brew install ansible
else
  echo "Ansible already installed, skipping..."
fi

# Provision
ansible-playbook setup-current-user.yml -v -c local -i inventory -l localhost $@
