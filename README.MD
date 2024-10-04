# Tables à réaliser : 

 - Dossier D'arrivage 50010 En cours
 - ligne dossier arrivage 50026
 - Avis dossier arrivage 50004
 - Prestation dossier arrivage 50017 En cours
 - Prestation ligne dossier 50019
 - Prestation 50016
 - CREDOC 50012

12/09/24 = 2350 lignes de code


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

 table 50249 DossierArrivage

 tableextension 50250 "InventorySetupCustom"

 table 50251 "PrestationDossierArrivage"

 permissionset 50252 "ArrivagePerms"

 table 50253 Prestation

 table 50254 "PrestationLigneDossier"

 table 50255 "LigneDossierArrivage"

 tableextension 50256 "ItemVariantCustom"

 table 50257 AvisDossierArrivage 

 table 50258 Avis

 table 50259 Credoc

 table 50260 "AvisLigneDossier"

 /!\ REMOVED /!\ pageextension 50261 "HistoriquePRTExtPage"

 page 50262 EnTeteEmbrq - NO PERM

 pageextension 50263 ItmCrdExtAdActionsTpBar - NO PERM

 page 50264 "LigneEmbarquemen" - NO PERM

 page 50265 AvisPage - NO PERM

 page 50266 "AvisLigneDossierPage" NO PERM

 page 50267 AvisDossierArrivagePage no perm

 page 50268 PrestationPage no perm

 page 50269 PrestationLigneDossierPage no perm

 page 50270 PrestationDossierArrivagePage no perm

 page 50271 DossierArrivagePage 

 page 50272 LigneDossierArrivagePage

 page 50273 CredocPage

 page 50274 FraisAnnexesAchat

 pageext 50275 PurchasePayablesSetup

 pageext 50276 inventorySetupCstmPage

 pageext 50277 ItemVariantCustomPage

 pageext 50278 ReservationEntryPage

 table 50279 HistoriqueCredoc

 pageextension 50280 ExtendPurchasingMenu

 pageextension 50281 EntendWhseMngRoleCntr

 pageextension 50282 EntendSalesMngRoleCntr

 table 50283 ReglementCredoc

 codeunit 50285 "CalculerPR"

 pageextension 50286 "PurchaseOrder"

 table 50287 "NDPPays"

 page 50288 "NDPPAYS"

 tableextension 50289 "PurchasePriceCustom"

 pageextension 50290 "PurchasePricePageExt"

 pageextension 50291 "PurchaseOrderSubForm"

 tableextension 50292 PurchRcptHeader

 tableextension 50293 PurchRcptLine
 

 tableextension 50297 "Sales Price Extension"

 pageextension 50298 "SalesPriceListExtension" 





------------------ ACTIONS ACCES ------------------

                group("Avis")
                {
                    Caption = 'Avis';
                    action("Les Avis")
                    {
                        ApplicationArea = All;
                        Caption = 'Les Avis';
                        ToolTip = 'Voir l''avis pour cet article.';
                        Image = History;

                        trigger OnAction()
                        begin
                            Page.Run(PAGE::AvisPage);
                        end;
                    }
                    action("Avis Ligne Dossier")
                    {
                        ApplicationArea = All;
                        Caption = 'Avis Ligne Dossier';
                        ToolTip = 'Voir l''avis de la ligne de dossier pour cet article.';
                        Image = History;

                        trigger OnAction()
                        begin
                            Page.Run(PAGE::AvisLigneDossierPage);
                        end;
                    }
                    action("Avis Dossier Arrivage")
                    {
                        ApplicationArea = All;
                        Caption = 'Avis Dossier Arrivage';
                        ToolTip = 'Voir l''avis du dossier d''arrivage pour cet article.';
                        Image = History;

                        trigger OnAction()
                        begin
                            Page.Run(PAGE::AvisDossierArrivagePage);
                        end;
                    }
                }
                group("Prestations")
                {
                    Caption = 'Prestation';
                    action("Prestation")
                    {
                        ApplicationArea = All;
                        Caption = 'Prestation';
                        ToolTip = 'Voir la prestation pour cet article.';
                        Image = History;

                        trigger OnAction()
                        begin
                            Page.Run(PAGE::PrestationPage);
                        end;
                    }
                    action("Prestation Ligne Dossier")
                    {
                        ApplicationArea = All;
                        Caption = 'Prestation Ligne Dossier';
                        ToolTip = 'Voir la prestation de la ligne de dossier pour cet article.';
                        Image = History;

                        trigger OnAction()
                        begin
                            Page.Run(PAGE::PrestationLigneDossierPage);
                        end;
                    }
                    action("Prestation Dossier Arrivage")
                    {
                        ApplicationArea = All;
                        Caption = 'Prestation Dossier Arrivage';
                        ToolTip = 'Voir la prestation du dossier d''arrivage pour cet article.';
                        Image = History;

                        trigger OnAction()
                        begin
                            Page.Run(PAGE::PrestationDossierArrivagePage);
                        end;
                    }
                }
                group("Embarquement")
                {
                    Caption = 'Embarquement';
                    action("EnTete Embarquement")
                    {
                        ApplicationArea = All;
                        Caption = 'Embarquement';
                        ToolTip = 'Voir l''embarquement pour cet article.';
                        Image = History;

                        trigger OnAction()
                        begin
                            Page.Run(PAGE::EnTeteEmbarquemen);
                        end;
                    }
                    action("Ligne Embarquement")
                    {
                        ApplicationArea = All;
                        Caption = 'LigneEmbarquement';
                        ToolTip = 'Voir l''embarquement de la ligne de dossier pour cet article.';
                        Image = History;

                        trigger OnAction()
                        begin
                            Page.Run(PAGE::LigneEmbarquemen);
                        end;
                    }
                }
                group("Arrivage")
                {
                    action("Dossier Arrivage")
                    {
                        ApplicationArea = All;
                        Caption = 'Dossier Arrivage';
                        ToolTip = 'Voir le dossier d''arrivage pour cet article.';
                        Image = History;

                        trigger OnAction()
                        begin
                            Page.Run(PAGE::DossierArrivagePage);
                        end;
                    }
                    action("Ligne Dossier Arrivage")
                    {
                        ApplicationArea = All;
                        Caption = 'Ligne Dossier Arrivage';
                        ToolTip = 'Voir la ligne de dossier d''arrivage pour cet article.';
                        Image = History;

                        trigger OnAction()
                        begin
                            Page.Run(PAGE::LigneDossierArrivagePage);
                        end;
                    }
                }
                group("Credoc")
                {
                    action("Credit Documentaire")
                    {
                        ApplicationArea = All;
                        Caption = 'Credoc';
                        ToolTip = 'Voir le Credoc pour cet article.';
                        Image = History;

                        trigger OnAction()
                        begin
                            Page.Run(PAGE::CredocPage);
                        end;
                    }
                }
                action("Frais Annexes Achat")
                {
                    ApplicationArea = All;
                    Caption = 'Frais Annexes Achat';
                    ToolTip = 'Voir les frais annexes d''achat pour cet article.';
                    Image = History;

                    trigger OnAction()
                    begin
                        Page.Run(PAGE::FraisAnnexesAchatPage);
                    end;
                }




