#!/bin/bash
TOKEN="8695038106:AAGeu_iNW4AkgkiO0lDFZasUcOycxHrsk34"
CHAT_ID="951525403"

send_msg() {
  curl -s -X POST "https://api.telegram.org/bot${TOKEN}/sendMessage" \
    --data-urlencode "chat_id=${CHAT_ID}" \
    --data-urlencode "text=$1" \
    -d "parse_mode=HTML" | python3 -c "import sys,json; d=json.load(sys.stdin); print('OK' if d.get('ok') else 'FOUT: '+str(d))" 2>&1 || echo "VERBINDINGSFOUT"
}

# === BERICHT 1: HEADER ===
MSG1="🌅 <b>OCHTEND MARKTBRIEF — 15 MEI 2026</b>
AEX BOVEN 1.000 | S&amp;P 500 NIEUW RECORD | WTI BOVEN \$100 | GOUD/ZILVER SELL-OFF"

echo "Versturen header..."
send_msg "$MSG1"
sleep 1

# === BERICHT 2: INDICES + MOVERS ===
MSG2="<b>📊 INDICES</b>
• AEX:             ~1.019 (+0,9%) — Hemelvaartsdag
• S&amp;P 500 (gist.): 7.503 (+0,77%) — nieuw ATH 🏆
• Nasdaq (gist.):  26.635 (+0,90%) — nieuw ATH 🏆
• Dow (gist.):     50.063 (+0,75%) — &gt;50.000
• VIX (gist.):     17,26 — <i>normaal regime (15-25)</i>

<b>GROOTSTE MOVERS (14 mei)</b>
Stijgers: BESI +2,9% | ASM +1,9% | RDDT +1,4%
Dalers:   SLV -4,9% | SNDK -4,3% | MU -3,1% | UBER -2,2%"

echo "Versturen indices + movers..."
send_msg "$MSG2"
sleep 1

# === BERICHT 3: KANSEN + CONTEXT ===
MSG3="<b>💡 POTENTIELE KANSEN</b>
• <b>BESI €266,70</b>: Semichips sterk, AEX-momentum intact — breakout play
• <b>AMZN $267</b>: Bloomberg: racing toward \$3T club, Nasdaq ATH-rugwind
• <b>LMT $520</b>: Defense solide bij WTI \$102 + Iran-conflict escalatie
• <b>MSFT $405</b>: AI tailwind, herstel na YTD underperformance

<b>⚠️ OPGELET</b>
• <b>MU $778 (-3,1%)</b>: Hoog verkoopvolume — zwakte in chips? Check setup
• <b>SLV $75,51 (-4,9%)</b>: Scherpe zilver sell-off door sterke dollar

<b>🌍 MARKTCONTEXT &amp; COMMODITIES</b>
🛢 WTI Crude: $102,49 (+1,3%) — +7% week | US-Iran conflict escaleert
🥇 Goud (COMEX): $4.615/oz (-1,5%) — dollar rally drukt edelmetalen
🥈 Zilver (SLV): $75,51 (-4,9%) — sterke daling
⛽ Nat. Gas: $2,82/MMBtu — zwak, hoge voorraden
🌐 Macro: Nasdaq &amp; S&amp;P 500 op records | VIX 17,26 = risico-appetijt aanwezig"

echo "Versturen kansen + context..."
send_msg "$MSG3"
sleep 1

# === BERICHT 4: VOLLEDIG PORTFOLIO ===
MSG4="<b>📋 VOLLEDIG PORTFOLIO — 15 MEI 2026 (ochtend)</b>

<pre>Symbool   Naam              Prijs        %
--------- ----------------- ------------ -------
BESI.AS   BE Semiconductor  €266,70      +2,9%
^AEX      AEX Index         ~1.019       +0,9%
ASM.AS    ASM International  —           +1,9%
HEIJM.AS  Heijmans           —            —
SHELL.AS  Shell              —            —
SLV       iShares Silver    $75,51       -4,9%
IAU       iShares Gold      $88,19       -0,6%
NG=F      Natural Gas       $2,82         —
UNG       US Nat Gas ETF     —            —
USO       US Oil ETF         —            —
AVGO      Broadcom          $440,04        —
MU        Micron            $778,00      -3,1%
LMT       Lockheed Martin   $520,41      +0,1%
SNDK      SanDisk           $1.385,68    -4,3%
RDDT      Reddit            $156,24      +1,4%
NFLX      Netflix           $87,56        ~0%
MSFT      Microsoft         $405,21        —
AMZN      Amazon            $267,22        —
UBER      Uber              $74,66       -2,2%
^GSPC     S&amp;P 500          7.503        +0,77%
^IXIC     Nasdaq            26.635       +0,90%
^DJI      Dow Jones         50.063       +0,75%
^VIX      VIX               17,26          —</pre>

<i>Data: 15 mei 2026 | 09:00 AMS | Bronnen: TheStreet / DeAandeelhouder / TradingKey / Fortune</i>"

echo "Versturen portfolio tabel..."
send_msg "$MSG4"

echo ""
echo "✅ Ochtend Marktbrief 15 mei 2026 klaar!"
