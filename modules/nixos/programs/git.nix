{ ... }:
{
  programs.git = {
    enable = true;
    config = [
      {
        user.name = "wioenena";
        user.email = "wioenena@gmail.com";
      }
    ];
  };
}
