#!/bin/bash
# Ochtend Marktbrief — 27 April 2026
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
MSG1="🌅 <b>OCHTEND MARKTBRIEF — 27 APRIL 2026</b>
🎉 <i>Koningsdag | AEX is gewoon geopend</i>

📊 S&amp;P 500: 7.164,94 (+0,8%) | Nasdaq: 24.836,60 (+1,6%)
🇳🇱 AEX: ~1.025 (licht hoger ↑) | VIX: 18,71 (normaal)
🛢 WTI Olie: \$96,03/vat (+1,7%) | Zilver boven \$76/oz"

echo "Versturen header..."
send_msg "$MSG1"
sleep 1

# === BERICHT 2: HOOFDBRIEF ===
MSG2="<b>📊 INDICES</b>
• AEX: ~1.025 (lichtgroen open, vr. slot 1.023,44)
• S&amp;P 500 (gisteren vr.): 7.164,94 (+0,8%) ✅ record
• Nasdaq (gisteren vr.): 24.836,60 (+1,6%) ✅ record
• Dow Jones (gisteren vr.): 49.231 (-0,2%)

<b>🔺 GROOTSTE MOVERS</b>
<b>Stijgers:</b>
1. MU (Micron) +6,0% — AI-chip vraag herleeft
2. BESI.AS +5,2% → €254,40 — week +11%
3. AVGO (Broadcom) +4,0% → \$420,10

<b>Dalers:</b>
1. NG=F Natural Gas -3,6% → \$2,52/MMBtu
2. IAU (Goud ETF) -0,95% → \$88,34
3. NFLX (Netflix) -0,4% → \$92,44 (stabiliseert na -10% earnings)

<b>📈 HOOG VOLUME (&gt;1,5x gemiddeld)</b>
• MU: verhoogd volume op AI-chip rally (+6%)
• AVGO: verhoogd volume na chiprally (+4%)
• BESI.AS: sterk volume — week +11%

<b>💡 POTENTIËLE KANSEN</b>
• <b>NFLX \$92,44</b> — Oversold bounce: -10% post-Q1, \$25 mrd buyback. Weerstand \$93,28
• <b>BESI.AS €254</b> — Momentum bullish, nabij 52wk high. Breakout continuatie
• <b>SHELL €38,13</b> — Olie naar \$96/vat (+1,7%). Iran-Hormuz spanningen steunen prijs
• <b>USO \$134,72</b> — Olie ETF +4,1%. Geopolitieke risicopremie in energie

<b>🌍 MARKTCONTEXT</b>
• Goud (IAU): \$88,34 | -0,95%
• Zilver (SLV): boven \$76/oz | stijgend
• WTI Olie: \$96,03/vat | +1,73% — Iran stuurt vredesvoorstel VS (Hormuz)
• Natural Gas: \$2,52/MMBtu | -3,6% — mild weer, laagste niveau okt 2024

<i>Macro:</i> VS indices 3e week op rij hoger, S&amp;P 500 boven 7.000. Tech +8,1% weekwinst. VIX 18,7 = normaal regime."

echo "Versturen hoofdbrief..."
send_msg "$MSG2"
sleep 1

# === BERICHT 3: PORTFOLIO TABEL ===
MSG3="<b>📋 VOLLEDIG PORTFOLIO — 27 APRIL 2026</b>

<pre>Symbool   Naam             Prijs        Wijz.
--------- ---------------- ------------ --------
BESI.AS   BE Semiconductor €254,40      +5,21%
^AEX      AEX Index        ~1.025       +0,2%↑
ASM.AS    ASM Intl         ~€760        +10%W
HEIJM.AS  Heijmans         n.b.         n.b.
SHELL.AS  Shell PLC        €38,13       stabiel
SLV       Silver ETF       >$76,00      +
IAU       Gold ETF         $88,34       -0,95%
NG=F      Natural Gas Fut  $2,52        -3,6%
UNG       Gas ETF          n.b.         n.b.
USO       Oil ETF          $134,72      +4,11%
AVGO      Broadcom         $420,10      +4,0%
MU        Micron           $451,41      +6,0%
LMT       Lockheed Martin  $513,45      n.b.
SNDK      SanDisk          $913,15      n.b.
RDDT      Reddit           $164,31      n.b.
NFLX      Netflix          $92,44       -0,4%
MSFT      Microsoft        $424,62      +2,1%
AMZN      Amazon           $255,36      n.b.
UBER      Uber             $74,55       n.b.
^GSPC     S&P 500          7.164,94     +0,8%
^IXIC     Nasdaq           24.836,60    +1,6%
^DJI      Dow Jones        49.231       -0,2%
^VIX      VIX              18,71        normaal</pre>

<i>Data: vr. 25 apr (VS) / ma. 27 apr open (EU) | Bronnen: Yahoo Finance, CNBC, Trading Economics</i>"

echo "Versturen portfolio tabel..."
send_msg "$MSG3"

echo ""
echo "✅ Marktbrief verstuurd!"
