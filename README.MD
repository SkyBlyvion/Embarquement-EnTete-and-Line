# Tables à réaliser : 

 - Dossier D'arrivage 50010
 - ligne dossier arrivage 50026
 - Avis dossier arrivage 50004
 - Prestation dossier arrivage 50017
 - CREDOC 50012

12/09/24 = 2350 lignes de code

TODO: 02 TODO Dossier Arrivage
 . . .
 {
      "from": 50235,
      "to": 50300
    }
 . . .

 table 50235 "LigneEmbarquement"

 table 50236 EnTeteEmbarquement

 tableextension 50237 "PurchasesPayablesSetup"

 permissionset 50238 EmbarquementPerms

 tableextension 50239 "ReservationEntry"

 tableextension 50240 PurchaseHeaderCustom

 tableextension 50241 PurchaseLineCustom

 pageextension 50242 "PurchaseHeaderPageExt"

 pageextension 50243 PurchaseLinePageExt

 page 50244 "HistoriquePRRPage"

 page 50245 "HistoriquePRTPage"

 permissionset 50246 HistoriquePRTPerm

 table 50247 "HistoriquePRTTable"

 table 50248 "HistoriquePRRTable"








