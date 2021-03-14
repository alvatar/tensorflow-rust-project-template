# Tensorflow with Rust (template for NixOS)

## Setup:

1. Download Tensorflow [bindings for C](https://www.tensorflow.org/install/lang_c). Make sure to download the one supporting GPU if you plan on using acceleration.

2. Unpack and copy the files to `/lib`.


## Build

You need to provide the compiler with the path to the downloaded libraries.

```
RUSTFLAGS='-L lib/' cargo build
```

You can run now the binary. On NixOS, the `shell.nix` takes care of setting up the `LD_LIBRARY_PATH` for finding CUDA and the local Tensorflow, but if you are not using NixOS, you can take it as a source of inspiration.


## Code

The example is that one from the official Rust bindings. This project just sets up everything for a quick start.
