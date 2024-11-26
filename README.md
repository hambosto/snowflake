# snowflake

git clone https://github.com/hambosto/snowflake.git ~/.config/snowflake

nixos-generate-config --show-hardware-config > ~/.config/snowflake/hosts/snowflake/hardware-configuration.nix

sudo nixos-rebuild switch --flake ~/.config/snowflake#snowflake