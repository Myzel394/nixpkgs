{
  lib,
  pkgs,
  buildNavidromePlugin,
}:

buildNavidromePlugin rec {
  pname = "navidrome-shazam-plugin";
  version = "0.1.1";

  src =
    (pkgs.fetchFromGitHub {
      owner = "Myzel394";
      repo = "navidrome-shazam-plugin";
      tag = "v${version}";
      hash = "sha256-sP71SLJLyiH4qaafVUaWRUJzzIYqC7y4Z+U31hIJiNk=";
    })
    + "/plugin";

  vendorHash = "sha256-DcsE8fLyAk7N7/95SdJglSAduc0THbVtPthtMogDVv4=";
  doCheck = false;

  meta = {
    description = "Navidrome plugin for identifying songs with Shazam";
    homepage = "https://codeberg.org/Myzel394/navidrome-shazam-plugin";
    changelog = "https://github.com/Myzel394/navidrome-shazam-plugin/releases/tag/v${version}";
    license = lib.licenses.mit;
    sourceProvenance = with lib.sourceTypes; [ fromSource ];
  };
}
