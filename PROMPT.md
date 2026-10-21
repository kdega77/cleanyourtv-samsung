# PROMPT.md — do this for your TV

Paste this into an AI coding assistant with shell/git access, fill in the
brackets, and let it work. (This is how this repo was produced.)

---

You are helping me clean up my TV and give it a permanent dashboard home
screen, in the spirit of https://github.com/Gathin23/cleanyourtv

**My TV:** [brand + model, e.g. "Samsung 50" Crystal UHD U8000F (2025),
UN50U8000FFXZC, Tizen"]

**What I want on the dashboard:**
- Big live clock + date, readable from the couch
- Weather for [city] — MANDATORY, always on, refreshes by itself
- Stock watch: [symbols, e.g. XEQT and VFV on TSX] with a live ticker
- [anything else, e.g. a music card]
- NOT wanted: [e.g. countdowns, family message board]

**Rules:**
1. First tell me honestly what my TV's OS can and cannot do. If it's Android
   TV / Google TV, the ADB debloat + custom launcher route applies. If it's
   Samsung Tizen or LG webOS, say so plainly — no ADB, no package removal,
   no replacement launcher — and give me the closest equivalent instead:
   privacy/tracking toggles off, junk apps deleted or removed from home,
   ad-blocking DNS (94.140.14.14), and keep-awake settings.
2. Give me the cleanup steps for my EXACT model, with real menu paths.
3. Build the dashboard as ONE self-contained `index.html` (live data from
   keyless public APIs only — e.g. Open-Meteo for weather, a TradingView
   embed for markets). No accounts, no API keys, nothing personal in it.
4. Publish it so the TV can open it with no sign-in: put it in a public
   GitHub repo under my account and enable GitHub Pages. Verify the live
   link actually loads before giving it to me.
5. Tell me exactly how to make it permanent on the TV: open it in the TV's
   browser, bookmark + Add to Home, and the autorun/keep-awake settings so
   it comes back by itself when the TV turns on.
6. Include restore/undo instructions for every change.
