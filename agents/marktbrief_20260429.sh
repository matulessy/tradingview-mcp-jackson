#!/bin/bash
# VS Marktopen Brief — 29 April 2026 — 15:00 AMS
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
MSG1="🇺🇸 <b>VS MARKTOPEN BRIEF — 29 APRIL 2026 — 15:00 AMS</b>
⚡ MEGA-CAP EARNINGS DAG: MSFT, AMZN, META, GOOG rapporteren VANDAAG na sluitingsbell"

echo "Versturen header..."
send_msg "$MSG1"
sleep 1

# === BERICHT 2: INDICES ===
MSG2="<b>📊 INDICES</b>
• S&amp;P 500: 7.130,53 (-0,60%)
• Nasdaq:   24.650,38 (-0,95%)
• Dow:      49.108,15 (-0,12%)
• VIX:      18,60 (+3,22%) — <i>normaal regime (15-25)</i>
• AEX:      999,12 (-0,19%) — <i>Europese afsluiting</i>

<b>TOP MOVERS VS-PORTFOLIO</b>
Stijgers: LMT $512,29 | AMZN +13% YTD | MU dag-range $488–$525
Dalers:   MSFT -12% YTD | AVGO $400,35 | NFLX $91,91 (-0,46%)

<b>PRE-MARKET SIGNALEN</b>
🔴 MSFT $424,72 — rapporteert vanavond (verwacht: grote beweging)
🔴 AMZN $259,32 — rapporteert vanavond (+13% YTD, bullish verwachting)
🔴 META / GOOG — ook vanavond cijfers
📅 RDDT $152,96 — rapporteert morgen 30 april (pre-earnings druk)"

echo "Versturen indices + movers..."
send_msg "$MSG2"
sleep 1

# === BERICHT 3: KANSEN + CONTEXT ===
MSG3="<b>💡 POTENTIELE KANSEN</b>
• <b>AMZN $259,32</b>: +13% YTD, sterke earnings verwachting → longkandidaat
• <b>MSFT $424,72</b>: -12% YTD, goedkoop vs peers. Resultaten = keerpunt?
• <b>MU $518,98</b>: AI-chip momentum, dag range $488–$525 (hoog volume)
• <b>BESI €247,80</b>: 3,7% onder ATH €257,40 — breakout setup AEX

<b>🌍 MARKTCONTEXT &amp; COMMODITIES</b>
🛢 WTI Crude: $99,32 (-0,61%) | Brent: $113,47 — hoogste sinds jun 2022
🥇 Goud (IAU): $88,07 — stabiel op recordniveau
🥈 Zilver (SLV): $65,42 — outperformt goud YTD
⛽ Nat. Gas: $2,68/MMBtu — 18-maands dieptepunt (zachte winter, zwakke vraag)
🛢 USO: $141,04 | Macro: OpenAI revenue miss (WSJ) → tech-druk gisteren"

echo "Versturen kansen + context..."
send_msg "$MSG3"
sleep 1

# === BERICHT 4: EU AFSLUITING + VOLLEDIG PORTFOLIO ===
MSG4="<b>🇪🇺 EU AFSLUITING — 29 APRIL 2026</b>
• BESI.AS:  €247,80 (-1,12%) | 3,7% onder 52wk high €257,40
• ASM.AS:   €783,00 (est.)
• HEIJM.AS: geen recente data
• SHELL.AS: €38,08 (+0,32%) | 52wk range €28,46–€41,33"

echo "Versturen EU afsluiting..."
send_msg "$MSG4"
sleep 1

MSG5="<b>📋 VOLLEDIG VS PORTFOLIO — 29 APR 2026</b>

<pre>Symbool  Naam             Prijs     Wijz.    Vol
-------- ---------------- --------- -------- -----
AVGO     Broadcom         $400,35   n.b.     n.b.
MU       Micron           $518,98   hoog ↑   hoog
LMT      Lockheed Martin  $512,29   -0,21%   n.b.
SNDK     SanDisk          n.b.      n.b.     n.b.
RDDT     Reddit           $152,96   n.b.     n.b.  📅
NFLX     Netflix          $91,91    -0,46%   n.b.
MSFT     Microsoft        $424,72   n.b.     n.b.  🔴
AMZN     Amazon           $259,32   n.b.     n.b.  🔴
UBER     Uber             ~$76–85   n.b.     n.b.
^GSPC    S&amp;P 500         7.130,53  -0,60%   n.b.
^IXIC    Nasdaq           24.650,38 -0,95%   n.b.
^DJI     Dow Jones        49.108,15 -0,12%   n.b.
^VIX     VIX              18,60     +3,22%   —</pre>

🔴 = rapporteert vanavond | 📅 = rapporteert morgen
<i>Data: 29 apr 2026 ~15:00 | Bronnen: WebSearch / TheStreet / CNBC</i>"

echo "Versturen portfolio tabel..."
send_msg "$MSG5"

echo ""
echo "✅ VS Marktopen Brief 29 april 2026 verstuurd!"
