{
  description = "A flake giving access to fonts that I use, outside of nixpkgs.";

  inputs.nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
  inputs.flake-utils.url = "github:numtide/flake-utils";

  outputs = {
    self,
    nixpkgs,
    flake-utils,
  }:
    flake-utils.lib.eachDefaultSystem (system: let
      pkgs = nixpkgs.legacyPackages.${system};
    in {
      defaultPackage = pkgs.symlinkJoin {
        name = "myfonts-1.0.0";
        paths =
          builtins.attrValues
          self.packages.${system};
      };

      packages.urbanist = pkgs.stdenvNoCC.mkDerivation {
        name = "urbanist-font";
        dontConfigue = true;
        src = pkgs.fetchzip {
          url = "https://befonts.com/wp-content/uploads/2021/11/Urbanist-master.zip";
          sha256 = "sha256-Bx1Clqk7u0bxDkiqZPX+ZIPC9JtXb6mnbZpDoKUpZys=";
          stripRoot = false;
        };
        installPhase = ''
          mkdir -p $out/share/fonts
          cp -R $src/Urbanist-master/fonts/otf $out/share/fonts/opentype
        '';
        meta = {description = "An Urbanist Font Family derivation.";};
      };
    });
}
