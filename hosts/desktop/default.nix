{
  ...
}:

{
  imports = [
    ./hardware-configuration.nix
    ./amdgpu.nix
  ];

  system.stateVersion = "25.11";
}
