{ pkgs, ... }:
let
  batteryCheckScript = pkgs.writeShellScript "battery-check" ''
    # Battery monitor — checks battery level and sends popup notifications
    # via notify-send (dunst) when discharging below thresholds.
    # Silently exits if no battery hardware is found (safe on desktops).
    #
    # Uses a state file in XDG_RUNTIME_DIR to avoid repeated notifications
    # at the same threshold level.

    set -euo pipefail

    STATE_DIR="''${XDG_RUNTIME_DIR:-/tmp}/battery-monitor"
    STATE_FILE="$STATE_DIR/level"
    THRESHOLDS=(20 15 10 5)

    mkdir -p "$STATE_DIR"

    # Gather battery info from /sys/class/power_supply/BAT*
    shopt -s nullglob
    batteries=(/sys/class/power_supply/BAT*/capacity)
    shopt -u nullglob

    if [ ''${#batteries[@]} -eq 0 ]; then
      # No battery present — silently exit (e.g. desktop PC)
      exit 0
    fi

    total=0
    count=0
    discharging=false

    for cap_file in "''${batteries[@]}"; do
      bat_dir="$(dirname "$cap_file")"
      if [ -f "$bat_dir/status" ] && [ -f "$bat_dir/capacity" ]; then
        status=$(<"$bat_dir/status")
        cap=$(<"$bat_dir/capacity")
        total=$((total + cap))
        count=$((count + 1))
        if [ "$status" = "Discharging" ]; then
          discharging=true
        fi
      fi
    done

    if [ "$count" -eq 0 ]; then
      exit 0
    fi

    avg_cap=$((total / count))

    # If charging or full, reset state and exit (no low battery warning)
    if [ "$discharging" = false ]; then
      rm -f "$STATE_FILE"
      exit 0
    fi

    # Read the last-notified level (default: 100, never notified)
    last_notified=100
    if [ -f "$STATE_FILE" ]; then
      last_notified=$(<"$STATE_FILE")
    fi

    # Check thresholds from lowest to highest
    for threshold in "''${THRESHOLDS[@]}"; do
      if [ "$avg_cap" -le "$threshold" ] && [ "$last_notified" -gt "$threshold" ]; then
        urgency="normal"
        icon="battery-low"
        if [ "$threshold" -le 10 ]; then
          urgency="critical"
          icon="battery-empty"
        fi
        ${pkgs.libnotify}/bin/notify-send \
          -u "$urgency" \
          -t 12000 \
          -i "$icon" \
          -h string:desktop-entry:battery-monitor \
          "⚠️  Battery Low" \
          "Battery at ''${avg_cap}% — connect the charger soon"
        echo "$avg_cap" > "$STATE_FILE"
        break
      fi
    done
  '';
in {
  systemd.user.services.battery-monitor = {
    Unit = {
      Description = "Low battery notification checker";
      Documentation = "man:battery-monitor";
    };

    Service = {
      Type = "oneshot";
      ExecStart = "${batteryCheckScript}";
    };
  };

  systemd.user.timers.battery-monitor = {
    Unit = {
      Description = "Check battery level periodically";
    };

    Timer = {
      OnCalendar = "*:0/2";       # Every 2 minutes
      Persistent = true;
      RandomizedDelaySec = 30;    # Avoid thundering herd
    };

    Install = {
      WantedBy = [ "timers.target" ];
    };
  };
}
