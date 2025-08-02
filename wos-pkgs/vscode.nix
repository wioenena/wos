{ pkgs }:
pkgs.vscode.overrideAttrs (oldAttrs: {
  src = (
    builtins.fetchTarball {
      url = "https://code.visualstudio.com/sha/download?build=stable&os=linux-x64";
      sha256 = "sha256:1h7g8gng7yqzjp90r835mhjbswykynjsys09d3z2llbwqdqj7nvd";
    }
  );
  version = "latest-release";
})
