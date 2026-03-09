# homebrew-dekk

Homebrew tap for [Dekk](https://github.com/dulvac/dekk) — present markdown-authored slides with a branded dark cinematic visual identity.

## Install

```bash
brew tap dulvac/dekk
brew install dekk
```

## Usage

```bash
dekk ./my-talks                          # serve local slides
dekk https://github.com/org/repo         # serve from GitHub
dekk --port 8080 ./talks                 # custom port
```

## Update

```bash
brew upgrade dekk
# or
dekk --update
```
