# Homebrew Tap for Vertex

Official [Homebrew](https://brew.sh) tap for [**Vertex**](https://github.com/cicciocanestro/vertex) — native macOS BitTorrent client written in SwiftUI and powered by libtorrent 2.1.

## Installation / Installazione

```bash
brew trust cicciocanestro/tap
brew install --cask cicciocanestro/tap/vertex
```

Or on Homebrew 4/5/6 (where `brew trust` is not required):

```bash
brew install --cask cicciocanestro/tap/vertex
```

> **Note on Gatekeeper (ad-hoc signature):** The Cask includes a `postflight_steps` block that automatically clears the `com.apple.quarantine` extended attribute on `/Applications/Vertex.app`, so Vertex opens directly without the macOS Gatekeeper confirmation dialog.

## Upgrade / Aggiornamento

```bash
brew upgrade --cask cicciocanestro/tap/vertex
```

## Uninstall / Disinstallazione

```bash
brew uninstall --cask vertex
# Optional: also remove preferences and resume data
brew uninstall --zap --cask vertex
```

## Requirements / Requisiti

- macOS 15.0 (Sequoia) or later
- Apple Silicon (`arm64`)
