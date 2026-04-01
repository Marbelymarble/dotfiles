#!/usr/bin/env bash

PYWAL_COLORS="$HOME/.cache/wal/colors.sh"
ASHELL_CONFIG="$HOME/.config/ashell/config.toml"
TEMP_CONFIG="/tmp/ashell_config_temp.toml"

source "$PYWAL_COLORS"

cp "$ASHELL_CONFIG" "$ASHELL_CONFIG.backup"

awk '/^\[appearance\]/{exit} {print}' "$ASHELL_CONFIG" >"$TEMP_CONFIG"

cat >>"$TEMP_CONFIG" <<EOF
[appearance]
success_color = "$color2"
text_color = "$foreground"
scale_factor = 1.3


workspace_colors = [ "$color1", "$color4", "$color5" ]

[appearance.primary_color]
base = "$color4"
text = "$background"

[appearance.danger_color]
base = "$color1"
weak = "$color0"

[appearance.background_color]
base = "$background"
weak = "$color2"
strong = "$color0"

[appearance.secondary_color]
base = "$color0"
strong = "$color0"
EOF

mv "$TEMP_CONFIG" "$ASHELL_CONFIG"

echo "Ashell config updated with pywal colors"

# Restart ashell
pkill ashell
sleep 0.5
nohup ashell >/dev/null 2>&1 &

echo "Ashell restarted"
