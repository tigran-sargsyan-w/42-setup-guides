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

---

## 🛟 Troubleshooting: “Permission denied (publickey)” & push issues

> Works for campus networks like **42**, where port 22 may be blocked.  
> Follow steps in order — stop at the first one that fixes your issue.

### 0) Quick checklist
- 🔑 **Correct key loaded** into `ssh-agent`
- 🌐 **Port 443** forced for GitHub SSH (if campus blocks 22)
- 👤 **The same public key** is added in GitHub → Settings → *SSH and GPG keys* (user-level, not Deploy key)
- 🔗 **Remote URL** is SSH (`git@github.com:...`) not HTTPS
- 🧾 You **have write access** to the target repo (or push to your fork)

### 1) Does SSH agent have your key?
```bash
eval "$(ssh-agent -s)"
ssh-add -l || true            # see identities
# If empty:
ssh-add ~/.ssh/ssh_github     # or your key path (id_ed25519, etc.)
ssh-add -l
```

> If your key has a different name, use that exact filename.  
> If permissions error appears, fix: `chmod 600 ~/.ssh/ssh_github` (and `chmod 700 ~/.ssh` dir).

### 2) Force GitHub SSH over **port 443** (recommended at 42)
Create or edit `~/.ssh/config`:
```
Host github.com
    HostName ssh.github.com
    Port 443
    User git
    IdentityFile ~/.ssh/ssh_github   # or ~/.ssh/id_ed25519
    IdentitiesOnly yes
```
Test:
```bash
ssh -T git@github.com
# Expected: "Hi <your_login>! You've successfully authenticated..."
```

### 3) Ensure the **public key** in GitHub matches your local key
Show your pubkey and paste it into GitHub → Settings → **SSH and GPG keys**:
```bash
cat ~/.ssh/ssh_github.pub
```
> Don’t mix up with **Deploy keys** (repo-level). Deploy keys only grant access to **one** repository.

### 4) Check that your **remote URL** is SSH (not HTTPS)
```bash
git remote -v
# expected: origin  git@github.com:<your_login>/<repo>.git
# fix if needed:
git remote set-url origin git@github.com:<your_login>/<repo>.git
```

### 5) Still failing? Get verbose SSH logs
```bash
ssh -vT git@github.com
```
Look for:
- `Offering public key: /home/.../.ssh/ssh_github` → confirms which key is used
- `Authentication succeeded` → success
- If you see a wrong key — specify `IdentityFile` in `~/.ssh/config` and reload agent:
  ```bash
  ssh-add -D
  ssh-add ~/.ssh/ssh_github
  ```

### 6) Common error patterns
- **`Permission denied (publickey).`** — key not loaded or wrong key on GitHub.
- **`ERROR: Permission to org/repo.git denied to <you>.`** — you authenticated, but **no write access**. Push to your **fork** or ask to be added with **Write** permissions.
- **Password prompt on HTTPS** — GitHub no longer accepts account passwords for Git. Either switch to SSH (recommended) or use a **Personal Access Token (PAT)** in the HTTPS URL.

### 7) Multiple keys / multiple accounts
If you use different keys for GitHub/42 (Vogsphere) etc., define hosts:
```
Host github.com
    HostName ssh.github.com
    Port 443
    User git
    IdentityFile ~/.ssh/ssh_github
    IdentitiesOnly yes

Host vogsphere
    HostName vogsphere.42.fr
    IdentityFile ~/.ssh/ssh_42_vogsphere
    IdentitiesOnly yes
```
Then use the matching remote URL for each host.

### 8) File permissions (OpenSSH is strict)
```bash
chmod 700 ~/.ssh
chmod 600 ~/.ssh/*           # private keys
chmod 644 ~/.ssh/*.pub       # public keys
```

### 9) Final push
```bash
git push -u origin main
```

> If problems persist, capture:
> ```bash
> ssh -T git@github.com
> git remote -v
> ssh -vT git@github.com |& sed -n '1,120p'
> ```
> and analyze which step breaks.
