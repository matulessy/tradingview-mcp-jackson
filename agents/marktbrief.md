# Dagelijkse Portfolio Marktbrief

Je bent een marktanalyst voor een Nederlandse belegger. Voer alle stappen hieronder uit.

## Stap 1 — Detecteer sessie

Voer via Bash uit:
```
python3 -c "import datetime; print('MORNING' if datetime.datetime.utcnow().hour < 10 else 'US')"
```

- `MORNING` = 07:00 UTC = 09:00 Amsterdam (Europese markt net open)
- `US` = 13:00 UTC = 15:00 Amsterdam (30 min voor NYSE open)

## Stap 2 — Haal marktdata op

Schrijf het volgende script naar `/tmp/fetch.py` en voer het uit:

```python
import urllib.request, json, datetime

symbols = [
    "BESI.AS", "^AEX", "ASM.AS", "HEIJM.AS", "SHELL.AS",
    "SLV", "IAU", "NG=F", "UNG", "USO",
    "AVGO", "MU", "LMT", "SNDK", "RDDT",
    "NFLX", "MSFT", "AMZN", "UBER",
    "^GSPC", "^IXIC", "^DJI", "^VIX"
]

fields = ",".join([
    "symbol", "shortName", "regularMarketPrice",
    "regularMarketChangePercent", "regularMarketVolume",
    "averageDailyVolume10Day", "fiftyTwoWeekHigh",
    "fiftyTwoWeekLow", "preMarketChangePercent"
])

url = f"https://query2.finance.yahoo.com/v7/finance/quote?symbols={','.join(symbols)}&fields={fields}"
req = urllib.request.Request(url, headers={"User-Agent": "Mozilla/5.0"})

with urllib.request.urlopen(req, timeout=15) as r:
    data = json.loads(r.read())

results = data["quoteResponse"]["result"]
for q in results:
    sym = q.get("symbol", "")
    name = q.get("shortName", sym)
    price = q.get("regularMarketPrice", 0)
    chg = q.get("regularMarketChangePercent", 0)
    vol = q.get("regularMarketVolume", 0)
    avg = q.get("averageDailyVolume10Day", 1) or 1
    h52 = q.get("fiftyTwoWeekHigh", 0)
    l52 = q.get("fiftyTwoWeekLow", 0)
    pre = q.get("preMarketChangePercent", None)
    vr = vol / avg
    pfh = ((h52 - price) / h52 * 100) if h52 else 0
    pfl = ((price - l52) / l52 * 100) if l52 else 0
    pre_s = f" | pre:{pre:+.1f}%" if pre is not None else ""
    print(f"{sym} | {name} | {price:.2f} | {chg:+.2f}% | vol:{vr:.1f}x | H52:{pfh:.1f}%below | L52:{pfl:.1f}%above{pre_s}")

print(f"\nDatum: {datetime.date.today().strftime('%d %B %Y')} | UTC: {datetime.datetime.utcnow().strftime('%H:%M')}")
```

## Stap 3 — Stel de marktbrief op (in het Nederlands)

### Bij sessie MORNING (09:00 Amsterdam):

Onderwerp: `Ochtend Marktbrief — [datum]`

Secties:
```
OCHTEND MARKTBRIEF — [DATUM]

INDICES
• AEX: [prijs] ([%])
• S&P 500 (gisteren): [prijs] ([%])
• Nasdaq (gisteren): [prijs] ([%])

GROOTSTE MOVERS
Stijgers: [top 3 met %]
Dalers:   [top 3 met %]

HOOG VOLUME (>1.5x gemiddeld)
[symbolen met hoog volume]

POTENTIELE KANSEN
[breakout-kandidaten <3% van 52wk high, oversold bounces, opvallende setups]

MARKTCONTEXT
[commodities: goud/zilver/gas/olie | macro sfeer]

VOLLEDIG PORTFOLIO
Symbool | Naam | Prijs | % | Vol
```

### Bij sessie US (15:00 Amsterdam):

Onderwerp: `VS Marktopen Brief — [datum]`

Secties:
```
VS MARKTOPEN BRIEF — [DATUM] — 15:00 AMS

INDICES
• S&P 500: [prijs] ([%])
• Nasdaq:  [prijs] ([%])
• Dow:     [prijs] ([%])
• VIX:     [waarde] — [laag <15 / normaal 15-25 / hoog >25]
• AEX:     [prijs] ([%])

TOP MOVERS VS-PORTFOLIO
Stijgers: [top 3] | Dalers: [top 3]

PRE-MARKET SIGNALEN
[aandelen met pre-market beweging >1%]

HOOG VOLUME OPENING (>1.5x)
[symbolen]

POTENTIELE KANSEN
[concrete trade setups voor de opening]

EU AFSLUITING
[BESI, ASM, HEIJM, SHELL dagresultaat]

VOLLEDIG VS PORTFOLIO
Symbool | Naam | Prijs | % | Vol | Pre-mkt
```

## Stap 4 — Verstuur via Telegram

De Telegram credentials staan in het trigger-prompt dat je hebt ontvangen (TELEGRAM_TOKEN en TELEGRAM_CHAT_ID).

Stuur de brief via Bash curl naar de Telegram Bot API. Gebruik `parse_mode=HTML`. Splits de tekst in meerdere berichten als die langer is dan 3800 tekens. Stuur eerst een kort header-bericht, dan de details.

Curl-formaat:
```bash
curl -s -X POST "https://api.telegram.org/bot${TELEGRAM_TOKEN}/sendMessage" \
  --data-urlencode "chat_id=${TELEGRAM_CHAT_ID}" \
  --data-urlencode "text=${BERICHT}" \
  -d "parse_mode=HTML"
```
