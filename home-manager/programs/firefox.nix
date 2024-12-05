{
  config,
  lib,
  pkgs,
  username,
  inputs,
  ...
}:
let
  firefox-gnome-theme = pkgs.fetchFromGitHub {
    owner = "rafaelmardojai";
    repo = "firefox-gnome-theme";
    rev = "aa9b67045fcdec7ae045b36d7a41b36b3463b842";
    sha256 = "sha256-Q8W1YlsZmxhUaXLOJhPCeEzKqaqmspT9VKYZxn5Kh40=";
  };
  cfg = config.modules.programs.firefox;
in
{
  config = lib.mkIf cfg.enable {
    programs.firefox = {
      enable = true;
      profiles."${username}" = {
        settings = {
          "content.notify.interval" = 100000;
          "gfx.canvas.accelerated.cache-items" = 4096;
          "gfx.canvas.accelerated.cache-size" = 512;
          "gfx.content.skia-font-cache-size" = 20;
          "browser.cache.jsbc_compression_level" = 3;
          "media.memory_cache_max_size" = 65536;
          "media.cache_readahead_limit" = 7200;
          "media.cache_resume_threshold" = 3600;
          "image.mem.decode_bytes_at_a_time" = 32768;
          "network.http.max-connections" = 1800;
          "network.http.max-persistent-connections-per-server" = 10;
          "network.http.max-urgent-start-excessive-connections-per-host" = 5;
          "network.http.pacing.requests.enabled" = false;
          "network.dnsCacheExpiration" = 3600;
          "network.ssl_tokens_cache_capacity" = 10240;
          "network.dns.disablePrefetch" = true;
          "network.dns.disablePrefetchFromHTTPS" = true;
          "network.prefetch-next" = false;
          "network.predictor.enabled" = false;
          "layout.css.grid-template-masonry-value.enabled" = true;
          "dom.enable_web_task_scheduling" = true;
        };

        extraConfig = ''
          ${builtins.readFile "${firefox-gnome-theme}/configuration/user.js"}
        '';

        userChrome = ''
          @import "${firefox-gnome-theme}/userChrome.css";
        '';
        userContent = ''
          @import "${firefox-gnome-theme}/userContent.css";
        '';

        extensions = with inputs.firefox-addons.packages."x86_64-linux"; [
          bitwarden
          ublock-origin
          sponsorblock
        ];
      };
    };
  };
}
