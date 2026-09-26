{
  lib,
  stdenvNoCC,
  fetchurl,
}:
stdenvNoCC.mkDerivation rec {
  pname = "lrclib-lyrics";
  version = "4.0.0";
  bundleName = "lrclib-lyrics";

  src = fetchurl {
    url = "https://github.com/J0R6IT0/navidrome-lyrics-plugin/releases/download/v${version}/lrclib-lyrics.ndp";
    hash = "sha256-22yX+nZc4Ob3H3KeJFEiquJbrYEq9bQJ7+v6KsCemrM=";
  };

  dontUnpack = true;

  installPhase = ''
    install -Dm444 $src $out/share/${bundleName}.ndp
  '';

  passthru.isNavidromePlugin = true;

  meta = {
    description = "LRCLIB lyrics provider plugin for Navidrome";
    homepage = "https://github.com/J0R6IT0/navidrome-lyrics-plugin";
    changelog = "https://github.com/J0R6IT0/navidrome-lyrics-plugin/releases/tag/v${version}";
    license = lib.licenses.mit;
    sourceProvenance = with lib.sourceTypes; [ fromBinary ];
    platforms = lib.platforms.all;
  };
}
