{ lib, ... }:
{
  i18n = {
    defaultLocale = "en_US.UTF-8";
    extraLocales = [ "tr_TR.UTF-8/UTF-8" ];
    inputMethod = {
      enable = true;
      type = "fcitx5";
    };
  };
  environment.variables = {
    GTK_IM_MODULE = lib.mkForce "";
  };
}
