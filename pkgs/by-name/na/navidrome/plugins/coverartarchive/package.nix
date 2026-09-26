{
  lib,
  pkgs,
  buildNavidromePlugin,
}:
buildNavidromePlugin rec {
  pname = "coverartarchive";
  version = "1.0.0";

  src = pkgs.fetchFromGitHub {
    owner = "sunsetroute1";
    repo = "navidrome-coverartarchive-plugin";
    tag = "v${version}";
    hash = "sha256-q6y8QVzK9o1EmGWE5NuDCj8z0Jwn51s88hR1rDAOoJ4=";
  };

  vendorHash = "sha256-dp8GryonIV/Sq9AWsEl630Dz7p23C65l68O6THrKuyQ=";

  postPatch = ''
    substituteInPlace go.mod \
      --replace-fail 'github.com/navidrome/navidrome/plugins/pdk/go v0.0.0' \
        'github.com/navidrome/navidrome/plugins/pdk/go v0.0.0-20260711131814-be10f89c1179' \
      --replace-fail 'replace github.com/navidrome/navidrome/plugins/pdk/go => ../../pdk/go' ""
  '';

  modBuildPhase = ''
    runHook preBuild
    GOFLAGS= go mod tidy
    GOFLAGS= go mod vendor
    mkdir -p vendor
    runHook postBuild
  '';

  subPackages = [ "." ];

  doCheck = false;

  meta = {
    description = "Navidrome plugin that fetches album cover art from the Cover Art Archive";
    homepage = "https://github.com/sunsetroute1/navidrome-coverartarchive-plugin";
    changelog = "https://github.com/sunsetroute1/navidrome-coverartarchive-plugin/releases/tag/v${version}";
    license = lib.licenses.mit;
    sourceProvenance = with lib.sourceTypes; [ fromSource ];
  };
}
