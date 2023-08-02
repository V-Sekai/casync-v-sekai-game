# casync-v-sekai-game

Licenses are stored as part of each caidx index.

## Optimizing CDN System: Retaining Major and Minor Versions with casync

In our optimized system, we will retain the three most recent major versions of our project. Each major version will also include its minor versions. All these versions are stored together in the main branch because we're using `casync`. Each version has its own separate Git repository, each summing up to 2GB.

```bash
git clone https://github.com/ourproject/v3.git
git clone https://github.com/ourproject/v4.git
git clone https://github.com/ourproject/v5.git
```

Within each major version, we will also keep all its minor versions. However, it's important to note that we do not checkout other git branches than `main`.

```bash
cd v3
git checkout main

cd ../v4
git checkout main

cd ../v5
git checkout main
```

## Rationale for Retaining Major and Minor Versions

1. **Storage Management**: Each version is 2GB, retaining all versions can quickly consume storage resources. By limiting to the three most recent major versions and their minor versions, we manage our storage use effectively.
  
2. **Relevance**: Older versions may become less relevant over time as new features are added and bugs are fixed in newer versions. The three most recent major versions and their minor versions are likely to be the most relevant to current users.
  
3. **Efficiency**: With `casync`, we ensure that only changes are synced, not entire files. This saves bandwidth and storage. Having fewer versions to manage can also make this process more efficient.
  
4. **Simplicity**: Managing a large number of versions can become complex. Retaining three major versions and their minor versions simplifies version management while still providing flexibility.
