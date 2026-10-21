# Samsung U8000F (2025) cleanup — exact steps

For: Samsung 50" Crystal UHD U8000F, model `UN50U8000FFXZC`, Tizen.
This is the Tizen equivalent of an ADB debloat — everything the TV itself allows,
done in its own menus. All steps are reversible.

## 1. Stop the tracking (feeds the ads)

Settings (gear) → **All Settings → General & Privacy → Terms & Privacy**
(may show as *Privacy Choices*):

- **Viewing Information Services → OFF** — Samsung's screen-watching (ACR):
  samples what's on screen, even from HDMI, for targeted ads/recommendations.
- **Interest-Based Advertising → OFF** — stops the ad profile being applied.
- **Reset/Delete Advertising ID (PSID)** if shown — wipes the existing profile.
- **Voice Recognition Services → OFF** — only if you don't use voice/Bixby.

Note: Samsung firmware updates can re-enable these toggles. Re-check after updates.

## 2. Remove the junk apps

Home → **Apps**. For every app you don't use: select it (long-press the centre
button if no menu appears) → **Delete**.

Safe candidates if unused: Samsung TV Plus, Samsung Gaming Hub, Samsung Health,
Microsoft 365/Copilot, any preloaded streaming app you never open.

- **Keep the "Internet" app** — the dashboard runs in it. (On Samsung TVs the
  browser is called simply **Internet**, globe icon — not "Samsung Internet",
  which is the phone app. If it's missing: Apps → search → "Internet".)
- If **Delete** is greyed out, the app is locked by Samsung — choose
  **Remove from Home** instead. Same result on screen; it can be re-added later.

## 3. Ad-blocking DNS

Settings → **All Settings → Connection → Network → Network Status**
(wait for the connection test to finish, or press **Stop** — the IP Settings
button appears at the bottom):

- **IP Settings → DNS setting → Enter manually → `94.140.14.14`**
  (secondary, if offered: `94.140.15.15`)
- Restart the TV.

This blocks ad/tracker domains for the TV's built-in apps and home screen.
It does **not** remove ads inside apps like YouTube. Undo: set DNS back to
*Get automatically*.

> If you don't see a Network menu: you're in the short quick-settings row.
> Go Home → left side bar → Settings → **All Settings** (full menu) →
> **Connection** is near the top of the left-hand list.

## 4. Keep the dashboard alive

- **Auto Power Off → OFF**: All Settings → General & Privacy →
  Power and Energy Saving → Auto Power Off.
- **Sleep Timer → OFF**: All Settings → General & Privacy → System Manager →
  Time → Sleep Timer.
- **Autorun Last App → ON**: All Settings → General & Privacy →
  Start Screen Options. The TV then reopens the last app (your dashboard in
  the Internet browser) every time it powers on.

## 5. Show the dashboard permanently

1. Open the **Internet** app.
2. Go to the dashboard address (GitHub Pages link from the repo README).
3. Browser menu (≡) → **Bookmark** it and **Add to Home**.

Done: TV on → dashboard. Weather refreshes itself every 15 minutes; the
TradingView ticker is live. No phone or sign-in involved.
