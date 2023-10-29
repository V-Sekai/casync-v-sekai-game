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
./extract.sh
```

## Related Projects

For additional information, you might find the following project interesting: [DanEngelbrecht/longtail](https://github.com/DanEngelbrecht/longtail).
