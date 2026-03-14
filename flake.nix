{
  description = "A few themes for the helix editor";

  outputs = { self }:
    {
      package = { stdenvNoCC, lib }:
        stdenvNoCC.mkDerivation {
          pname = "helix-themes";
          version = "0.1.0";
          src = lib.fileset.toSource {
            root = ./.;
            fileset = lib.fileset.unions [
              ./build.sh
              ./schemes
              ./palettes
              ./LICENSE
            ];
          };
          phases = [
            "unpackPhase"
            "preBuild"
            "buildPhase"
            "installPhase"
          ];
          preBuild = ''
            chmod +x ./build.sh
            patchShebangs ./build.sh
          '';
          buildPhase = ''
            bash -c ./build.sh
          '';
          installPhase = ''
            mkdir -p $out
            cp -r ./build/*.toml $out
            cp ./LICENSE $out
          '';
          meta = {
            homepage = "https://github.com/CptPotato/helix-themes";
            description = "A few themes for the helix editor";
            license = lib.licenses.mit;
          };
        };

      overlay = final: prev: {
        helix-themes = prev.callPackage self.package { };
      };

      homeManagerModule = { config, lib, pkgs, ... }:
        let
          cfg = config.programs.helix;
        in
        {
          options.programs.helix.themes-package = lib.mkOption {
            type = lib.types.package;
            default = pkgs.callPackage self.package { };
            description = "Package containing TOML theme files for the helix editor.";
          };

          config = lib.mkIf (cfg.enable or false) {
            programs.helix.themes =
              let
                toml2nix = name: _type: builtins.fromTOML
                  (builtins.readFile "${cfg.themes-package}/${name}");
                tomlFiles = lib.filterAttrs
                  (n: _: lib.hasSuffix ".toml" n)
                  (builtins.readDir "${cfg.themes-package}");
              in
              lib.mapAttrs' (name: type: lib.nameValuePair
                (lib.removeSuffix ".toml" name)
                (toml2nix name type)
              ) tomlFiles;
          };
        };
    };
}
