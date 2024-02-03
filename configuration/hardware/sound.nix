{ config, pkgs, ...}:

{
  sound.enable = true;
  # hardware.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    audio.enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    # jack.enable = true;
    pulse.enable = true;
    config.pipewire = {
      "context.properties" = [
        {
          "link.max-buffers" = 64;
          "log.level" = 2;
          "default.clock.rate" = 48000;
          "default.clock.quantum" = 1024;
          "default.clock.min-quantum" = 32;
          "default.clock.max-quantum" = 8192;
        }
      ];
    };
  };
}