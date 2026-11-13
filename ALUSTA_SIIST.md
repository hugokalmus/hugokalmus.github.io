# Hugo portfoolio avaldamine

Supabase'i tabelid, omaniku kasutaja ja ligipääs on seadistatud. Veebilehe `config.js` sisaldab Supabase Project URL-i ning avalikku Publishable key'd. Parool ei ole veebifailides.

## Avalda Cloudflare Pagesis

1. Laadi alla `hugo-kalmus-cloudflare.zip`.
2. Cloudflare'is ava **Workers & Pages** ja vali **Create application → Get started → Drag and drop your files**.
3. Pane projektile nimi, näiteks `hugo-kalmus`, ning vali ZIP-fail.
4. Vajuta **Deploy site**. Cloudflare näitab pärast avaldamist aadressi kujul `projekti-nimi.pages.dev`.
5. Ava see aadress ja proovi lehte vaadata. Omaniku muutmispaneeli saad avada nupust **Omanik** ning logida sisse Supabase'is loodud e-posti ja parooliga.

Cloudflare'i ametlik juhend: [Pages Direct Upload](https://developers.cloudflare.com/pages/get-started/direct-upload/).

## Muudatuste avaldamine hiljem

Sisu muutmine veebilehe Omaniku paneelis salvestub Supabase'i ja ilmub külastajatele. Kui muudad veebilehe faile endid, loo uus ZIP ja laadi Cloudflare Pagesi uus juurutus üles.

CV PDF-i pole veel lisatud. Kui see on valmis, lisa muutmispaneelis väljale „CV PDF-i link” selle avalik link; allalaadimisnupp ilmub siis CV jaotisse.
