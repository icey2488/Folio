# Folio

Personal portfolio tracker. No accounts, no servers, no ads.
Data stays in your browser.

**Live:** https://folio.icehunter.net
**Current version:** v1.2.0

## Features
- Tax-lot tracking (FIFO/LIFO/specific lot) with wash-sale detection
- Multi-currency with historical FX
- Inflation-adjusted real returns (FRED CPI)
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
- v1.2.0: https://folio.icehunter.net/dist/v1.2.0/

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
- FRED CPI needs a free FRED API key
- Async locks are per-tab only
- Correlation detection uses hardcoded heuristics, not computed returns
- Dividend months are conventional (quarterly = Mar/Jun/Sep/Dec), not real ex-div dates

## Privacy
All data is stored in browser localStorage only. No telemetry, no analytics,
nothing sent anywhere except the direct API calls you initiate with your own keys.
