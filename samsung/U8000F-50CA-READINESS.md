# Readiness pack — Quiet Tizen on the 50" Canadian U8000F

Prepared Oct 21, 2026, from: a full GitHub search, an X/Twitter scan, and a
line-by-line read of [jss8649/quiet-tizen](https://github.com/jss8649/quiet-tizen)
(the toolkit from @stake_jevens' post). Purpose: everything staged so that the
day a laptop is available, work starts at inventory — not at research.

## My TV (from its About screen)

| Field | Value |
| --- | --- |
| Model | Samsung 50" Crystal UHD U8000F (2025) |
| Model code | `UN50U8000FFXZC` (Canadian) |
| Software | `T-X22UDFAKUC-0090-1` |
| OS | Tizen (9.0 expected — confirm in inventory) |

## The tested TV (quiet-tizen's one and only profile)

| Field | Value |
| --- | --- |
| Model code | `UN75U8000FFXZA` (75", US) |
| Firmware | `T-KSU2EFAKUC-0090-1300.9` |
| OS / kernel / runtime | Tizen 9.0 · Linux 5.4.261 ARMv7 · .NET 6.0.9 |

**Shared:** U8000F line, Tizen 9.0, 5.4.261 kernel generation, 0090 firmware
generation. **Different:** size, region, firmware branch/build.

**One encouraging find:** Samsung's own support site ships a *combined*
firmware file for a sibling model named
`T-KSU2EFAKUC-0090_T-X22UDFAKUC-0090.zip` (versions 1300.9 / 1300.8) — the
tested TV's branch and this TV's branch are board/region variants inside the
**same Samsung 0090 release**. Closest kinship available; still not a test on
this variant.

## Search verdict (Oct 21, 2026)

- **GitHub:** zero hits for `T-X22UDFAKUC` anywhere in code search;
  `UN50U8000FFXZC` appears only in retail listings. quiet-tizen has **zero
  issues/PRs** — no second owner has reported results on *any* TV. Only two
  U8000F repos exist: quiet-tizen and this one.
- **X/Twitter:** the anchor post + the author's repo-link reply; visible
  replies mention no U8000F at all (one person asked for a Frame TV version).
  X search is login-walled anonymously and only reply previews are visible
  logged-out, so the X scan is thorough but not provably exhaustive.
- **The root route's origin** (chris-ritsen/samsung-tv-root) is documented on
  QN90B (Tizen 6.5) and QN90F (Tizen 9.0) via the public SVE-2025-50109 SDB
  package-name injection, with a preflight that classifies a TV as
  tested / compatible-untested / incompatible. One independent reproduction
  exists on a QE1 (Tizen 9). No U8000F of any size appears there either.

**Conclusion:** applying quiet-tizen here would be a **first attempt on this
exact model/firmware** — plausible (same family, same firmware release), not
proven. quiet-tizen's own `tools/tv.py` *rejects* unlisted model/firmware
combinations, so a profile for this TV must be built from its own inventory.

## Phase 1 — inventory checklist (read-only; laptop day, ~30 min)

Per quiet-tizen `docs/01-inventory.md` and `docs/02-access.md`, adapted:

1. About This TV: record model + software (done — above). Keep serial/MAC/
   device ID private, out of any repo.
2. Note the TV's LAN IP and the laptop's LAN IP.
3. Enable Developer Mode (Apps → 12345 → On → Host PC IP = laptop IP) →
   restart TV.
4. Connect with SDB from the laptop; confirm the SDB-reported model string.
5. Run the root-route preflight (samsung-tv-root) — record the classification
   (tested / compatible-untested / incompatible) **before** any root attempt.
6. Collect (all read-only):
   - `uname -srmo` and the .NET runtime path/version
   - `package_app_info` schema + full app list with disable/onboot flags
     from `/opt/dbspace/.pkgmgr_parser.db`
   - `.app-context.db` `key_filter` schema
   - `recipes/status.sh` output from quiet-tizen
   - `systemctl cat pisa-service.service canalysis-service.service`
     (stop markers only work if the exact negated conditions exist)
7. Record current Home/startup selectors (Probe tool) and the real HDMI
   source IDs — **do not** inherit the tested TV's 13/14/15 mapping.
8. Feature decisions to confirm with the owner before cleanup groups are
   chosen: keep/kill voice (Bixby/Alexa), SmartThings, Gaming Hub, TV Plus,
   context suggestions. (Settings-level ACR/ads are already OFF on this TV.)

## Decision gates (from quiet-tizen AGENTS.md — non-negotiable)

- **Stop before any mutation** if the inventory shows model/firmware/runtime
  gaps that can't be explained; build a separate profile instead.
- Before every change: SQLite `.backup` snapshots + the written inverse
  operation; recovery copy on the TV *and* on the laptop.
- Apply **one** cleanup group at a time; validate against the fresh snapshot.
- Install Quiet Home **without** assigning it to Home/startup; verify UI,
  remote, HDMI, sound, settings — then assign, then test a full restart and
  standby/wake separately.
- No reboot inside a temporary root session; one SDB/root session at a time.

## What success looks like

Quiet Home as default Home/startup, chosen cleanup groups applied with
rollback on file, this TV's own profile (`un50u8000ffxzc-*.json`) written from
its inventory — and, if it works, the first public confirmation for the 50"
Canadian variant.
