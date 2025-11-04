# 09 — Network & Proxy

If your campus requires proxies, configure:

## git
```bash
git config --global http.proxy  http://user:pass@proxy:port
git config --global https.proxy http://user:pass@proxy:port
```

## apt (systemwide needs sudo) — skip if no sudo

## pip (user)
```bash
pip config set global.proxy "http://user:pass@proxy:port"
```

> Store secrets in environment variables where possible.
