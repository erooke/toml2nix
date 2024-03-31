{
  writers,
  # Deps
  python3,
}:
writers.writePython3Bin "toml2nix" {flakeIgnore = ["E"];} (builtins.readFile ./toml2nix)
