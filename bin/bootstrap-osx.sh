#!/bin/sh

# === ARGS === #
# where to install the project
project_dir=${1-$PWD}

# dotfiles git repo
git_repo=${2-"git@github.com:danschmidt5189/dotfiles.git"}
# === END ARGS === #

# XCode can't be installed from the script
if [ command -v xcode-select >/dev/null 2>&1 ]; then
  echo "Please install xcode-select from the App store"
  exit 1
fi

# Homebrew
if [ command -v brew >/dev/null 2>&1 ]; then
  echo "Installing Homebrew..."
  ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
else
  echo "Homebrew already installed, skipping..."
fi

# Git
if [ command -v git >/dev/null 2>&1 ]; then
  echo "Installing Git..."
  brew install git
else
  echo "Git already installed, skipping..."
fi

# Ansible
if [ command -v ansible >/dev/null 2>&1 ]; then
  echo "Installing Ansible..."
  brew install ansible
else
  echo "Ansible already installed, skipping..."
fi

# Clone the repo
git clone $git_repo $project_dir

# Provision
pushd $project_dir
ansible-playbook play-configure.yml --connection=local --limit=localhost --verbose
