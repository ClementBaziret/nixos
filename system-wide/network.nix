{
  ...
}:

{
  networking.hostName = "nixos";
  networking.networkmanager.enable = true;
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  networking.firewall.allowedUDPPorts = [ 8080 ];
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.enable = false;
}
