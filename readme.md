# toml2nix

I like nix and want to configure all the things with it. Sometimes I want to
convert an existing toml file to a nix configuration. This does that.

## Requirements

This uses only vanilla python, version 3.11 or newer. On nix you can run:

```sh
nix run github:erooke/toml2nix
```

and everything should just work...

## Limitations

I wrote this quickly to solve a little problem, it does not handle everything.

1. Nix string interpolation is not escaped. That is to say if your toml file
   has a string of the form "${x}" that will be passed straight through.
2. No attempt was made to format the output well. There is very minimal
   formatting applied but if you want it to be pretty use
   [alejandra](https://github.com/kamadorueda/alejandra) or something.

1 may be fixed if I find the time or motivation, 2 is a non goal.

## Prior art

A rust program called [toml2nix](https://lib.rs/crates/toml2nix) already exists
and was in nixpkgs. It didn't run for me and I could not find any info about it
online.

## Usage

```
usage: toml2nix [-h] [--tab TAB] [-o OUTPUT] [-p] filename

Convert toml files to nix files

positional arguments:
  filename              The toml file to convert. If '-', read from stdin

options:
  -h, --help            show this help message and exit
  --tab TAB             The string used to represent a tab (default '\t')
  -o OUTPUT, --output OUTPUT
                        Where to write output (default stdout)
  -p, --parse           Parse datetimes to strings (default false)
```
