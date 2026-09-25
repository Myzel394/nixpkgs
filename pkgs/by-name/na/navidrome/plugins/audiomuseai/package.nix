{
  lib,
  pkgs,
  buildNavidromePlugin,
  zip,
}:
buildNavidromePlugin rec {
  pname = "audiomuseai";
  version = "10";

  src = pkgs.fetchFromGitHub {
    owner = "NeptuneHub";
    repo = "AudioMuse-AI-NV-plugin";
    tag = "v${version}";
    hash = "sha256-nsutpiatfjwg3cruzz8Np6xEFm78Ea64B2e3zmaZu40=";
  };

  vendorHash = "sha256-mXes+doBSa5kcfHp1cuzTz30wnyyPN7NLC0iOSL8FDo=";

  postInstall = ''
    mkdir $out/share
    pushd $(mktemp -d)
    cp $GOPATH/bin/plugin.wasm .
    cp ${src}/manifest.json .
    substituteInPlace manifest.json \
      --replace-fail '"version": "1.0.0"' '"version": "10.0.0"'
    ${lib.getExe zip} \
      $out/share/${pname}.ndp \
      plugin.wasm \
      manifest.json
    popd
    rm -r $out/bin
  '';

  meta = {
    description = "Navidrome plugin that integrates core AudioMuse-AI features into the Navidrome frontend.";
    homepage = "https://github.com/NeptuneHub/AudioMuse-AI-NV-plugin";
    changelog = "https://github.com/NeptuneHub/AudioMuse-AI-NV-plugin/releases/tag/v${version}";
    license = lib.licenses.agpl3Only;
    sourceProvenance = with lib.sourceTypes; [ fromSource ];
  };
}
