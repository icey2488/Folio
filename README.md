# Portfolio Tool

Institutional-grade personal portfolio tracker. 
No accounts, no servers, no ads. Data stays in 
your browser.

**Live:** https://investing.icehunter.net  
**Current version:** v1.1.0

## Features
- Tax lot tracking with FIFO/LIFO/specific lot 
  selection and wash sale detection
- Multi-currency with historical FX
- Inflation-adjusted real returns (FRED CPI)
- Macro stress testing (5 historical scenarios)
- Correlation/overlap detection
- Income runway calendar
- Rebalance plan with plain-English action steps
- AI analysis (Claude/OpenAI/Gemini, BYO key)
- PDF export: meeting summary + monitoring snapshot
- Session delta tracking and price staleness alerts
- Mobile-responsive with card view

## Versioned URLs
- Latest: https://investing.icehunter.net
- v1.1.0: https://investing.icehunter.net/dist/v1.1.0/

## Releasing a new version
1. Set VERSION and PROD=true in the source file
2. Overwrite root index.html
3. Copy to dist/vX.X.X/index.html (never modify 
   after creation)
4. Push to main — Cloudflare Pages deploys 
   automatically

## Known limitations
- AI features require a BYO API key
- FRED CPI requires a free FRED API key
- Async locks are per-tab only; two browser tabs 
  of the same file share no state
- Correlation detection uses hardcoded heuristics, 
  not computed return history
- Dividend payment months are conventional 
  (quarterly = Mar/Jun/Sep/Dec), not actual 
  ex-dividend calendars

## Privacy
All data stored in browser localStorage only. 
No telemetry, no analytics, no external data 
sent except direct API calls you initiate with 
your own keys.
