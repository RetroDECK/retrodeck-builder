# NOT WORKING
Until flapak can solve the issue of bwrap

# retrodeck-builder
A docker container to ease RetroDECK's build

Example usage:
```bash
docker run --rm \
            -v "$PWD:/workspace" \
            -w /workspace \
            ghcr.io/retrodeck/retrodeck-builder:latest \
            --force-clean \
            --repo="/workspace/repo" \
            "/workspace/build-dir" \
            "net.retrodeck.retrodeck.yml"
```
