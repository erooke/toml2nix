{
  lib,
  python3Packages,
}:
python3Packages.buildPythonApplication rec {
  pname = "toml2nix";
  version = "1.0.0";

  src = ./.;

  pyproject = true;

  build-system = [
    python3Packages.setuptools
  ];

  meta = {
    description = "Convert toml config files to nix";
    mainProgram = "toml2nix";
    homepage = "https://github.com/erooke/toml2nix";
    license = lib.licenses.isc;
    maintainers = with lib.maintainers; [
      erooke
    ];
  };
}
