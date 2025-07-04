{inputs,pkgs,...}:{
home.packages=[inputs.astal.packages.${pkgs.stdenv.hostPlatform.system}.default];
}
