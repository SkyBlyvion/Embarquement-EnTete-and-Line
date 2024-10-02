codeunit 50285 "CalculerPR"
{
    /*

    //Documentation

    //* NSC1.12 :
    //*1) Test du changement du 'cout unitaire direct' ; '% remise' ; 'Incoterm' de la ligne d'achat
    //*2) Fonction de MAJ du champ 'dernier PRT calculé' dans la fiche tarif de l'article
    //*FIN NSC1.12


    NSc1.14 : 22/12/99 (SL) : MAJ de DernierPrix de revient de la fiche article
                               Apres calcul du PRT : uniquement si la zone est vide
                               Aprs calcul du PRR : selon les dates de création des dossiers d'arrivage
                              Ne plus faire de test sur la notion de dossier cloturé

    NSC2.01 : 04/01/00 (SL) : Modification du calcul du PRR : ne pas prendre en compte le prix d'achat

    //*NSC2.14 : Prise en compte des taux de devise lors de la mise à jour des coûts du catalogue fournisseur
    //* lors du calcul du PRT

    //MIGRATION_400 PC 11/07/06 NSC4.00 Migration

    //CALCUL_PRT SC 27/07/06 NSC4.00 "Montant Ligne achat" est calculé avec "Line Amount" et non plus Amount

    //FRAIS_ANNEXES CC 27/06/08 REV4.11 : gestion des frais annexes

    ----------------------------------------------------------------------------------------------

    Mise a jour du codeunit "Calculer PR" débutée le 30/09/24 - LN - REV24

    */
    var
        HistoPRT: Record "HistoriquePRTTable";               // Historique des Prix de Revient Théorique (PRT)
        EnteteAchat: Record "Purchase Header";           // Entête de commande d'achat
        LigAchat: Record "Purchase Line";                // Ligne de commande d'achat
        CondProd: Record "Item Variant";                 // Variantes d'article
        Article: Record "Item";                          // Fiche article
        NomenclDouane: Record "Tariff Number";           // Numéro tarifaire douanier
        NDPPays: Record "NDPPays";                    // Tarifs douaniers spécifiques par pays (NDP)
        FournArt: Record "Purchase Price";               // Prix d'achat du fournisseur
        Avis: Record "Avis";                             // Avis sur les articles
        AvisDossier: Record "AvisDossierArrivage";  // Avis liés à un dossier d'arrivage
        AvisLigneDossier: Record "AvisLigneDossier"; // Avis liés aux lignes d'un dossier d'arrivage
        Prest: Record "Prestation";                      // Fiche prestation
        PrestDossier: Record "PrestationDossierArrivage";  // Prestations liées à un dossier d'arrivage
        PrestLigneDossier: Record "PrestationLigneDossier"; // Prestations liées à une ligne d'un dossier
        LigneDossier: Record "LigneDossierArrivage";   // Lignes d'un dossier d'arrivage
        HistoPRR: Record "HistoriquePRRTable";               // Historique des Prix de Revient Réels (PRR)
        Dossier: Record "DossierArrivage";            // Dossier d'arrivage (import)
        LigneDossierArrivage: Record "LigneDossierArrivage"; // Lignes du dossier d'arrivage
        AvisLigneDossierArrivage: Record "AvisLigneDossier"; // Avis liés aux lignes du dossier d'arrivage
        Avis2: Record "Avis";                            // Deuxième avis
        TauxDevises: Record "Currency Exchange Rate";    // Taux de change
        Devises: Record "Currency";                      // Devises
        ParamCompta: Record "General Ledger Setup";      // Param/location et Param/compta
        Article2: Record "Item";                         // Deuxième fiche article
        FnsArt: Record "Purchase Price";                 // Prix d'achat du fournisseur (2ème enregistrement)
        ArtAchatRemiseQte: Record "Purchase Line Discount"; // Remise sur la quantité d'achat
        PrixArticle: Record "Sales Price";               // Prix de vente de l'article
        FraisAnnexes: Record "FraisAnnexesAchat";      // Frais annexes liés à l'achat
        CondProd2: Record "Item Variant";                // Deuxième variante d'article
        Mode: Option Insertion,Modification,Suppression;  // Mode (option d'insertion ou modification)
        DernierNoCalcul: Integer;                        // Dernier numéro de calcul
        MntLigSelectionnees: Decimal;                    // Montant des lignes sélectionnées
        VolumeCde: Decimal;                              // Volume total de la commande
        VolumeDossier: Decimal;                          // Volume total du dossier
        ErreurPasDAvis: Boolean;                         // Booléen pour indiquer si un avis est manquant
        RemQte: Decimal;                                 // Remise en fonction de la quantité
        CoutUnitDirectBase: Decimal;                     // Coût unitaire direct de base
        CoutUnitDirectBase2: Decimal;                    // Coû unitaire direct de base (2ème enregistrement)
        REV4_11: Integer;                                // Numéro de version de révision (historique)

    trigger OnRun()
    begin

    end;

    /* 
        CalculerPRTDocVente : Parcourt les lignes d'une commande d'achat pour vérifier et mettre à jour les 
        informations relatives au fournisseur, Incoterm et remises. Met ensuite à jour l'historique 
        PRT (Prix de Revient Théorique).
    */
    var
        TxtErrorDocNonExistantErr: Label 'Le document %1 n°%2 n''existe pas. Le Calcul des PRT ne peut pas être effectué', Locked = true; // Message d'erreur
        ErrorMessage: Text;  // Variable temporaire pour stocker le message d'erreur

    procedure CalculerPRTDocVente(NoDoc: Code[20])
    begin
        IF NOT EnteteAchat.GET(EnteteAchat."Document Type"::Order, NoDoc) THEN begin
            ErrorMessage := StrSubstNo(TxtErrorDocNonExistantErr, 'Order', NoDoc);
            ERROR(ErrorMessage); // Lève l'erreur et arrête l'exécution ici
        end;

        // Le reste du code ne sera exécuté que si la condition précédente n'est pas vraie
        LigAchat.SETCURRENTKEY("Document Type", Type, "No.", "Variant Code", "Drop Shipment", "Location Code", "Expected Receipt Date");
        LigAchat.SETRANGE("Document Type", EnteteAchat."Document Type"::Order);
        LigAchat.SETRANGE("Document No.", NoDoc);
        LigAchat.SETRANGE(Type, LigAchat.Type::Item);

        IF NOT LigAchat.FIND('-') THEN
            EXIT;

        IF HistoPRT.FIND('+') THEN
            DernierNoCalcul := HistoPRT."No. calcul"
        ELSE
            DernierNoCalcul := 0;

        // Calcule le volume totale de la commande
        VolumeCde := 0;
        REPEAT

            //* NSC1.12 :Test du changement du 'cout unitaire direct' ; '% remise' ; 'Incoterm' de la ligne d'achat
            FnsArt.RESET();
            FnsArt.SETRANGE("Item No.", LigAchat."No.");
            FnsArt.SETRANGE("Vendor No.", LigAchat."Buy-from Vendor No.");
            FnsArt.SETRANGE("Starting Date", 0D, WORKDATE());
            IF FnsArt.FIND('+') THEN BEGIN

                ArtAchatRemiseQte.RESET();
                ArtAchatRemiseQte.SETCURRENTKEY("Item No.", "Vendor No.", "Minimum Quantity");
                ArtAchatRemiseQte.ASCENDING(TRUE);
                ArtAchatRemiseQte.SETRANGE("Item No.", LigAchat."No.");
                ArtAchatRemiseQte.SETRANGE("Vendor No.", LigAchat."Buy-from Vendor No.");
                ArtAchatRemiseQte.SETRANGE("Minimum Quantity", 0, ABS(LigAchat."Quantity (Base)"));

                IF ArtAchatRemiseQte.FIND('+') THEN
                    IF ArtAchatRemiseQte."Line Discount %" <> LigAchat."Line Discount %" THEN
                        IF CONFIRM('Voulez vous modifier %1 dans %2 \'
                                + 'Clef : %3 , %4 , %5', FALSE,
                                ArtAchatRemiseQte.FieldCaption("Line Discount %"), ArtAchatRemiseQte.TableCaption(),
                                ArtAchatRemiseQte."Item No.", ArtAchatRemiseQte."Vendor No.",
                                ArtAchatRemiseQte."Minimum Quantity") THEN BEGIN
                            ArtAchatRemiseQte."Line Discount %" := LigAchat."Line Discount %";
                            ArtAchatRemiseQte.MODIFY();
                        END;

                IF CondProd2.GET(LigAchat."No.", LigAchat."Variant Code") THEN
                    CoutUnitDirectBase := LigAchat."Direct Unit Cost" / CondProd2."Quantité Conditionnement"
                ELSE
                    CoutUnitDirectBase := LigAchat."Direct Unit Cost";

                //*NSC2.14
                CoutUnitDirectBase2 :=
                TauxDevises.ExchangeAmtFCYToFCY(WORKDATE(), LigAchat."Currency Code", FnsArt."Currency Code", CoutUnitDirectBase);

                IF Devises.GET(FnsArt."Currency Code") THEN
                    CoutUnitDirectBase2 := ROUND(CoutUnitDirectBase2, Devises."Unit-Amount Rounding Precision")
                ELSE
                    IF FnsArt."Currency Code" = '' THEN BEGIN
                        ParamCompta.GET();
                        CoutUnitDirectBase2 := ROUND(CoutUnitDirectBase2, ParamCompta."Unit-Amount Rounding Precision");
                    END ELSE
                        ERROR('La devise %1 n''existe pas', FnsArt."Currency Code");
                //*Fin NSC2.14

                IF CoutUnitDirectBase2 <> FnsArt."Direct Unit Cost" THEN
                    IF CONFIRM('Voulez vous modifier %1 dans %2 \'
                                + 'Clef : %3 , %4 , %5 , %6 , %7', FALSE,
                                FnsArt.FieldCaption("Direct Unit Cost"), FnsArt.TableCaption(),
                                FnsArt."Item No.", FnsArt."Vendor No.",
                                FnsArt."Unit of Measure Code", FnsArt."Starting Date") THEN BEGIN

                        //*NSC2.14
                        FnsArt."Direct Unit Cost" := CoutUnitDirectBase2;
                        //*Fin NSC2.14

                        FnsArt.MODIFY();
                    END;

                IF (LigAchat.Incoterm <> FnsArt.Incoterm) THEN
                    IF CONFIRM('Voulez vous modifier %1 dans %2 \'
                                + 'Clef : %3 , %4 , %5 , %6 , %7', FALSE,
                                FnsArt.FieldCaption(Incoterm), FnsArt.TableCaption(),
                                FnsArt."Item No.", FnsArt."Vendor No.",
                                FnsArt."Unit of Measure Code", FnsArt."Starting Date") THEN BEGIN
                        FnsArt.Incoterm := LigAchat.Incoterm;
                        FnsArt.MODIFY();
                    END;

                //* REV1.12 : Rajout C. CURTO le 21/06/00
                IF (EnteteAchat."Order Date" <> FnsArt."Date dernière Commande") THEN BEGIN
                    FnsArt."Date dernière Commande" := EnteteAchat."Order Date";
                    FnsArt.MODIFY();
                END;
                //* REV1.12

                //* REV1.13 : Rajout C. CURTO le 21/06/00
                IF (EnteteAchat."No." <> FnsArt."No. dernière Commande") THEN BEGIN
                    FnsArt."No. dernière Commande" := EnteteAchat."No.";
                    FnsArt."Qté dernière Commande (Pcs)" := LigAchat."Quantity (Base)";
                    FnsArt.MODIFY();
                END;
                //* REV1.13

            END;
            //*FIN NSC1.12 :Test du changement du 'cout unitaire direct' ; '% remise' ; 'Incoterm' de la ligne d'achat

            VolumeCde := VolumeCde + LigAchat.Volume;
        UNTIL LigAchat.NEXT() = 0;

        LigAchat.FIND('-');
        REPEAT
            IF LigAchat."Quantity (Base)" <> 0 THEN BEGIN
                IF NOT HistoPRT.GET(DernierNoCalcul + 1, LigAchat."No.") THEN
                    Mode := Mode::Insertion
                ELSE
                    Mode := Mode::Modification;

                IF Mode = Mode::Insertion THEN BEGIN
                    HistoPRT.INIT();
                    HistoPRT."No. calcul" := DernierNoCalcul + 1;
                    HistoPRT."No. article" := LigAchat."No.";
                    HistoPRT.Date := WORKDATE();
                    HistoPRT.Heure := TIME;
                    HistoPRT."No. commande" := LigAchat."Document No.";
                    HistoPRT."No. fournisseur" := EnteteAchat."Buy-from Vendor No.";
                    HistoPRT."Date achat" := EnteteAchat."Order Date";
                    HistoPRT."Code devise cde" := EnteteAchat."Currency Code";
                    HistoPRT."Facteur devise cde" := EnteteAchat."Currency Factor";
                    HistoPRT."Volume commande" := VolumeCde;
                    HistoPRT.Incoterm := EnteteAchat.Incoterm;

                    HistoPRT."Code transport routier" := EnteteAchat."Code transport routier";
                    HistoPRT."Montant transport routier" := EnteteAchat."Montant transport routier";
                    HistoPRT."Code devise transp. rout." := EnteteAchat."Code devise transport routier";
                    HistoPRT."Facteur devise transp. rout." := EnteteAchat."Facteur devise transp. routier";
                    HistoPRT."Code transport maritime" := EnteteAchat."Code transport maritime";
                    HistoPRT."Montant transport maritime" := EnteteAchat."Montant transport maritime";
                    HistoPRT."Code devise transp. marit." := EnteteAchat."Code devise transport maritime";
                    HistoPRT."Facteur devise transp. marit." := EnteteAchat."Facteur devise transp. maritim";

                    HistoPRT."% frais financiers" := EnteteAchat."% de frais financier";
                    HistoPRT."% assurances" := EnteteAchat."% assurances";
                    HistoPRT."% commissions" := EnteteAchat."% commissions";
                    HistoPRT."% transit" := EnteteAchat."% transit";
                END;

                HistoPRT."No. ligne" := COPYSTR(HistoPRT."No. ligne" + FORMAT(LigAchat."Line No.") + ' ', 1, 250);

                //CALCUL_PRT SC 27/07/06 NSC4.00 "Montant Ligne achat" est calculé avec "Line Amount" et non plus Amount
                //HistoPRT."Montant ligne achat" := HistoPRT."Montant ligne achat" + LigAchat.Amount;
                HistoPRT."Montant ligne achat" := HistoPRT."Montant ligne achat" + LigAchat."Line Amount";
                //Fin CALCUL_PRT SC 27/07/06 NSC4.00 "Montant Ligne achat" est calculé avec "Line Amount" et non plus Amount

                HistoPRT.Volume := HistoPRT.Volume + LigAchat.Volume;

                HistoPRT."% remise ligne" := ((HistoPRT."Quantité achetée" * HistoPRT."% remise ligne") +
                                            (LigAchat."Quantity (Base)" * LigAchat."Line Discount %")) /
                                            (HistoPRT."Quantité achetée" + LigAchat."Quantity (Base)");

                // attention, à ne pas mettre avant le calcul de remise moyenne
                HistoPRT."Quantité achetée" := HistoPRT."Quantité achetée" + LigAchat."Quantity (Base)";

                //* NSC1.14
                //* ajout du prix d'achat en devise d'achat , remise non déduite, issue de al commande d'achat
                HistoPRT."Coût unitaire direct" := LigAchat."Direct Unit Cost";

                //FRAIS_ANNEXES CC 27/06/08 REV4.11 : gestion des frais annexes
                FraisAnnexes.RESET();
                FraisAnnexes.SETRANGE("Document No.", LigAchat."Document No.");
                FraisAnnexes.SETRANGE("Item No.", LigAchat."No.");
                FraisAnnexes.SETRANGE("Line No.", LigAchat."Line No.");
                IF FraisAnnexes.FIND('-') THEN
                    IF FraisAnnexes.Amount <> 0 THEN
                        HistoPRT."Frais annexes (dev soc)" := FraisAnnexes.Amount / FraisAnnexes."Quantity (pcs)";
                //Fin FRAIS_ANNEXES CC 27/06/08 REV4.11 : gestion des frais annexes

                IF Mode = Mode::Insertion THEN
                    HistoPRT.INSERT()
                ELSE
                    HistoPRT.MODIFY();
                CalculerPRT(HistoPRT);
            END;
        UNTIL LigAchat.NEXT() = 0;
    end;

    /* 
        CalculerPRT : Effectue le calcul détaillé du Prix de Revient Théorique 
        pour un article donné en prenant en compte différents coûts comme le transport, 
        les frais financiers, et les droits de douane.
        
        il est fortement recommandé de spécifier explicitement l'objet de chaque méthode ou propriété pour améliorer 
        la lisibilité et éviter les ambiguïtés. C'est pour cela que la préfixation avec le nom de la variable 
        (HistoPRTParam.) est nécessaire. Le 01/10/24 - LN - REV24
    */
    procedure CalculerPRT(VAR HistoPRTParam: Record "HistoriquePRTTable")
    BEGIN

        // Prix d'achat
        HistoPRTParam."Prix achat (dev soc)" := 0;
        IF HistoPRTParam."Quantité achetée" <> 0 THEN
            IF HistoPRTParam."Facteur devise cde" <> 0 THEN
                HistoPRTParam."Prix achat (dev soc)" := (HistoPRTParam."Montant ligne achat" / HistoPRTParam."Quantité achetée") / HistoPRTParam."Facteur devise cde"
            ELSE
                HistoPRTParam."Prix achat (dev soc)" := (HistoPRTParam."Montant ligne achat" / HistoPRTParam."Quantité achetée");

        // TRANSPORT ROUTIER ET MARITIME
        HistoPRTParam."Coût transport rout. (dev soc)" := 0;
        HistoPRTParam."Coût transport marit. (devsoc)" := 0;
        IF HistoPRTParam."Volume commande" <> 0 THEN BEGIN
            HistoPRTParam."Coût transport rout. (dev soc)" := (HistoPRTParam.Volume / HistoPRTParam."Volume commande") * HistoPRTParam."Montant transport routier" / HistoPRTParam."Quantité achetée";
            IF HistoPRTParam."Facteur devise transp. rout." <> 0 THEN
                HistoPRTParam."Coût transport rout. (dev soc)" := HistoPRTParam."Coût transport rout. (dev soc)" / HistoPRTParam."Facteur devise transp. rout.";
            HistoPRTParam."Coût transport marit. (devsoc)" := (HistoPRTParam.Volume / HistoPRTParam."Volume commande") * HistoPRTParam."Montant transport maritime" / HistoPRTParam."Quantité achetée";
            IF HistoPRTParam."Facteur devise transp. marit." <> 0 THEN
                HistoPRTParam."Coût transport marit. (devsoc)" := HistoPRTParam."Coût transport marit. (devsoc)" / HistoPRTParam."Facteur devise transp. marit.";
        END;

        // % FRAIS : FINANCIERS, ASSURANCE, COMMISSION, TRANSIT
        HistoPRTParam."Montant frais fin. (dev soc)" := HistoPRTParam."Prix achat (dev soc)" * HistoPRTParam."% frais financiers" / 100;
        HistoPRTParam."Montant assurances (dev soc)" := HistoPRTParam."Prix achat (dev soc)" * HistoPRTParam."% assurances" / 100;
        HistoPRTParam."Montant commissions (dev soc)" := HistoPRTParam."Prix achat (dev soc)" * HistoPRTParam."% commissions" / 100;
        HistoPRTParam."Montant transit (dev soc)" := HistoPRTParam."Prix achat (dev soc)" * HistoPRTParam."% transit" / 100;

        // FRAIS DE DOUANE
        CASE EnteteAchat.Incoterm OF
            EnteteAchat.Incoterm::FOB:
                HistoPRTParam."CU net douane (dev soc)" := HistoPRTParam."Prix achat (dev soc)" +
                                            HistoPRTParam."Montant assurances (dev soc)" +
                                            HistoPRTParam."Montant commissions (dev soc)" +
                                            HistoPRTParam."Coût transport marit. (devsoc)";
            EnteteAchat.Incoterm::CNI:
                HistoPRTParam."CU net douane (dev soc)" := HistoPRTParam."Prix achat (dev soc)" +
                                            HistoPRTParam."Montant commissions (dev soc)" +
                                            HistoPRTParam."Coût transport marit. (devsoc)";
            EnteteAchat.Incoterm::CNF:
                HistoPRTParam."CU net douane (dev soc)" := HistoPRTParam."Prix achat (dev soc)" +
                                            HistoPRTParam."Montant commissions (dev soc)" +
                                            HistoPRTParam."Montant assurances (dev soc)";
            EnteteAchat.Incoterm::CIF:
                HistoPRTParam."CU net douane (dev soc)" := HistoPRTParam."Prix achat (dev soc)" +
                                            HistoPRTParam."Montant commissions (dev soc)";
            ELSE
                HistoPRTParam."CU net douane (dev soc)" := HistoPRTParam."Prix achat (dev soc)";

        END;
        // Recherche du TEC à appliquer
        HistoPRTParam."% droit douane" := 0;
        IF Article.GET(LigAchat."No.") THEN
            IF Article."Tariff No." <> '' THEN
                IF NDPPays.GET(Article."Tariff No.", Article."Country/Region of Origin Code") THEN
                    HistoPRTParam."% droit douane" := NDPPays."Taux réduit douane"
                ELSE
                    IF NomenclDouane.GET(Article."Tariff No.") THEN
                        HistoPRTParam."% droit douane" := NomenclDouane.TEC;

        HistoPRTParam."Montant frais douane (dev soc)" := HistoPRTParam."CU net douane (dev soc)" * HistoPRTParam."% droit douane" / 100;

        // TAXE ANTI-DUMPING (REV4.17) 19/06/15
        IF LigAchat."Taxe anti-dumping" <> 0 THEN
            HistoPRTParam."Montant taxe anti-dumping" := (HistoPRTParam."Prix achat (dev soc)" +
                                        HistoPRTParam."Coût transport marit. (devsoc)" +
                                        HistoPRTParam."Montant frais fin. (dev soc)" +
                                        HistoPRTParam."Montant assurances (dev soc)" +
                                        HistoPRTParam."Montant commissions (dev soc)" +
                                        HistoPRTParam."Montant transit (dev soc)" +
                                        HistoPRTParam."Montant frais douane (dev soc)" +
                                        HistoPRTParam."Frais annexes (dev soc)") * LigAchat."Taxe anti-dumping" / 100
        ELSE
            HistoPRTParam."Montant taxe anti-dumping" := 0;
        //Fin TAXE ANTI-DUMPING (REV4.17) 19/06/15

        // Calcul PRT
        //FRAIS_ANNEXES CC 27/06/08 REV4.11 : gestion des frais annexes
        /*{
        PRT := "Prix achat (dev soc)" +
                "Coût transport rout. (dev soc)" +
                "Coût transport marit. (devsoc)" +
                "Montant frais fin. (dev soc)" +
                "Montant assurances (dev soc)" +
                "Montant commissions (dev soc)" +
                "Montant transit (dev soc)" +
                "Montant frais douane (dev soc)";
        }*/
        HistoPRTParam.PRT := HistoPRTParam."Prix achat (dev soc)" +
                HistoPRTParam."Coût transport rout. (dev soc)" +
                HistoPRTParam."Coût transport marit. (devsoc)" +
                HistoPRTParam."Montant frais fin. (dev soc)" +
                HistoPRTParam."Montant assurances (dev soc)" +
                HistoPRTParam."Montant commissions (dev soc)" +
                HistoPRTParam."Montant transit (dev soc)" +
                HistoPRTParam."Montant frais douane (dev soc)" +
                HistoPRTParam."Frais annexes (dev soc)" +
                HistoPRTParam."Montant taxe anti-dumping";  // REV4.17

        // REV4.17
        IF HistoPRTParam."Montant taxe anti-dumping" <> 0 THEN
            HistoPRTParam.PRT := HistoPRTParam.PRT + (HistoPRTParam.PRT * 0.2 / 100); // Taxe fiscale de 0.2%

        HistoPRTParam.MODIFY();

        // NSC1.14 : Maj uniquement sir Dernier Prix revient est vide
        IF NOT Article.GET(LigAchat."No.") THEN
            ERROR('L''article n°%1 n''existe pas. Le prix de revient n''a pas été mis à jour', LigAchat."No.");

        IF Article."Standard Cost" = 0 THEN
            ModifierPR('PRT', LigAchat."No.", EnteteAchat."Buy-from Vendor No.", HistoPRTParam.PRT);

        //* NSC1.12 :Fonction de MAJ du champ 'dernier PRT calculé' dans la fiche tarif de l'article
        MAJFicheTarif(HistoPRTParam.PRT, LigAchat."No.");
        //*FIN NSC1.12 :Fonction de MAJ du champ 'dernier PRT calculé' dans la fiche tarif de l'article

    END;

    /* 
        Met à jour le prix de revient ou le prix standard dans la fiche article et dans 
        la fiche fournisseur pour l'article en question.
    */
    procedure ModifierPR(PrixAMAJ: Text[3]; NoArticle: Code[20]; NoFournisseur: Code[20]; PR: Decimal)
    begin
        IF NOT Article.GET(NoArticle) THEN
            ERROR('L''article n°%1 n''existe pas. Le prix de revient n''a pas été mis à jour', NoArticle);

        Article.VALIDATE("Standard Cost", PR);
        Article.MODIFY();

        FournArt.SETRANGE("Item No.", NoArticle);
        FournArt.SETRANGE("Vendor No.", NoFournisseur);
        IF NOT FournArt.FIND('-') THEN
            ERROR('L''article n°%1 n''existe pas dans le catalogue du fournissseur %2. Le prix de revient n''a pas été mis à jour',
                    NoArticle, NoFournisseur);
        IF PrixAMAJ = 'PRT' THEN
            FournArt.VALIDATE(PRT, PR)
        ELSE
            FournArt.VALIDATE(PRR, PR);
        FournArt.MODIFY();
    end;

    /* 
        calcule le montant total affecté d'une prestation pour les dossiers liés à une prestation d'arrivage. 
        Elle utilise des calculs au prorata selon le type de prestation (par exemple, frais de transport).
    */
    var
        ConfirmErr: Label 'Voulez-vous mettre à jour tous les montants affectés des dossiers associés à la prestation %1 ?', Locked = true;

    procedure CalculerMntPrestDossier()
    begin
        PrestDossier.SETRANGE("No. prestation", PrestDossier."No. prestation");
        IF NOT CONFIRM(STRSUBSTNO(ConfirmErr, PrestDossier."No. prestation")) THEN
            EXIT;

        IF NOT Prest.GET(PrestDossier."No. prestation") THEN
            ERROR('La prestation n°%1 n''a pas été trouvée', PrestDossier."No. prestation");

        Prest.CALCFIELDS("Mnt total lig doss affectées", "Vol total lig doss affectées");

        IF PrestDossier.FIND('-') THEN
            REPEAT
                PrestDossier.CALCFIELDS("Mnt total lignes affectées", "Vol total lignes affect");
                IF PrestDossier.Type <> PrestDossier.Type::"Frais de transport" THEN BEGIN
                    IF Prest."Mnt total lig doss affectées" <> 0 THEN
                        PrestDossier."Montant affecté" := ROUND(PrestDossier."Mnt total lignes affectées" * Prest.Montant
                                                                / Prest."Mnt total lig doss affectées", 0.01, '=')
                    ELSE
                        PrestDossier."Montant affecté" := 0;
                END ELSE
                    // SI C'EST UNE PRESTATION DE TYPE TRANSPORT ON CALCULE AU PRORATA DU VOLUME DE LA LIGNE
                    IF Prest."Vol total lig doss affectées" <> 0 THEN
                        PrestDossier."Montant affecté" := ROUND(PrestDossier."Vol total lignes affect" * Prest.Montant
                                                                / Prest."Vol total lig doss affectées", 0.01, '=')
                    ELSE
                        PrestDossier."Montant affecté" := 0;

                PrestDossier.MODIFY();
            UNTIL PrestDossier.NEXT() = 0;

        // Pour compenser l'arrondi on met le reste sur la dernière ligne
        Prest.CALCFIELDS("Mnt affecté total (doss)");
        IF Prest."Mnt affecté total (doss)" <> Prest.Montant THEN BEGIN
            PrestDossier."Montant affecté" := PrestDossier."Montant affecté" +
                                            (Prest.Montant - Prest."Mnt affecté total (doss)");
            PrestDossier.MODIFY();
        END;

        IF CONFIRM(StrSubstNo('Attention : la base de calcul du montant affecté de chaque ligne de dossier a changé. \' +
                    'Voulez-vous recalculer également les montants affectés des lignes de dossier ' +
                    'associées à la prestation %1 ?', PrestDossier."No. prestation")) THEN
            CalcMntPrestLigDosViaPrestDoss(PrestDossier, FALSE);

    end;

    /* 
        Cette procédure calcule les montants affectés des lignes d'un dossier pour une prestation particulière.
    */
    procedure CalculerMntPrestLigneDossier(PrestDossier: Record "PrestationDossierArrivage"; DemanderConfirm: Boolean)
    begin
        IF DemanderConfirm THEN
            IF NOT CONFIRM(STRSUBSTNO('Voulez-vous mettre à jour les montants affectés des lignes du dossier %1 \' +
                                        'associées à la prestation %2 ?',
                                        PrestDossier."No. dossier", PrestDossier."No. prestation")) THEN
                EXIT;

        PrestLigneDossier.SETRANGE("No. dossier", PrestDossier."No. dossier");
        PrestLigneDossier.SETRANGE("No. prestation", PrestDossier."No. prestation");

        // CALCULE LE MONTANT TOTAL DU DOSSIER ET SON VOLUME TOTAL
        PrestDossier.CALCFIELDS("Mnt total lignes affectées", "Vol total lignes affect");

        IF PrestLigneDossier.FIND('-') THEN
            REPEAT
                IF PrestDossier.Type <> PrestDossier.Type::"Frais de transport" THEN BEGIN
                    // SI CE N'EST PAS UNE PRESTATION DE TYPE TRANSPORT ON CALCULE AU PRORATA DU MONTANT DE LA LIGNE
                    IF (PrestDossier."Mnt total lignes affectées" <> 0) AND (PrestLigneDossier.Affectation) THEN
                        PrestLigneDossier."Montant affecté" := ROUND(PrestDossier."Montant affecté" * PrestLigneDossier."Montant ligne (dev soc)" /
                                                                    PrestDossier."Mnt total lignes affectées", 0.01, '=')
                    ELSE
                        PrestLigneDossier."Montant affecté" := 0;
                END ELSE
                    // SI C'EST UNE PRESTATION DE TYPE TRANSPORT ON CALCULE AU PRORATA DU VOLUME DE LA LIGNE
                    IF (PrestDossier."Vol total lignes affect" <> 0) AND (PrestLigneDossier.Affectation) THEN
                        PrestLigneDossier."Montant affecté" := ROUND(PrestDossier."Montant affecté" * PrestLigneDossier."Volume ligne" /
                                                                    PrestDossier."Vol total lignes affect", 0.01, '=')
                    ELSE
                        PrestLigneDossier."Montant affecté" := 0;

                PrestLigneDossier.MODIFY();
            UNTIL PrestLigneDossier.NEXT() = 0;

        // Pour compenser l'arrondi on met le reste sur la dernière ligne
        PrestDossier.CALCFIELDS("Mnt affecté total lig affect");
        IF PrestDossier."Mnt affecté total lig affect" <> PrestDossier."Montant affecté" THEN BEGIN
            PrestLigneDossier."Montant affecté" := PrestLigneDossier."Montant affecté" +
                                            (PrestDossier."Montant affecté" - PrestDossier."Mnt affecté total lig affect");
            PrestLigneDossier.MODIFY();
        END;

    end;

    /* 
        Calcule les montants affectés des lignes d'un dossier pour un avis particulier.
    */
    procedure CalcMntAvisLigDosViaAvisDoss(AvisDossier: Record "AvisDossierArrivage"; DemanderConfirm: Boolean)
    begin
        AvisDossier.SETRANGE("Code credoc", AvisDossier."Code credoc");
        AvisDossier.SETRANGE("No. ligne avis", AvisDossier."No. ligne avis");
        IF DemanderConfirm THEN
            IF NOT CONFIRM(STRSUBSTNO('Voulez-vous mettre à jour les montants affectés des lignes de dossier ' +
                                        'associées à l''avis n° %1 du Credoc n° %2 ?',
                                        AvisDossier."No. ligne avis", AvisDossier."Code credoc")) THEN
                EXIT;

        IF AvisDossier.FIND('-') THEN
            REPEAT
                IF Dossier.GET(AvisDossier."No. dossier") THEN
                    IF Dossier.Etat <> Dossier.Etat::Clôturé THEN
                        CalculerMntAvisLigneDossier(AvisDossier, FALSE);
            UNTIL AvisDossier.NEXT = 0;

    end;

    /* 
        Calcule les montants affectés des lignes d'un dossier pour un dossier particulier.
    */
    procedure CalculerMntAvisDossier(AvisDossier: Record "AvisDossierArrivage")
    begin
        AvisDossier.SETRANGE("Code credoc", AvisDossier."Code credoc");
        AvisDossier.SETRANGE("No. ligne avis", AvisDossier."No. ligne avis");
        IF NOT CONFIRM(STRSUBSTNO('Voulez-vous mettre à jour tous les montants affectés des dossiers associés ' +
                                'à l''avis n° %1 du Credoc n° %2 ?', AvisDossier."No. ligne avis", AvisDossier."Code credoc")) THEN
            EXIT;

        IF NOT Avis.GET(AvisDossier."Code credoc", AvisDossier."No. ligne avis") THEN
            ERROR('L''avis n° %1 du Credoc n° %2 n''a pas été trouvée', AvisDossier."No. ligne avis", AvisDossier."Code credoc");

        Avis.CALCFIELDS("Mnt total lig doss affectées", "Vol total lig doss affectées");

        IF AvisDossier.FIND('-') THEN
            REPEAT
                AvisDossier.CALCFIELDS("Mnt total lignes affectées", "Vol total lignes affectées");
                IF Avis."Mnt total lig doss affectées" <> 0 THEN
                    AvisDossier."Montant affecté" := ROUND(AvisDossier."Mnt total lignes affectées" * Avis.Montant
                                                            / Avis."Mnt total lig doss affectées", 0.01, '=')
                ELSE
                    AvisDossier."Montant affecté" := 0;
                AvisDossier.MODIFY();
            UNTIL AvisDossier.NEXT() = 0;

        // Pour compenser l'arrondi on met le reste sur la dernière ligne
        Avis.CALCFIELDS("Mnt affecté total (doss)");
        IF Avis."Mnt affecté total (doss)" <> Avis.Montant THEN BEGIN
            AvisDossier."Montant affecté" := AvisDossier."Montant affecté" +
                                            (Avis.Montant - Avis."Mnt affecté total (doss)");
            AvisDossier.MODIFY();
        END;

        IF CONFIRM(STRSUBSTNO('Attention : la base de calcul du montant affecté de chaque ligne de dossier a changé. \' +
                    'Voulez-vous recalculer également les montants affectés des lignes de dossier ' +
                    'associées à l''avis n° %1 du Credoc n° %2 ?', AvisDossier."No. ligne avis", AvisDossier."Code credoc")) THEN
            CalcMntAvisLigDosViaAvisDoss(AvisDossier, FALSE);

    end;

    /* 
        Calcule les montants affectés des lignes d'un dossier pour un dossier particulier.
    */
    procedure CalculerMntAvisLigneDossier(AvisDossier: Record "AvisDossierArrivage"; DemanderConfirm: Boolean)
    begin
        IF DemanderConfirm THEN
            IF NOT CONFIRM(STRSUBSTNO('Voulez-vous mettre à jour les montants affectés des lignes du dossier %1 ' +
                                        'associées à l''avis n° %2 du Credoc n° %3 ?',
                                        AvisDossier."No. dossier", AvisDossier."No. ligne avis", AvisDossier."Code credoc")) THEN
                EXIT;

        AvisLigneDossier.SETRANGE("No. dossier", AvisDossier."No. dossier");
        AvisLigneDossier.SETRANGE("Code credoc", AvisDossier."Code credoc");
        AvisLigneDossier.SETRANGE("No. ligne avis", AvisDossier."No. ligne avis");

        // CALCULE LE MONTANT TOTAL DU DOSSIER ET SON VOLUME TOTAL
        AvisDossier.CALCFIELDS("Mnt total lignes affectées", "Vol total lignes affectées");

        IF AvisLigneDossier.FIND('-') THEN
            REPEAT
                IF (AvisDossier."Mnt total lignes affectées" <> 0) AND (AvisLigneDossier.Affectation) THEN
                    AvisLigneDossier."Montant affecté" := ROUND(AvisDossier."Montant affecté" * AvisLigneDossier."Montant ligne (dev soc)" /
                                                                AvisDossier."Mnt total lignes affectées", 0.01, '=')
                ELSE
                    AvisLigneDossier."Montant affecté" := 0;
                AvisLigneDossier.MODIFY();
            UNTIL AvisLigneDossier.NEXT() = 0;

        // Pour compenser l'arrondi on met le reste sur la dernière ligne
        AvisDossier.CALCFIELDS("Mnt affecté total lig affect");
        IF AvisDossier."Mnt affecté total lig affect" <> AvisDossier."Montant affecté" THEN BEGIN
            AvisLigneDossier."Montant affecté" := AvisLigneDossier."Montant affecté" +
                                                (AvisDossier."Montant affecté" - AvisDossier."Mnt affecté total lig affect");
            AvisLigneDossier.MODIFY();
        END;

    end;

    /* 
        Calcule les montants affectés aux lignes d'un dossier en fonction des prestations 
        associées à un dossier particulier.
    */
    procedure CalcMntPrestLigDosViaPrestDoss(PrestDossier: Record "PrestationDossierArrivage"; DemanderConfirm: Boolean)
    begin
        PrestDossier.SETRANGE("No. prestation", PrestDossier."No. prestation");

        IF DemanderConfirm THEN
            IF NOT CONFIRM(STRSUBSTNO('Voulez-vous mettre à jour les montants affectés des lignes de dossier ' +
                                        'associées à la prestation n° %1 ?', PrestDossier."No. prestation")) THEN
                EXIT;

        IF PrestDossier.FIND('-') THEN
            REPEAT
                IF Dossier.GET(PrestDossier."No. dossier") THEN
                    IF Dossier.Etat <> Dossier.Etat::Clôturé THEN
                        CalculerMntPrestLigneDossier(PrestDossier, FALSE);
            UNTIL PrestDossier.NEXT() = 0;
    end;

    /* 
        Calcule le Prix de Revient Réel (PRR) pour un article en fonction des prestations 
        et des avis affectés à un dossier d'arrivage.
    */
    procedure CalculerPRRViaDossier(DossierArrivage: Record "DossierArrivage"; Definitif: Boolean)
    begin
        // On part du dossier.
        // Pour chaque ligne de ce dossier, on additionne les prestations et les avis
        // auxquels elle est affectée.

        //* NSC2.16 PN 18/02/2000 Initialisation

        LigneDossier.RESET();
        HistoPRR.RESET();
        AvisLigneDossier.RESET();
        Avis.RESET();
        PrestLigneDossier.RESET();
        Prest.RESET();
        //* FIN NSC2.16 PN 18/02/2000 Initialisation

        //*NSC1.11
        ErreurPasDAvis := TRUE;
        //*FIN NSC1.11

        LigneDossier.SETRANGE("No. dossier", DossierArrivage."No. dossier");
        IF NOT LigneDossier.FIND('-') THEN
            EXIT;

        IF HistoPRR.FIND('+') THEN
            DernierNoCalcul := HistoPRR."No. calcul"
        ELSE
            DernierNoCalcul := 0;

        //* PN NSC2.15 17/2/2000 initialisation volume dossier
        VolumeDossier := 0;
        //* FIN PN NSC2.15
        REPEAT
            VolumeDossier := VolumeDossier + LigneDossier.Volume;
        UNTIL LigneDossier.NEXT() = 0;

        LigneDossier.FIND('-');
        REPEAT
            // PR = (Montant + somme des montants affectés des prestations + sommes des montants affectés des avis) / Qté pièce
            IF LigneDossier."Quantité (piece)" <> 0 THEN BEGIN
                IF NOT HistoPRR.GET(DernierNoCalcul + 1, LigneDossier."No. article") THEN
                    Mode := Mode::Insertion
                ELSE
                    Mode := Mode::Modification;

                IF Mode = Mode::Insertion THEN BEGIN
                    HistoPRR.INIT();
                    HistoPRR."No. calcul" := DernierNoCalcul + 1;
                    HistoPRR."No. article" := LigneDossier."No. article";
                    HistoPRR.Date := WORKDATE();
                    HistoPRR.Heure := TIME;
                    HistoPRR."Volume dossier" := VolumeDossier;
                    HistoPRR."No. fournisseur" := LigneDossier."No. preneur d'ordre";
                    HistoPRR."No. dossier" := LigneDossier."No. dossier";
                    IF Definitif THEN
                        HistoPRR.Définitif := TRUE;


                    //NSC1.14
                    Dossier.GET(LigneDossier."No. dossier");
                    HistoPRR."Date creation Dossier" := Dossier."Date d'ouverture";

                    //*NSC1.11 :Il faut rechercher le Code devise (et son taux) lié au dernier avis de l'article
                    AvisLigneDossierArrivage.RESET();
                    AvisLigneDossierArrivage.ASCENDING(TRUE);
                    AvisLigneDossierArrivage.SETRANGE("No. dossier", LigneDossier."No. dossier");
                    AvisLigneDossierArrivage.SETRANGE("No. ligne dossier", LigneDossier."No. ligne");
                    AvisLigneDossierArrivage.SETRANGE(Type, AvisLigneDossier.Type::Marchandise);
                    //* REV1.34 CC 14/06/06 : ajout filtre : Affectation=TRUE
                    AvisLigneDossierArrivage.SETRANGE(Affectation, TRUE);
                    //* REV1.34 CC 14/06/06 : ajout filtre : Affectation=TRUE
                    IF AvisLigneDossierArrivage.FIND('+') THEN
                        IF Avis2.GET(AvisLigneDossierArrivage."Code credoc", AvisLigneDossierArrivage."No. ligne avis") THEN BEGIN
                            HistoPRR."Code devise" := Avis2."Code devise";
                            HistoPRR."Facteur devise" := Avis2."Facteur devise";
                            HistoPRR."Code credoc Avis source" := Avis2."Code credoc";
                            HistoPRR."No. ligne Avis source" := Avis2."No. ligne";
                            ErreurPasDAvis := FALSE;
                        END;

                    //*FIN NSC1.11 :Il faut recherche le Code devise (et son taux) lié au dernier avis de l'article

                END;

                IF STRPOS(HistoPRR."No. réception", FORMAT(LigneDossier."No. réception")) = 0 THEN
                    HistoPRR."No. réception" := COPYSTR(HistoPRR."No. réception" + FORMAT(LigneDossier."No. réception") + ' ', 1, 250);

                IF STRPOS(HistoPRR."No. ligne dossier", FORMAT(LigneDossier."No. ligne")) = 0 THEN
                    HistoPRR."No. ligne dossier" := COPYSTR(HistoPRR."No. ligne dossier" + FORMAT(LigneDossier."No. ligne") + ' ', 1, 250);

                AvisLigneDossier.SETRANGE("No. dossier", LigneDossier."No. dossier");
                AvisLigneDossier.SETRANGE("No. ligne dossier", LigneDossier."No. ligne");
                IF AvisLigneDossier.FIND('-') THEN
                    REPEAT
                        AvisLigneDossier.CALCFIELDS(Prévisionnel);
                        IF AvisLigneDossier.Prévisionnel THEN
                            IF STRPOS(HistoPRR."Eléments estimés", RetournerAbreviationTypeAvis(AvisLigneDossier)) = 0 THEN
                                HistoPRR."Eléments estimés" := HistoPRR."Eléments estimés" + RetournerAbreviationTypeAvis(AvisLigneDossier) + ' ';
                        IF Avis.GET(AvisLigneDossier."Code credoc", AvisLigneDossier."No. ligne avis") THEN
                            IF NOT (Avis.Type IN [Avis.Type::"Avoir qualité", Avis.Type::Escompte]) THEN BEGIN
                                IF Avis."Facteur devise" = 0 THEN
                                    HistoPRR."Mnt affecté total / avis" := HistoPRR."Mnt affecté total / avis" + AvisLigneDossier."Montant affecté"
                                ELSE
                                    HistoPRR."Mnt affecté total / avis" := HistoPRR."Mnt affecté total / avis" +
                                                                            AvisLigneDossier."Montant affecté" / Avis."Facteur devise";
                            END ELSE BEGIN
                                IF Avis."Facteur devise" = 0 THEN
                                    HistoPRR."Mnt affecté total déduction" := HistoPRR."Mnt affecté total déduction" +
                                                                                AvisLigneDossier."Montant affecté"
                                ELSE
                                    HistoPRR."Mnt affecté total déduction" := HistoPRR."Mnt affecté total déduction" +
                                                                            AvisLigneDossier."Montant affecté" / Avis."Facteur devise";
                                IF Avis.Type = Avis.Type::"Avoir qualité" THEN
                                    HistoPRR."% avoir qualité" := Avis."%"
                                ELSE
                                    HistoPRR."% escompte" := Avis."%";
                            END;


                    UNTIL AvisLigneDossier.NEXT() = 0;

                PrestLigneDossier.SETRANGE("No. dossier", LigneDossier."No. dossier");
                PrestLigneDossier.SETRANGE("No. ligne dossier", LigneDossier."No. ligne");
                IF PrestLigneDossier.FIND('-') THEN
                    REPEAT
                        PrestLigneDossier.CALCFIELDS(Prévisionnel);
                        IF PrestLigneDossier.Prévisionnel THEN
                            IF STRPOS(HistoPRR."Eléments estimés", RetournerAbreviationTypePrest(PrestLigneDossier)) = 0 THEN
                                HistoPRR."Eléments estimés" := HistoPRR."Eléments estimés" +
                                                                        RetournerAbreviationTypePrest(PrestLigneDossier) + ' ';
                        IF Prest.GET(PrestLigneDossier."No. prestation") THEN
                            IF Prest."Facteur devise" = 0 THEN
                                HistoPRR."Mnt affecté total / prest" := HistoPRR."Mnt affecté total / prest" +
                                                                        PrestLigneDossier."Montant affecté"
                            ELSE
                                HistoPRR."Mnt affecté total / prest" := HistoPRR."Mnt affecté total / prest" +
                                                                        PrestLigneDossier."Montant affecté" / Prest."Facteur devise";

                    UNTIL PrestLigneDossier.NEXT() = 0;

                //*NSC1.11 :suite à modification sur Code devise
                HistoPRR.Montant := HistoPRR.Montant + LigneDossier.Montant;
                IF HistoPRR."Facteur devise" <> 0 THEN
                    HistoPRR."Montant (dev soc)" := HistoPRR."Montant (dev soc)" + (LigneDossier.Montant / HistoPRR."Facteur devise")
                ELSE
                    HistoPRR."Montant (dev soc)" := HistoPRR."Montant (dev soc)" + LigneDossier.Montant;
                //*FIN NSC1.11 :suite à modification sur Code devise

                HistoPRR.Volume := HistoPRR.Volume + LigneDossier.Volume;

                HistoPRR."% remise moyen" := ((HistoPRR.Quantité * HistoPRR."% remise moyen") +
                                            (LigneDossier."Quantité (piece)" * LigneDossier."% remise ligne")) /
                                            (HistoPRR.Quantité + LigneDossier."Quantité (piece)");


                // attention, à ne pas mettre avant le calcul de remise moyenne ni après celui du Prix d'achat
                HistoPRR.Quantité := HistoPRR.Quantité + LigneDossier."Quantité (piece)";

                HistoPRR."Prix achat (dev soc)" := HistoPRR."Montant (dev soc)" / HistoPRR.Quantité;

                //* NSC1.14
                //* ajout du prix d'achat en devise d'achat , remise non déduite, issue de al commande d'achat
                //* REV1.31 : changement du calcul de "Cout unitaire direct"
                //* HistoPRR."Cout unitaire direct" := HistoPRR."Cout unitaire direct" + LigneDossier."Coût unitaire direct";
                HistoPRR."Cout unitaire direct" := LigneDossier."Cout unitaire direct";
                //* Fin REV1.31

                IF ErreurPasDAvis = FALSE THEN BEGIN//*NSC1.11

                    IF Mode = Mode::Insertion THEN
                        HistoPRR.INSERT()
                    ELSE
                        HistoPRR.MODIFY();

                    CalculerPRR(HistoPRR);

                END ELSE
                    LigneDossier.FIND('+');//*FIN :NSC1.11

            END;
        UNTIL LigneDossier.NEXT() = 0;

    end;

    /* 
        Renvoie l'abréviation du type d'avis (marchandise, financier, avoir qualité, escompte, etc.).
    */
    procedure RetournerAbreviationTypeAvis(AvisLigneDossier: Record "AvisLigneDossier") Abreviation: Text[1]
    begin
        CASE AvisLigneDossier.Type OF
            AvisLigneDossier.Type::Marchandise:
                Abreviation := 'P';
            AvisLigneDossier.Type::Financier:
                Abreviation := 'F';
            AvisLigneDossier.Type::"Avoir qualité":
                Abreviation := 'Q';
            AvisLigneDossier.Type::Escompte:
                Abreviation := 'E';
            ELSE
                Abreviation := 'A';
        END;
    end;

    /* 
        Renvoie l'abréviation du type de prestation (transport, frais financiers, assurances, etc.)
    */
    procedure RetournerAbreviationTypePrest(PrestLigneDossier: Record "PrestationLigneDossier") Abreviation: Text[1]
    begin
        CASE PrestLigneDossier.Type OF
            PrestLigneDossier.Type::"Frais de transport":
                Abreviation := 'T';
            PrestLigneDossier.Type::"Frais financiers":
                Abreviation := 'F';
            PrestLigneDossier.Type::Assurances:
                Abreviation := 'A';
            PrestLigneDossier.Type::Commissions:
                Abreviation := 'C';
            PrestLigneDossier.Type::Transit:
                Abreviation := 'R';
            PrestLigneDossier.Type::Douane:
                Abreviation := 'D';
        END;
    end;

    /* 
        CalculerPRR : Calcule le Prix de Revient Réel (PRR) pour un article en prenant en compte 
        les montants affectés des avis et des prestations pour un dossier d'arrivage.
    */
    procedure CalculerPRR(var HistoPRRParam: Record "HistoriquePRRTable")
    var
        HistoPRR2: Record "HistoriquePRRTable";
        PRR: Decimal;
    begin

        // Calcul PRT
        //* NSC2.01
        //*
        //*PRR := "Prix achat (dev soc)" +
        //*       ("Mnt affecté total / avis" +
        //*       "Mnt affecté total / prest") / HistoPRR.Quantité;

        PRR := (HistoPRRParam."Mnt affecté total / avis" + HistoPRRParam."Mnt affecté total / prest") / HistoPRR.Quantité;

        HistoPRRParam.MODIFY();

        // NSC1.14
        // on calcul le PRR même si le dossier d'arrivage n'est pas cloturé
        //IF HistoPRR.Définitif THEN

        HistoPRR2.RESET();
        HistoPRR2.SETRANGE("No. article", HistoPRR."No. article");
        HistoPRR2.SETFILTER("Date creation Dossier", '>%1', HistoPRR."Date creation Dossier");

        IF NOT HistoPRR2.Find('-') THEN
            ModifierPR('PRR', HistoPRR."No. article", HistoPRR."No. fournisseur", PRR);
    END;

    /* 
        MAJFicheTarif : MAJ du champ 'dernier PRT calculé' dans la fiche tarif de l'article
    */
    procedure MAJFicheTarif(PRTCalcule: Decimal; CodeArticle: Code[20])
    begin
        //* NSC1.12 :Fonction de MAJ du champ 'dernier PRT calculé' dans la fiche tarif de l'article
        PrixArticle.RESET();
        PrixArticle.SETRANGE("Item No.", CodeArticle);

        IF PrixArticle.FIND('-') THEN
            REPEAT
                PrixArticle.VALIDATE("Dernier PRT (dev soc)", PRTCalcule);
                PrixArticle.MODIFY();
            UNTIL PrixArticle.NEXT() = 0;
        //*FIN NSC1.12 :Fonction de MAJ du champ 'dernier PRT calculé' dans la fiche tarif de l'article
    end;

}