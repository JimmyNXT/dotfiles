{ ... }: {
  flake.nixosModules.wireless = { pkgs, ... }: {
    systemd.services.nm-wifi-no-keyring = {
      description = "Remove keyring requirement from WiFi connections";
      after = [ "network-online.target" ];
      wants = [ "network-online.target" ];
      wantedBy = [ "multi-user.target" ];
      serviceConfig.Type = "oneshot";
      script = ''
        ${pkgs.networkmanager}/bin/nmcli -t -f TYPE,UUID connection show \
          | ${pkgs.gnugrep}/bin/grep "^802-11-wireless:" \
          | ${pkgs.coreutils}/bin/cut -d: -f2 \
          | while read uuid; do
              ${pkgs.networkmanager}/bin/nmcli connection modify "$uuid" connection.permissions ""
            done
      '';
    };
  };
}
