{
  description = "A basic script for converting toml to nix";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
  };

  outputs = {
    self,
    nixpkgs,
  }: let
    forAllSystems = function:
      nixpkgs.lib.genAttrs [
        "x86_64-linux"
        "aarch64-linux"
        "x86_64-darwin"
        "aarch64-darwin"
      ] (system: function nixpkgs.legacyPackages.${system});
  in {
    formatter = forAllSystems (pkgs: pkgs.alejandra);

    packages = forAllSystems (pkgs: {
      default = pkgs.callPackage ./default.nix {};
    });

    devShells = forAllSystems (pkgs: {
      default = pkgs.mkShell {
        buildInputs = [
          pkgs.just
          pkgs.python311
          pkgs.ruff
        ];
      };
    });
  };
}
