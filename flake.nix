{
  description = "Plymouth theme: Evil NixOS";

  inputs.nixpkgs.url = "github:NixOS/nixpkgs";

  outputs =
    { self, nixpkgs, ... }:
    {
      packages = {
        # Define a package for the Plymouth theme
        default =
          let
            themeName = "Evil NixOS";
          in
          nixpkgs.lib.makeDerivation {
            pname = themeName;
            version = "1.0.0";

            src = ./.;

            buildInputs = [ nixpkgs.plymouth ];

            installPhase = ''
              mkdir -p $out/share/plymouth/themes/${themeName}
              cp -r * $out/share/plymouth/themes/${themeName}
            '';

            meta = with nixpkgs.lib; {
              description = "A Plymouth theme: ${themeName}";
              license = licenses.mit; # Replace with the actual license if known
              maintainers = [ "cig0" ];
            };
          };
      };
    };
}
