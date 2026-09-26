{
  lib,
  stdenvNoCC,
  fetchurl,
}:
stdenvNoCC.mkDerivation rec {
  pname = "lyrics-plugin";
  version = "8.1.0";
  bundleName = "nd-lyrics";

  src = fetchurl {
    url = "https://github.com/J0R6IT0/navidrome-lyrics-plugin/releases/download/v${version}/nd-lyrics.ndp";
    hash = "sha256-Kd1XG6DUu3VuYsDVxZSi1+fJzOwpUPOwJ71kxzxgVxU=";
  };

  dontUnpack = true;

  installPhase = ''
    install -Dm444 $src $out/share/${bundleName}.ndp
  '';

  passthru.isNavidromePlugin = true;

  meta = {
    description = "Lyrics provider plugin for Navidrome";
    homepage = "https://github.com/J0R6IT0/navidrome-lyrics-plugin";
    changelog = "https://github.com/J0R6IT0/navidrome-lyrics-plugin/releases/tag/v${version}";
    license = lib.licenses.mit;
    sourceProvenance = with lib.sourceTypes; [ fromBinary ];
    platforms = lib.platforms.all;
  };
}
