{
  user = {
    username = "wioenena";
    isNormalUser = true;
    initialPassword = "nixos";
    extraGroups = ["wheel"];
    description = "Barış Köprülü";
    createHome = true;
  };

  git = {
    enable = true;
    user.name = "wioenena";
    user.email = "wioenena@gmail.com"
  };
}
