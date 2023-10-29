# Godot cgo enhancement proposal

The `cgo` feature in Go programming allows you to call C code from Go and vice versa. This can be used to provide a C interface for the `desync` Go library.

## Updating the C Interface

To expose the output directory and the cache directory, you can modify the `DesyncUntar` function to accept these as parameters. Here's how you could do it:

```go
package main

/*
#include <stdlib.h>
*/
import "C"
import (
    "os/exec"
    "unsafe"
    "errors"
    "context"
)

// DesyncUntar is a C-exported function
func DesyncUntar(storeUrl *C.char, indexUrl *C.char, outputDir *C.char, cacheDir *C.char) error {
    store := C.GoString(storeUrl)
    index := C.GoString(indexUrl)
    output := C.GoString(outputDir)
    cache := C.GoString(cacheDir)

    if store == "" || index == "" || output == "" {
        return errors.New("storeUrl, indexUrl, and outputDir are required")
    }

    args := []string{"--no-same-owner", "--store", store, "--index", index, output}
    if cache != "" {
        args = append(args, "--cache", cache)
    }

    cmd := exec.CommandContext(context.Background(), "desync", args...)
    err := cmd.Run()
    if err != nil {
        return err
    }
    return nil
}

func main() {}
```

## Using the Updated Static Library in C Program

You can then call this function from your C program like this:

```c
#include <stdio.h>
#include "desync_c_interface.h"

int main() {
    int result = DesyncUntar("https://v-sekai.github.io/casync-v-sekai-game/store", 
                "https://github.com/V-Sekai/casync-v-sekai-game/raw/main/vsekai_game_windows_x86_64.caidx",
                "/path/to/output/directory",
                "/path/to/cache/directory");
    if (result != 0) {
        printf("Error: storeUrl, indexUrl, and outputDir are required\n");
    }
    return 0;
}
```

In this C code, the `DesyncUntar` function is called with four parameters: the store URL, the index URL, the output directory, and the cache directory.
