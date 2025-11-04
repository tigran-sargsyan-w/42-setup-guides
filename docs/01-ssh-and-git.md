# 01 — SSH & Git (GitHub + 42 intra)

## TL;DR
```bash
# 1) Generate an SSH key
ssh-keygen -t ed25519 -C "your_email@example.com"

# 2) Start agent & add key
eval "$(ssh-agent -s)"
ssh-add ~/.ssh/id_ed25519

# 3) Show public key (add it to GitHub & your 42 profile)
cat ~/.ssh/id_ed25519.pub
```

## Git config (recommended)
```bash
git config --global user.name "Your Name"
git config --global user.email "your_email@example.com"
git config --global init.defaultBranch main
git config --global pull.rebase false
git config --global core.autocrlf input
git config --global core.editor "vim"
```

### Optional: GPG commit signing
```bash
# Install gpg (Linux)
# sudo apt install gnupg  # if you have sudo
gpg --full-generate-key
gpg --list-secret-keys --keyid-format=long
# then: git config --global user.signingkey <KEYID>
# and:  git config --global commit.gpgsign true
```
