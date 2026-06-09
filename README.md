# Folio

> *There are plenty of people who will pay me to install pipes. But everyone deserves running water.*

Personal portfolio tracker. No accounts, no servers, no ads.
Data stays in your browser.

**Live:** https://folio.icehunter.net
**Current version:** v1.3.0

## Features
- Tax-lot tracking (FIFO/LIFO/specific lot) with wash-sale detection
- Multi-currency with historical FX
- Inflation-adjusted real returns (US CPI-U, fetched on demand via your AI engine)
- Macro stress testing (5 historical scenarios)
- Correlation / overlap detection
- Income runway calendar
- Rebalance plan with plain-English action steps
- AI analysis (Claude / OpenAI / Gemini, BYO key)
- PDF export: meeting summary + monitoring snapshot
- Session delta tracking and price staleness alerts
- Mobile-responsive with card view

## Versioned URLs
- Latest: https://folio.icehunter.net
- v1.3.0: https://folio.icehunter.net/dist/v1.3.0/
- v1.2.4: https://folio.icehunter.net/dist/v1.2.4/
- v1.2.3: https://folio.icehunter.net/dist/v1.2.3/
- v1.2.2: https://folio.icehunter.net/dist/v1.2.2/
- v1.2.1: https://folio.icehunter.net/dist/v1.2.1/
- v1.2.0: https://folio.icehunter.net/dist/v1.2.0/

## Changelog
- **v1.3.0** — Unified persistence into an atomic serialize/hydrate boundary;
  prerequisite for file-sync and encryption.
- **v1.2.4** — Inflation data now loads through your selected AI engine instead
  of a FRED API key. The direct FRED fetch never worked from the browser
  (cross-origin blocked) and would have exposed the key, so it is gone.
  Onboarding drops to two steps and no extra key is needed for real returns.
- **v1.2.3** — Added project philosophy tagline to README.
- **v1.2.2** — Moved the build stamp out of the floating corner badge into the
  hamburger overlay and the desktop sidebar footer; the floating `.buildstamp`
  is now hidden.
- **v1.2.1** — Mobile hamburger nav overlay (below 1080px); class-based Ask-AI
  FAB visibility with orientation/resize reconciliation; CSP comment documenting
  the deliberately-blocked Cloudflare beacon.
- **v1.2.0** — Build stamp, versioned dist snapshots, changelog + README.

## Build stamp
Each deploy substitutes the short commit SHA into a `__COMMIT__` placeholder
via `build.sh`, which Cloudflare Pages runs at build time using
`CF_PAGES_COMMIT_SHA`. The version and commit show in the bottom-left corner
so you can tell at a glance which iteration is live. Source files keep the
placeholder; it is only substituted in the ephemeral build, never committed.

## Releasing a new version
1. Set VERSION in index.html (PROD stays true)
2. Overwrite root index.html
3. Copy to dist/vX.Y.Z/index.html (never modify after creation)
4. Add a changelog entry
5. Push to main; Cloudflare runs build.sh and deploys

## Cloudflare Pages settings
- Build command: `bash build.sh`
- Build output directory: `/`

## Known limitations
- AI features need a BYO API key. Keyless Claude only works inside the
  claude.ai sandbox; on folio.icehunter.net every provider needs a key.
- Real returns need a selected AI engine to fetch US CPI on demand (no FRED key required)
- Async locks are per-tab only
- Correlation detection uses hardcoded heuristics, not computed returns
- Dividend months are conventional (quarterly = Mar/Jun/Sep/Dec), not real ex-div dates

## Privacy
All data is stored in browser localStorage only. No telemetry, no analytics,
nothing sent anywhere except the direct API calls you initiate with your own keys.
