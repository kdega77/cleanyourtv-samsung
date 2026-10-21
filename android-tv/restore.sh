#!/usr/bin/env bash
# restore.sh — undo debloat.sh: re-enable every package it disabled.
# Android TV / Google TV only (same adb connection as debloat.sh).
set -euo pipefail

enable() {
  echo "Enabling $1"
  adb shell pm enable "$1" || true
}

enable com.miui.tv.analytics
enable com.xiaomi.mitv.upgrade
enable com.miui.systemAdSolution
enable com.miui.analytics
enable com.xiaomi.gamecenter.sdk.service
enable com.mitv.screensaver
# enable com.google.android.tvrecommendations

echo "Done. Restart the TV."
