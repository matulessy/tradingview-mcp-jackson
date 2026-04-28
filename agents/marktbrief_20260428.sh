#!/bin/bash
# Ochtend Marktbrief — 28 April 2026
# Voer dit script uit op een machine met internettoegang

TOKEN="8695038106:AAGeu_iNW4AkgkiO0lDFZasUcOycxHrsk34"
CHAT_ID="951525403"

send_msg() {
  curl -s -X POST "https://api.telegram.org/bot${TOKEN}/sendMessage" \
    --data-urlencode "chat_id=${CHAT_ID}" \
    --data-urlencode "text=$1" \
    -d "parse_mode=HTML" | python3 -c "import sys,json; d=json.load(sys.stdin); print('OK' if d.get('ok') else 'FOUT: '+str(d))"
}

# === BERICHT 1: HEADER ===
MSG1="🇳🇱 <b>OCHTEND MARKTBRIEF — 28 APRIL 2026</b>
⏰ 09:14 AMS | Europese markt geopend | Sessie: MORNING"

echo "Versturen header..."
send_msg "$MSG1"
sleep 1

# === BERICHT 2: INDICES + MOVERS + KANSEN ===
MSG2="<b>INDICES</b>
• AEX: 1.021,26 (-0,28%)
• S&amp;P 500 (gisteren): 7.173,91 (+0,12%) ↗ record
• Nasdaq (gisteren): 24.887,10 (+0,20%) ↗ record
• Dow Jones (gisteren): 49.167,79 (-0,13%)

<b>GROOTSTE MOVERS</b>
Stijgers: Nasdaq +0,20% | S&amp;P 500 +0,12% | MSFT +2,1% (vr.)
Dalers:   BESI -1,12% | ASM -0,99% | NFLX -0,41%

<b>HOOG VOLUME (&gt;1,5x gemiddeld)</b>
📈 SNDK — Sterkste performer S&amp;P 500 2026 (+317% YTD), vandaag -5,67% pullback → verhoogd volume verwacht
📈 MU — AI-chip rally (gisteren +6,0%), momentum

<b>💡 POTENTIELE KANSEN</b>
• SNDK \$890,89: Pullback -5,67% na +317% YTD rally. Steun ~\$850 → mogelijke terugval-instap
• MSFT \$425,47: Resultaten morgen 29 april (na beurs). 52wk high \$555 → pre-earnings setup
• UBER \$76: Pre-earnings 6 mei. 52wk high \$101,99 → 25% onder piek, analistendoel \$103
• AEX 1.021,26: Houdt 1.000-niveau bij lichte correctie — bullish structuur intact"

echo "Versturen indices + analyse..."
send_msg "$MSG2"
sleep 1

# === BERICHT 3: MARKTCONTEXT ===
MSG3="<b>🌍 MARKTCONTEXT</b>
🥇 Goud: ~\$4.700/oz — stabiel na -2,5% vorige week (historisch niveau)
🥈 Zilver (SLV): +11% YTD — outperformt goud
⛽ Nat. Gas (NG=F): \$2,505/MMBtu (-3,6%) — laagste stand seit okt 2024, mild voorjaarsweer
🛢 Ruwe Olie (USO): \$128,24 (+97% j-o-j) — Midden-Oosten conflictpremie
😬 VIX: 17,88 (-2,6%) — normaal regime (bandbreedte 15-25)

<i>Macro:</i> VS-beurzen (S&amp;P 500, Nasdaq) op recordstand. Iran-vredesonderhandelingen stagneren → oliepremie. Magnificent 7 earnings week: MSFT morgen 29 apr, META donderdag 30 apr, AMZN/AAPL/AMZN volgende week."

echo "Versturen marktcontext..."
send_msg "$MSG3"
sleep 1

# === BERICHT 4: VOLLEDIG PORTFOLIO ===
MSG4="<b>📋 VOLLEDIG PORTFOLIO — 28 APRIL 2026</b>

<pre>Symbool   Naam             Prijs        Wijz.
--------- ---------------- ------------ --------
BESI.AS   BE Semiconductor €247,80      -1,12%
ASM.AS    ASM Intl         €780,00      -0,99%
HEIJM.AS  Heijmans         €10,32       n.b.
SHELL.AS  Shell PLC        €38,13       n.b.
^AEX      AEX Index        1.021,26     -0,28%
SLV       Silver ETF       n.b.         +11%YTD
IAU       Gold ETF         n.b.         stabiel
NG=F      Nat. Gas Futures $2,505       -3,60%
UNG       Gas ETF          n.b.         n.b.
USO       Oil ETF          $128,24      +97%joj
AVGO      Broadcom         $416,72      n.b.
MU        Micron           $525,50      n.b.
LMT       Lockheed Martin  $658,08      n.b.
SNDK      SanDisk          $890,89      -5,67%
RDDT      Reddit           $157,00      n.b.
NFLX      Netflix          $92,44       -0,41%
MSFT      Microsoft        $425,47      n.b.
AMZN      Amazon           $262,73      n.b.
UBER      Uber             $76,00       n.b.</pre>

<i>Data: 28 apr 2026 ochtend | EU: Euronext live | VS: 27 apr slotkoersen | Bronnen: Google Finance, CNBC, Trading Economics</i>"

echo "Versturen portfolio tabel..."
send_msg "$MSG4"

echo ""
echo "✅ Ochtend Marktbrief 28 april 2026 verstuurd!"
