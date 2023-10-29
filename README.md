# V-Sekai Game: Optimizing CDN System with casync

This document provides an overview of our optimized system for retaining major and minor versions of the V-Sekai game using `casync`.

## Overview

In our optimized system, we retain the three most recent major versions of our project. Each major version also includes its associated minor versions. All these versions are stored together in the main branch, thanks to the use of `casync`.

## Why Retain Major and Minor Versions?

There are several reasons why we have chosen to retain both major and minor versions:

1. **Effective Storage Management**: Given that each version is 2GB, retaining all versions can quickly consume storage resources. By limiting ourselves to the three most recent major versions and their minor versions, we can manage our storage use more effectively.

2. **Maintaining Relevance**: As new features are added and bugs are fixed in newer versions, older versions may become less relevant over time. The three most recent major versions and their minor versions are likely to be the most relevant to current users.

3. **Increased Efficiency**: `casync` ensures that only changes are synced, not entire files. This approach saves bandwidth and storage. Having fewer versions to manage can also make this process more efficient.

4. **Simplicity**: Managing a large number of versions can become complex. By retaining only three major versions and their minor versions, we simplify version management while still providing flexibility.

## How to Extract V-Sekai-Game

To extract the V-Sekai game, follow these steps:

```bash
git clone https://github.com/V-Sekai/casync-v-sekai-game.git
cd casync-v-sekai-game
mkdir -p ~/.local/casync-store # Add a cache folder
# Windows operating system
./thirdparty/desync_0.9.5_windows_amd64/desync untar --no-same-owner --cache ~/.local/casync-store --store https://v-sekai.github.io/casync-v-sekai-game/store --index https://github.com/V-Sekai/casync-v-sekai-game/raw/main/vsekai_game_windows_x86_64.caidx vsekai_game_windows_x86_64
# Linux operating system
./thirdparty/desync_0.9.5_linux_amd64/desync untar --no-same-owner --cache ~/.local/casync-store --store https://v-sekai.github.io/casync-v-sekai-game/store --index https://github.com/V-Sekai/casync-v-sekai-game/raw/main/vsekai_game_linux_x86_64.caidx vsekai_game_linux_x86_64
# Macos is not functional
./thirdparty/desync_0.9.5_darwin_amd64/desync untar --no-same-owner --cache ~/.local/casync-store --store https://v-sekai.github.io/casync-v-sekai-game/store --index https://github.com/V-Sekai/casync-v-sekai-game/raw/main/vsekai_game_macos_x86_64.caidx vsekai_game_macos_x86_64
```

## Update repository

1. Use the `build.sh` script in this repository.

## Related Projects

Here are some projects that are related and you might find interesting:

- [Casync](https://github.com/systemd/casync): This is the official documentation for Casync, a tool that allows you to create and manage large file systems efficiently.

- [Desync](https://github.com/folbricht/desync): Desync is a powerful tool for synchronizing data from one location to another. Its repository contains all the necessary files and instructions for its use.

- [Longtail by DanEngelbrecht](https://github.com/DanEngelbrecht/longtail): Longtail is a robust system designed for efficient storage of large amounts of data.
