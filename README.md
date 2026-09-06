# Pulse Homebrew Tap

This repository contains the Homebrew formula for [Pulse](https://github.com/rungalileo/pulse), the CLI for deploying, validating, and troubleshooting Splunk Agent Observability.

## Installation

```bash
brew tap rungalileo/pulse
brew install pulse
```

Verify the installation:

```bash
pulse version
```

## Supported platforms

- Apple Silicon macOS (`darwin-arm64`)
- Intel Linux (`linux-amd64`)

Windows releases are published separately as `pulse-windows-amd64.exe` and are not installed through Homebrew.

## Artifact source

The formula downloads versioned binaries from the Pulse Generic Artifactory path:

```text
https://repo.splunkdev.net/artifactory/generic/observability/ao/pulse/<version>/
```

The formula pins each binary with its SHA256 checksum. Public Homebrew installation requires anonymous read access to this Artifactory path.

## Updating the formula

For each Pulse release, update `Formula/pulse.rb` with the new version, Artifactory URLs, and SHA256 values from the release `checksums.txt` file.
