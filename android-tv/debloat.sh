#!/usr/bin/env bash
# debloat.sh — Android TV / Google TV ONLY. Will NOT work on Samsung Tizen or LG webOS.
#
# In the spirit of Gathin23/cleanyourtv: disable (never uninstall) bloat and
# telemetry over ADB, so everything is reversible with restore.sh.
#
# Usage:
#   1. On the TV: Settings → Device Preferences → About → tap Build 7 times →
#      Developer options → USB debugging ON (and Network debugging if shown).
#   2. On this computer (same Wi-Fi):  adb connect <TV-IP>:5555
#      Accept "Allow USB debugging?" on the TV.
#   3. Review the list below, comment out anything you use, then run:
#      ./debloat.sh
#
# Safety: `pm disable-user` only — nothing is uninstalled, no root needed.
# Your exact TV's package names may differ; list what's installed first with:
#   adb shell pm list packages
# Back that list up before changing anything.
set -euo pipefail

if ! command -v adb >/dev/null; then
  echo "adb not found. Install Android platform-tools first." >&2; exit 1
fi
if ! adb get-state >/dev/null 2>&1; then
  echo "No device connected. Run: adb connect <TV-IP>:5555" >&2; exit 1
fi

echo "Backing up installed package list to ./packages-before.txt"
adb shell pm list packages > ./packages-before.txt

disable() {
  # $1 = package, $2 = what it is
  if adb shell pm list packages | grep -q "package:$1"; then
    echo "Disabling $1 — $2"
    adb shell pm disable-user --user 0 "$1" || true
  else
    echo "Skipping $1 (not installed)"
  fi
}

# --- Xiaomi / Mi TV bloat (the tweet's TV was Xiaomi; adjust to your brand) ---
disable com.miui.tv.analytics        "Xiaomi TV analytics/telemetry"
disable com.xiaomi.mitv.upgrade      "Mi TV upgrade nag service"
disable com.miui.systemAdSolution    "Xiaomi system ad service"
disable com.miui.analytics           "Xiaomi analytics"
disable com.xiaomi.gamecenter.sdk.service "Xiaomi game center SDK"
disable com.mitv.screensaver         "Mi TV ad screensaver (keep if you like it)"

# --- Common Google TV ad/content rows (disabling may affect recommendations) ---
# disable com.google.android.tvrecommendations "Google TV recommendations row"

# --- Generic preloaded junk (only if present and unused) ---
# Add your brand's packages here after checking `adb shell pm list packages`.

echo
echo "Done. Restart the TV. To undo everything: ./restore.sh"
