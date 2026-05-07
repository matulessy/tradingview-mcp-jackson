#!/bin/bash
# Ochtend Marktbrief — 7 mei 2026 — 09:00 AMS
# Gegenereerd op basis van WebSearch data

TOKEN="8695038106:AAGeu_iNW4AkgkiO0lDFZasUcOycxHrsk34"
CHAT_ID="951525403"

send_msg() {
  curl -s -X POST "https://api.telegram.org/bot${TOKEN}/sendMessage" \
    --data-urlencode "chat_id=${CHAT_ID}" \
    --data-urlencode "text=$1" \
    -d "parse_mode=HTML" | python3 -c "import sys,json; d=json.load(sys.stdin); print('OK' if d.get('ok') else 'FOUT: '+str(d))"
}

# === BERICHT 1: HEADER ===
MSG1="🌅 <b>OCHTEND MARKTBRIEF — 7 MEI 2026</b>
AEX SCHERPT RECORDS AAN | GOUD &gt; $4.700 | SEMIS LEIDEN"

echo "Versturen header..."
send_msg "$MSG1"
sleep 1

# === BERICHT 2: INDICES ===
MSG2="<b>📊 INDICES</b>
• AEX:             ~1.031 (records aangescherpt, +1,7% gisteren)
• S&amp;P 500 (gist.): 7.259,22 (+0,80%)
• Nasdaq (gist.):  25.326,13 (+1,00%)
• Dow (gist.):     49.298,25 (+1,10%)
• VIX (gist.):     17,38 (-4,98%) — <i>normaal regime (15-25)</i>

<b>GROOTSTE MOVERS (afgelopen sessie)</b>
Stijgers: HEIJM +4,6% | BESI +4,09% | ASM +1,67%
Dalers:   LMT -1,76% | SHELL -0,03%"

echo "Versturen indices + movers..."
send_msg "$MSG2"
sleep 1

# === BERICHT 3: KANSEN + CONTEXT ===
MSG3="<b>💡 POTENTIELE KANSEN</b>
• <b>BESI €251,40</b>: AEX-records aanscherpen, semis in de lift — momentum setup
• <b>MU $637,52</b>: AI-chip demand sterk, hoog volume signalen
• <b>SNDK $1.385,29</b>: flash storage / AI infra play, range $1.334–$1.497
• <b>AMZN $276,87</b>: Nasdaq bounce, cloud + AI rugwind
• <b>MSFT $410,35</b>: herstel van YTD-underperformance, AI tailwind

<b>🌍 MARKTCONTEXT &amp; COMMODITIES</b>
🥇 Goud: &gt;$4.700/oz — record, Iran-deal-onderhandelingen als katalysator
🥈 Zilver: &gt;$77/oz — outperformt goud, +6% vorige sessie
🛢 WTI Crude: $95,66 (+0,61%) — olieprijzen hoog
⛽ Nat. Gas: $2,71/MMBtu (-0,86%) — zwakke gasvraag
🌐 Macro: Iran MOU-onderhandelingen steunen grondstoffen; VIX daalt = risico-appetijt terug"

echo "Versturen kansen + context..."
send_msg "$MSG3"
sleep 1

# === BERICHT 4: VOLLEDIG PORTFOLIO ===
MSG4="<b>📋 VOLLEDIG PORTFOLIO — 7 MEI 2026 (ochtend)</b>

<pre>Symbool   Naam              Prijs        %
--------- ----------------- ------------ --------
BESI.AS   BE Semiconductor  €251,40      +4,09%
^AEX      AEX Index         ~1.031       +1,70%
ASM.AS    ASM International est.         +1,67%
HEIJM.AS  Heijmans          —            +4,60%
SHELL.AS  Shell             —            -0,03%
SLV       iShares Silver    &gt;$77/oz     sterk ↑
IAU       iShares Gold      &gt;$4.700/oz  record ↑
NG=F      Natural Gas       $2,71        -0,86%
UNG       US Nat Gas ETF    —            —
USO       US Oil ETF        —            —
AVGO      Broadcom          $424,02      —
MU        Micron            $637,52      —
LMT       Lockheed Martin   ~$509        -1,76%
SNDK      SanDisk           $1.385,29    —
RDDT      Reddit            —            —
NFLX      Netflix           $88,98       —
MSFT      Microsoft         $410,35      —
AMZN      Amazon            $276,87      —
UBER      Uber              $74,30       —
^GSPC     S&amp;P 500          7.259,22     +0,80%
^IXIC     Nasdaq            25.326,13    +1,00%
^DJI      Dow Jones         49.298,25    +1,10%
^VIX      VIX               17,38        -4,98%</pre>

<i>Data: 7 mei 2026 ochtend | Bronnen: WebSearch / DeAandeelhouder / Fortune</i>"

echo "Versturen portfolio tabel..."
send_msg "$MSG4"

echo ""
echo "✅ Ochtend Marktbrief 7 mei 2026 verstuurd!"
