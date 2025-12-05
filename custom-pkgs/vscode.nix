{ pkgs }:
pkgs.vscode.overrideAttrs (oldAttrs: {
  src = (
    builtins.fetchTarball {
      url = "https://code.visualstudio.com/sha/download?build=stable&os=linux-x64";
      sha256 = "sha256:10pvwv5anr70s3mzi32xing16qxml994rhc63rqw2npbm9508nvc";
    }
  );
  version = "latest-release";
})
