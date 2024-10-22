table 50255 "LigneDossierArrivage"
{
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "No. dossier"; Code[10])
        {
            DataClassification = AccountData;
            Caption = 'N° Dossier';
            Description = 'LIGNE_DOSSIER_ARRIVAGE LN 23/09/24 REV24';
            Editable = false;
            TableRelation = "DossierArrivage"."No. Dossier";
            AutoFormatType = 0;
        }
        field(2; "No. ligne"; Integer)
        {
            DataClassification = AccountData;
            Caption = 'N° Ligne';
            Description = 'LIGNE_DOSSIER_ARRIVAGE LN 23/09/24 REV24';
            Editable = false;
            BlankNumbers = DontBlank;
        }
        field(3; "No. preneur d'ordre"; Code[20])
        {
            DataClassification = CustomerContent;
            Caption = 'N° preneur d''ordre';
            Description = 'LIGNE_DOSSIER_ARRIVAGE LN 23/09/24 REV24';
            TableRelation = "Vendor"."No.";
            Editable = false;
        }
        field(4; "No. réception"; Code[20])
        {
            DataClassification = AccountData;
            Caption = 'N° Recept.';
            Description = 'LIGNE_DOSSIER_ARRIVAGE LN 23/09/24 REV24';
            Editable = false;
            TableRelation = "Purch. Rcpt. Header"."No." where("No." = field("No. réception"));
        }
        field(5; "No. ligne réception"; Integer)
        {
            DataClassification = AccountData;
            Caption = 'N° Ligne Recept.';
            Description = 'LIGNE_DOSSIER_ARRIVAGE LN 23/09/24 REV24';
            Editable = false;
            BlankNumbers = DontBlank;
            TableRelation = "Purch. Rcpt. Line"."Line No." where("Document No." = field("No. réception"));
        }
        field(6; "No. article"; Code[20])
        {
            DataClassification = CustomerContent;
            Caption = 'N° Article';
            Description = 'LIGNE_DOSSIER_ARRIVAGE LN 23/09/24 REV24';
            TableRelation = "Item"."No.";
            Editable = false;
        }
        field(7; "Code magasin"; Code[10])
        {
            DataClassification = AccountData;
            Caption = 'Code Magasin';
            Description = 'LIGNE_DOSSIER_ARRIVAGE LN 23/09/24 REV24';
            Editable = false;
            TableRelation = "Location"."Code";
        }
        field(8; "Désignation"; Text[50])
        {
            DataClassification = CustomerContent;
            Caption = 'Désignation';
            Description = 'LIGNE_DOSSIER_ARRIVAGE LN 23/09/24 REV24';
            Editable = false;
        }
        field(9; "Désignation 2"; Text[50])
        {
            DataClassification = CustomerContent;
            Caption = 'Désignation 2';
            Description = 'LIGNE_DOSSIER_ARRIVAGE LN 23/09/24 REV24';
            Editable = false;
        }
        field(10; "Quantité"; Decimal)
        {
            DataClassification = AccountData;
            Caption = 'Quantité';
            Description = 'LIGNE_DOSSIER_ARRIVAGE LN 23/09/24 REV24';
            Editable = true;
            DecimalPlaces = 0 : 5;
            BlankNumbers = DontBlank;

            trigger OnValidate()
            begin
                //*NSC1.10
                IF Quantité <> xRec.Quantité THEN BEGIN
                    IF Quantité > xRec.Quantité THEN
                        ERROR('La nouvelle quantité doit être inférieure à l''ancienne')
                    ELSE
                        IF CondProduit.GET("No. article", "Conditionnement produit") THEN
                            "Quantité (piece)" := Quantité * CondProduit."Quantité Conditionnement"
                        ELSE
                            "Quantité (piece)" := Quantité * "Quantité par unité";
                    CU := xRec.Montant / xRec."Quantité (piece)";
                    CUDevSoc := xRec."Montant (dev soc)" / xRec."Quantité (piece)";
                    Montant := CU * "Quantité (piece)";
                    "Montant (dev soc)" := CUDevSoc * "Quantité (piece)";
                    VALIDATE(Volume);
                    MODIFY();
                    COMMIT();
                    MAJStock(Rec, xRec, 1);
                END;
                //*FIN :NSC1.10
            end;
        }
        field(11; "Cout unitaire direct"; Decimal)
        {
            DataClassification = AccountData;
            Caption = 'Cout unitaire direct';
            Description = 'LIGNE_DOSSIER_ARRIVAGE LN 23/09/24 REV24';
            Editable = true;
            BlankNumbers = DontBlank;
            AutoFormatType = 2;

            trigger OnValidate()
            begin
                //*NSC2.14
                MAJLigne();
                //*Fin NSC2.14
            end;
        }
        field(12; "Cout unitaire (dev soc)"; Decimal)
        {
            DataClassification = AccountData;
            Caption = 'Cout unitaire (devise société)';
            Description = 'LIGNE_DOSSIER_ARRIVAGE LN 23/09/24 REV24';
            Editable = false;
            BlankNumbers = DontBlank;
            AutoFormatType = 2;
        }
        field(13; "Montant"; Decimal)
        {
            DataClassification = AccountData;
            Caption = 'Montant';
            Description = 'LIGNE_DOSSIER_ARRIVAGE LN 23/09/24 REV24';
            Editable = false;
            BlankNumbers = DontBlank;
            AutoFormatType = 1;
        }
        field(14; "Prix unitaire (dev soc)"; Decimal)
        {
            DataClassification = AccountData;
            Caption = 'Prix unitaire (devise spéciale)';
            Description = 'LIGNE_DOSSIER_ARRIVAGE LN 23/09/24 REV24';
            Editable = false;
            BlankNumbers = DontBlank;
            AutoFormatType = 2;
        }
        field(15; "Référence fournisseur"; Text[30])
        {
            DataClassification = CustomerContent;
            Caption = 'Référence fournisseur';
            Description = 'LIGNE_DOSSIER_ARRIVAGE LN 23/09/24 REV24';
            Editable = false;
        }
        field(17; "Cout unitaire"; Decimal)
        {
            DataClassification = AccountData;
            Caption = 'Cout unitaire';
            Description = 'LIGNE_DOSSIER_ARRIVAGE LN 23/09/24 REV24';
            Editable = false;
            BlankNumbers = DontBlank;
            AutoFormatType = 2;
        }
        field(18; "Conditionnement produit"; Code[10])
        {
            DataClassification = CustomerContent;
            Caption = 'Conditionnement produit';
            Description = 'LIGNE_DOSSIER_ARRIVAGE LN 23/09/24 REV24';
            Editable = true;
            TableRelation = "Item Variant".Code where("Item No." = field("No. article"), Choix = filter('Achat | Achats/Ventes'));

            trigger OnValidate()
            begin
                //*NSC1.10
                IF "Conditionnement produit" <> xRec."Conditionnement produit" THEN BEGIN
                    IF CondProduit.GET("No. article", "Conditionnement produit") THEN BEGIN
                        "Quantité (piece)" := Quantité * CondProduit."Quantité Conditionnement";
                        "Quantité par unité" := CondProduit."Quantité Conditionnement";
                    END ELSE
                        "Quantité (piece)" := Quantité * "Quantité par unité";
                    CU := xRec.Montant / xRec."Quantité (piece)";
                    CUDevSoc := xRec."Montant (dev soc)" / xRec."Quantité (piece)";
                    Montant := CU * "Quantité (piece)";
                    "Montant (dev soc)" := CUDevSoc * "Quantité (piece)";
                    VALIDATE(Volume);
                    MODIFY();
                    COMMIT();
                    MAJStock(Rec, xRec, 1);
                END;
                //*FIN :NSC1.10
            end;
        }
        field(19; "Quantité (piece)"; Decimal)
        {
            DataClassification = AccountData;
            Caption = 'Quantité (piece)';
            Description = 'LIGNE_DOSSIER_ARRIVAGE LN 23/09/24 REV24';
            Editable = false;
            BlankNumbers = DontBlank;
            DecimalPlaces = 0 : 5;
        }
        field(20; "Cout unitaire (piece)"; Decimal)
        {
            DataClassification = AccountData;
            Caption = 'Cout unitaire (piece)';
            Description = 'LIGNE_DOSSIER_ARRIVAGE LN 23/09/24 REV24';
            Editable = false;
            BlankNumbers = DontBlank;
        }
        field(21; "Montant (dev soc)"; Decimal)
        {
            DataClassification = AccountData;
            Caption = 'Montant (devise spéciale)';
            Description = 'Montant * facteur devise (si <> 0) - - LIGNE_DOSSIER_ARRIVAGE LN 23/09/24 REV24';
            Editable = false;
            BlankNumbers = DontBlank;
        }
        field(22; "Volume"; Decimal)
        {
            DataClassification = AccountData;
            Caption = 'Volume';
            Description = 'soit volume PCB * Qté, si pas de PCB Volume article * Qté (pièce) - - LIGNE_DOSSIER_ARRIVAGE LN 23/09/24 REV24';
            Editable = true;
            BlankNumbers = DontBlank;

            trigger OnValidate()
            begin
                //*NSC1.10
                IF "Conditionnement produit" <> '' THEN BEGIN
                    CondProduit.GET("No. article", "Conditionnement produit");
                    Volume := CondProduit.Volume * Quantité;
                END ELSE BEGIN
                    Articles.GET("No. article");
                    Volume := Articles."Unit Volume" * "Quantité (piece)";
                END;
                //*FIN :NSC1.10

                //* NSC2.21 : MAJ du volume
                /*{IF xRec.Volume <> 0 THEN BEGIN

                    Volume := xRec.Volume / xRec."Quantité (pièce)" * "Quantité (pièce)";

                END;}*/
                //*Fin NSC2.21 : MAJ du volume
            end;
        }
        field(23; "% Remise ligne"; Decimal)
        {
            DataClassification = AccountData;
            Caption = '% Remise ligne';
            Description = 'LIGNE_DOSSIER_ARRIVAGE LN 23/09/24 REV24';
            Editable = true;
            BlankNumbers = DontBlank;
            MinValue = 0;
            MaxValue = 100;

            trigger OnValidate()
            begin
                //*NSC2.14
                MAJLigne();
                //*Fin NSC2.14
            end;
        }
        field(24; "No. commande"; Code[20])
        {
            DataClassification = CustomerContent;
            Caption = 'No. commande';
            Description = 'LIGNE_DOSSIER_ARRIVAGE LN 23/09/24 REV24';
            Editable = false;
        }
        field(25; "Quantité par unité"; Decimal)
        {
            DataClassification = AccountData;
            Caption = 'Quantité par unité';
            Description = 'LIGNE_DOSSIER_ARRIVAGE LN 23/09/24 REV24';
            Editable = false;
            BlankNumbers = DontBlank;
        }
        field(26; "Code devise"; Code[10])
        {
            DataClassification = CustomerContent;
            Caption = 'Code devise';
            Description = 'LIGNE_DOSSIER_ARRIVAGE LN 23/09/24 REV24';
            Editable = false;
            TableRelation = "Currency"."Code";
        }
        field(27; "Facteur devise"; Decimal)
        {
            DataClassification = CustomerContent;
            Caption = 'Facteur devise';
            Description = 'LIGNE_DOSSIER_ARRIVAGE LN 23/09/24 REV24';
            Editable = false;
            BlankNumbers = DontBlank;
            DecimalPlaces = 1 : 15;
            MinValue = 0;
        }
    }
    keys
    {
        key(PK; "No. dossier", "No. ligne")
        {
            Clustered = true;
            Enabled = true;
            SumIndexFields = "Montant", "Volume", "Montant (dev soc)";
        }
        key(SecondaryKey1; "No. dossier", "No. article")
        {
            Enabled = true;
        }
    }

    fieldgroups
    {
        // Add changes to field groups here
    }

    var
        AvisLigneDossier: Record AvisLigneDossier;
        PrestLigneDossier: Record PrestationLigneDossier;
        CondProduit: Record "Item Variant";
        Articles: Record Item;
        Devise: Record Currency;
        ParamCompta: Record "General Ledger Setup";
        NLigne: Integer;
        CU: Decimal;
        CuDevSoc: Decimal;

    trigger OnInsert()
    begin

    end;

    trigger OnModify()
    begin

    end;

    trigger OnDelete()
    begin

        AvisLigneDossier.SETRANGE("No. dossier", "No. dossier");
        AvisLigneDossier.SETRANGE("No. ligne dossier", "No. ligne");
        PrestLigneDossier.SETRANGE("No. dossier", "No. dossier");
        PrestLigneDossier.SETRANGE("No. ligne dossier", "No. ligne");

        IF (Quantité <> 0) AND ("Quantité (piece)" <> 0) THEN
            MAJStock(Rec, Rec, 0);
    end;

    trigger OnRename()
    begin

    end;

    //TODO: Créer les Pages
    procedure AfficherPrestations()
    begin
        PrestLigneDossier.RESET();
        PrestLigneDossier.SETRANGE("No. dossier", Rec."No. dossier");
        PrestLigneDossier.SETRANGE("No. ligne dossier", Rec."No. ligne");
        //Page.RUNMODAL(Page::"Liste prestations/lig. dossier", PrestLigneDossier);
    end;

    procedure AfficherAvis()
    begin
        AvisLigneDossier.RESET();
        AvisLigneDossier.SETRANGE("No. dossier", "No. dossier");
        AvisLigneDossier.SETRANGE("No. ligne dossier", "No. ligne");
        //Page.RUNMODAL(Page::"Avis / ligne dossier", AvisLigneDossier);
    end;


    procedure MAJStock(Nouveau: Record "Lignedossierarrivage"; Ancien: Record "Lignedossierarrivage"; Mode: Integer)
    var
        LigneFeuilleArticle: Record "Item Journal Line";
        ModeleFeuilleArticle: Record "Item Journal Template";
        NomFeuillesArticle: Record "Item Journal Batch";
        ValiderFeuillesArticle: Codeunit "Item Jnl.-Post Batch";
        GestionNoSouche: Codeunit "No. Series";
        NDoc: Code[20];
    begin
        NDoc := GestionNoSouche.GetNextNo('FSART-GEN', WORKDATE(), FALSE);
        //*FIN NSC1.10 :Recherche du numéro de document

        //*NSC1.10 :création du modèle temporaire
        IF NOT ModeleFeuilleArticle.GET('') THEN BEGIN
            ModeleFeuilleArticle.INIT();
            ModeleFeuilleArticle.Name := '';
            ModeleFeuilleArticle.Description := 'feuille d''ajustement automatique';
            ModeleFeuilleArticle."Test Report ID" := 702;
            ModeleFeuilleArticle."Page ID" := 40;
            ModeleFeuilleArticle."Posting Report ID" := 703;
            ModeleFeuilleArticle.Type := ModeleFeuilleArticle.Type::Item;
            ModeleFeuilleArticle."Source Code" := 'STOCKS';
            ModeleFeuilleArticle."No. Series" := 'FSART-GEN';
            ModeleFeuilleArticle."Test Report Caption" := 'F. article : Impression test';
            ModeleFeuilleArticle."Page Caption" := 'Feuille de saisie articles';
            ModeleFeuilleArticle."Posting Report Caption" := 'Journal écritures articles';
            ModeleFeuilleArticle.INSERT();
        END;
        //*FIN NSC1.10 :création du modèle temporaire

        //*NSC1.10 :création de la feuille de saisie temporaire
        IF NOT NomFeuillesArticle.GET('', '') THEN BEGIN
            NomFeuillesArticle.INIT();
            NomFeuillesArticle."Journal Template Name" := '';
            NomFeuillesArticle.Name := '';
            NomFeuillesArticle.Description := 'feuille d''ajustement automatique';
            NomFeuillesArticle."No. Series" := 'FSART-GEN';
            NomFeuillesArticle.INSERT();
        END;
        //*FIN NSC1.10 :création de la feuille de saisie temporaire

        //*NSC1.10 :remplissage des deux lignes dans la feuille de saisie article
        NLigne := 10000;
        LigneFeuilleArticle.INIT();

        //*NSC2.43 SL 05/10/01 : Mise en commentaire de la ligne suivante
        //*LigneFeuilleArticle.AjouterNouvLig(LigneFeuilleArticle);

        LigneFeuilleArticle.VALIDATE("Document No.", NDoc);
        LigneFeuilleArticle."Line No." := NLigne;
        LigneFeuilleArticle."Posting Date" := WORKDATE();
        LigneFeuilleArticle."Entry Type" := LigneFeuilleArticle."Entry Type"::"Negative Adjmt.";
        LigneFeuilleArticle.VALIDATE("Entry Type");
        LigneFeuilleArticle."Item No." := Ancien."No. article";
        LigneFeuilleArticle.VALIDATE("Item No.");
        LigneFeuilleArticle."Variant Code" := Ancien."Conditionnement produit";
        LigneFeuilleArticle.VALIDATE("Variant Code");

        IF Ancien."Conditionnement produit" = '' THEN
            LigneFeuilleArticle.Quantity := Ancien."Quantité (piece)"
        ELSE
            LigneFeuilleArticle.Quantity := Ancien.Quantité;

        LigneFeuilleArticle.VALIDATE(Quantity);
        LigneFeuilleArticle."No. dossier" := Ancien."No. dossier";
        LigneFeuilleArticle.Description := 'ajustement automatique';
        LigneFeuilleArticle."Location Code" := Ancien."Code magasin";
        LigneFeuilleArticle."Unit Cost" := Ancien."Cout unitaire";
        LigneFeuilleArticle.Amount := Ancien.Montant;
        LigneFeuilleArticle."Qty. per Unit of Measure" := Ancien."Quantité par unité";
        LigneFeuilleArticle.INSERT();

        IF Mode <> 0 THEN BEGIN
            LigneFeuilleArticle.INIT();

            //*NSC2.43 SL 05/10/01 : Mise en commentaire de la ligne suivante
            //LigneFeuilleArticle.AjouterNouvLig(LigneFeuilleArticle);

            LigneFeuilleArticle.VALIDATE("Document No.", NDoc);
            LigneFeuilleArticle."Line No." := NLigne + 10000;
            LigneFeuilleArticle."Posting Date" := WORKDATE();
            LigneFeuilleArticle."Entry Type" := LigneFeuilleArticle."Entry Type"::"Positive Adjmt.";
            LigneFeuilleArticle.VALIDATE("Entry Type");
            LigneFeuilleArticle."Item No." := Nouveau."No. article";
            LigneFeuilleArticle.VALIDATE("Item No.");
            LigneFeuilleArticle."Variant Code" := Nouveau."Conditionnement produit";
            LigneFeuilleArticle.VALIDATE("Variant Code");

            IF Nouveau."Conditionnement produit" = '' THEN
                LigneFeuilleArticle.Quantity := Nouveau."Quantité (piece)"
            ELSE
                LigneFeuilleArticle.Quantity := Nouveau.Quantité;

            LigneFeuilleArticle.VALIDATE(Quantity);
            LigneFeuilleArticle."No. dossier" := Nouveau."No. dossier";
            LigneFeuilleArticle.Description := 'ajustement automatique';
            LigneFeuilleArticle."Location Code" := Nouveau."Code magasin";
            LigneFeuilleArticle."Unit Cost" := Nouveau."Cout unitaire";
            LigneFeuilleArticle.Amount := Nouveau.Montant;
            LigneFeuilleArticle."Qty. per Unit of Measure" := Nouveau."Quantité par unité";
            LigneFeuilleArticle.INSERT();
        END;
        //*FIN NSC1.10 :remplissage des deux lignes dans la feuille de saisie article

        ValiderFeuillesArticle.RUN(LigneFeuilleArticle);

        //*NSC1.10 :suppression des modèles et des feuilles de saisie
        ModeleFeuilleArticle.GET('');
        ModeleFeuilleArticle.DELETE();

        NomFeuillesArticle.GET('', '');
        NomFeuillesArticle.DELETE();
        //*FIN NSC1.10 :suppression des modèles et des feuilles de saisie

    end;
    //*NSC1.10 :Recherche du numéro de document

    procedure MAJLigne()
    begin
        "Cout unitaire (piece)" := "Cout unitaire direct" / "Quantité par unité";
        "Cout unitaire" := "Cout unitaire direct" * (100 - "% remise ligne") / 100;

        ParamCompta.GET();

        IF Devise.GET("Code devise") THEN
            Montant := ROUND("Quantité (piece)" * "Cout unitaire", Devise."Amount Rounding Precision")
        ELSE
            Montant := ROUND("Quantité (piece)" * "Cout unitaire", ParamCompta."Amount Rounding Precision");

        IF "Facteur devise" <> 0 THEN
            "Montant (dev soc)" := ROUND(Montant / "Facteur devise", ParamCompta."Amount Rounding Precision")
        ELSE
            "Montant (dev soc)" := ROUND(Montant, ParamCompta."Amount Rounding Precision");

    end;





}