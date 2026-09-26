{
  lib,
  pkgs,
  buildNavidromePlugin,
}:

buildNavidromePlugin rec {
  pname = "navidrome-lyricstranslate-plugin";
  version = "0.1.1";

  src =
    (pkgs.fetchFromGitHub {
      owner = "Myzel394";
      repo = "navidrome-lyricstranslate-plugin";
      tag = "v${version}";
      hash = "sha256-kEhxMZlPyMy98zS3XkDon8hXhVCVbTGgeP15t2cVjOw=";
    })
    + "/plugin";

  vendorHash = "sha256-1ASVeXnABu0hZSE6ESMVlFsBsHxzU2sUlQL797iwfak=";

  doCheck = false;

  meta = {
    description = "Navidrome plugin for translating lyrics";
    homepage = "https://git.myzel.net/Myzel394/navidrome-lyricstranslate-plugin";
    changelog = "https://github.com/Myzel394/navidrome-lyricstranslate-plugin/releases/tag/v${version}";
    license = lib.licenses.mit;
    sourceProvenance = with lib.sourceTypes; [ fromSource ];
  };
}
