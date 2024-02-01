{ config, pkgs, stablepkgs, attrs, ...}: 

{
  services.nginx = {
    enable = true;
    recommendedGzipSettings = true;
    recommendedOptimisation = true;
    recommendedProxySettings = true;
    recommendedTlsSettings = true;
    virtualHosts = {
      "nix-serve" = {
        locations."/".proxyPass = "http://${config.services.nix-serve.bindAddress}:${toString config.services.nix-serve.port}";
        forceSSL = true;
        sslCertificateKey = "/etc/privkey.pem";
        sslCertificate = "/etc/fullchain.pem";
        listen = [
          {
            addr = "0.0.0.0";
            port = 5000;
            ssl = true;
          }
        ];
      };
    };
  };
}