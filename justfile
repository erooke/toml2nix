# by default list all the actions
@_default:
	just --list

alias fmt := format

# format the code
format:
	ruff format toml2nix
	ruff check --select I --fix toml2nix
	nix fmt
