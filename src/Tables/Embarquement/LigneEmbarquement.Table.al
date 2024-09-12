table 50235 "LigneEmbarquement"
{
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "No embarquement"; Code[10])
        {
            DataClassification = CustomerContent;
            Caption = 'No embarquement';
            Description = 'Identifiant unique de l''embarquement';
            Editable = false;
        }
        field(2; "No preneur d'ordre"; Code[20])
        {
            DataClassification = CustomerContent;
            Caption = 'No preneur d''ordre';
            Description = 'Code du preneur d''ordre pour cet embarquement';
            TableRelation = Vendor."No.";
            Editable = false;
        }
        field(3; "No ligne"; Integer)
        {
            DataClassification = CustomerContent;
            Caption = 'No ligne';
            Description = 'Numéro de ligne pour identifier chaque ligne d''embarquement';
            Editable = false;
        }
        field(4; "Date embarquement"; Date)
        {
            DataClassification = SystemMetadata;
            Caption = 'Date embarquement';
            Description = 'Date de l''embarquement des articles';
            Editable = true;

        }
        field(5; "No commande achat"; Code[20])
        {
            DataClassification = CustomerContent;
            Caption = 'No commande achat';
            Description = 'Numéro de commande d''achat lié à l''embarquement';
            TableRelation = "Purchase Header"."No." where("Document Type" = const(Order), "Buy-from Vendor No." = field("No preneur d'ordre"));
            Editable = true;
        }
        field(6; "No ligne commande achat"; Integer)
        {
            DataClassification = CustomerContent;
            Caption = 'No ligne commande achat';
            Description = 'Numéro de ligne pour la commande d''achat associée';
            TableRelation = "Purchase Line"."Line No." where("Document Type" = const(Order), "Buy-from Vendor No." = field("No preneur d'ordre"), "Document No." = field("No commande achat"), Type = const(Item));
            Editable = true;

            trigger OnValidate()
            begin
                ValidatePurchaseLine();
            end;
        }
        field(7; "No Article"; Code[20])
        {
            DataClassification = CustomerContent;
            Caption = 'No Article';
            Description = 'Code unique de l''article embarqué';
            TableRelation = "Item"."No.";
            Editable = false;
        }
        field(8; "Conditionnement produit"; Code[10])
        {
            DataClassification = ToBeClassified;
            Caption = 'Conditionnement produit';
            Description = 'Code du conditionnement pour le produit';
            Editable = false;
        }
        field(9; "Désignation"; Text[50])
        {
            Caption = 'Désignation';
            Description = 'Description du produit embarqué';
            FieldClass = FlowField;
            Editable = false;

        }
        field(10; "Code magasin"; Code[10])
        {
            DataClassification = ToBeClassified;
            Caption = 'Code magasin';
            Description = 'Code du magasin où le produit est stocké';
            Editable = false;
        }
        field(11; "Quantité"; Decimal)
        {
            DataClassification = ToBeClassified;
            Caption = 'Quantité';
            Description = 'Quantité d''articles embarqués';
            Editable = true;

            trigger OnValidate()
            begin
                ValidateQuantite();
            end;
        }
        field(12; "Quantité par unité"; Decimal)
        {
            DataClassification = ToBeClassified;
            Caption = 'Quantité par unité';
            Description = 'Quantité d''articles par unité de conditionnement';
            Editable = false;
        }
        field(13; "Quantité (Pièce)"; Decimal)
        {
            DataClassification = ToBeClassified;
            Caption = 'Quantité (Pièce)';
            Description = 'Quantité d''articles exprimée en pièce';
            Editable = true;

            trigger OnValidate()
            begin
                ValidateQuantitePiece();
            end;
        }
        field(17; "Référence fournisseur"; Text[50])
        {
            Caption = 'Référence fournisseur';
            Description = 'Référence du fournisseur pour l''article';
            Editable = false;
            FieldClass = FlowField;
            CalcFormula = lookup("Purchase Line"."Vendor Item No."
                                where("Document Type" = const(Order),
                                        "Buy-from Vendor No." = field("No preneur d'ordre"),
                                        "Document No." = field("No commande achat"),
                                        "Line No." = field("No ligne commande achat")));
        }
        field(18; "Date réception prévue"; Date)
        {
            DataClassification = SystemMetadata;
            Caption = 'Date réception prévue';
            Description = 'Date prévue pour la réception de l''article embarqué';
            Editable = true;

            trigger OnValidate()
            begin
                ValidateDateReceptionPrevue();
            end;
        }
        field(19; "Qté Embarquée"; Decimal)
        {
            Caption = 'Qté embarquée';
            Description = 'Quantité totale embarquée pour cet article.';
            FieldClass = FlowField;
            Editable = false;
            CalcFormula = Sum("Ligneembarquement".Quantité
                            WHERE("No embarquement" = FIELD("Filtre Embarquement"),
                                "No preneur d'ordre" = FIELD("No preneur d'ordre"),
                                "No commande achat" = FIELD("No commande achat"),
                                "No ligne commande achat" = FIELD("No ligne commande achat"),
                                "No ligne" = FIELD("Filtre No ligne")));
        }

        field(20; "Qté embarquée (Pièce)"; Decimal)
        {
            Caption = 'Qté embarquée (Pièce)';
            Description = 'Quantité d''articles embarqués exprimée en pièce';
            FieldClass = FlowField;
            Editable = false;
            CalcFormula = Sum("Ligneembarquement"."Quantité (Pièce)"
                            WHERE("No embarquement" = FIELD("Filtre Embarquement"),
                                "No preneur d'ordre" = FIELD("No preneur d'ordre"),
                                "No commande achat" = FIELD("No commande achat"),
                                "No ligne commande achat" = FIELD("No ligne commande achat"),
                                "No ligne" = FIELD("Filtre No ligne")));
        }
        field(21; "Filtre Embarquement"; Code[10])
        {
            Caption = 'Filtre Embarquement';
            Description = 'Filtre spécifique pour l''embarquement';
            FieldClass = FlowFilter;
            Editable = true;
        }
        field(22; "Qté en commande"; Decimal)
        {
            Caption = 'Qté en commande';
            Description = 'Quantité totale d''articles en commande';
            Editable = false;
            FieldClass = FlowField;
            CalcFormula = Lookup("Purchase Line".Quantity
                            WHERE("Document Type" = CONST(Order),
                            "Buy-from Vendor No." = FIELD("No preneur d'ordre"),
                            "Document No." = FIELD("No commande achat"),
                            "Line No." = FIELD("No ligne commande achat")));
        }
        field(23; "Qté en commande (Pièce)"; Decimal)
        {
            Caption = 'Qté en commande (Pièce)';
            Description = 'Quantité d''articles en commande exprimée en pièce';
            Editable = false;
            FieldClass = FlowField;
            CalcFormula = Lookup("Purchase Line"."Quantity (Base)"
                            WHERE("Document Type" = CONST(Order),
                            "Buy-from Vendor No." = FIELD("No preneur d'ordre"),
                            "Document No." = FIELD("No commande achat"),
                            "Line No." = FIELD("No ligne commande achat")));
        }
        field(24; "Filtre No ligne"; Integer)
        {
            Caption = 'Filtre No ligne';
            Description = 'Filtre spécifique pour les lignes d''embarquement';
            FieldClass = FlowFilter;
            BlankNumbers = DontBlank;
            Editable = true;
        }
        field(50000; "Quantité réservée (Pièce)"; Decimal)
        {
            Caption = 'Quantité réservée (Pièce)';
            Description = 'Quantité d''articles réservée exprimée en pièce';
            FieldClass = FlowField;
            Editable = false;
            CalcFormula = Sum("Reservation Entry"."Quantity (Base)"
                            WHERE("Source ID" = FIELD("No commande achat"),
                            "Source Ref. No." = FIELD("No ligne commande achat"),
                            "Source Type" = CONST(39),
                            "Source Subtype" = CONST(1),
                            "Reservation Status" = CONST("Reservation"),
                            "No embarquement" = FIELD("No embarquement"),
                            "No ligne embarquement" = FIELD("No ligne")));
        }
        field(50001; "Code casier"; Code[10])
        {
            DataClassification = ToBeClassified;
            Caption = 'Code casier';
            Description = 'Code du casier de stockage pour les articles';
            Editable = false;
        }
        field(50002; "Livraison directe"; Boolean)
        {
            DataClassification = ToBeClassified;
            Caption = 'Livraison directe';
            Description = 'Indicateur de livraison directe';
            Editable = false;
        }
        field(50003; "No projet"; Code[20])
        {
            DataClassification = ToBeClassified;
            Caption = 'No projet';
            Description = 'Numéro de projet lié à l''embarquement';
            Editable = false;
        }
        field(50004; "No de série"; Code[20])
        {
            DataClassification = ToBeClassified;
            Caption = 'No de série';
            Description = 'Numéro de série de l''article';
            Editable = false;
        }
        field(50005; "No lot"; Code[20])
        {
            DataClassification = ToBeClassified;
            Caption = 'No lot';
            Description = 'Numéro de lot de l''article';
            Editable = false;
        }
        field(50006; "Qté à réserv non sur achat"; Boolean)
        {
            DataClassification = ToBeClassified;
            Caption = 'Qté à réserver non sur achat';
            Description = 'Quantité à réserver hors achat';
            Editable = false;
        }
        field(50007; "Quantité à réservée (Pièce)"; Decimal)
        {
            DataClassification = ToBeClassified;
            Caption = 'Quantité à réserver (Pièce)';
            Description = 'Quantité d''articles à réserver exprimée en pièce';
            Editable = false;
        }
        field(50008; "Quantité réservée"; Decimal)
        {
            Caption = 'Quantité réservée';
            Description = 'Quantité totale d''articles réservée';
            Editable = false;
            FieldClass = FlowField;
            CalcFormula = Sum("Reservation Entry".Quantity
                            WHERE("Source ID" = FIELD("No commande achat"),
                            "Source Ref. No." = FIELD("No ligne commande achat"),
                            "Source Type" = CONST(39),
                            "Source Subtype" = CONST(1),
                            "Reservation Status" = CONST("Reservation"),
                            "No embarquement" = FIELD("No embarquement"),
                            "No ligne embarquement" = FIELD("No ligne")));
        }
        field(50009; "Quantité à réservée"; Decimal)
        {
            DataClassification = ToBeClassified;
            Caption = 'Quantité à réserver';
            Description = 'Quantité d''articles à réserver';
            Editable = false;
        }
        field(50010; "No conteneur"; Text[30])
        {
            DataClassification = ToBeClassified;
            Caption = 'No conteneur';
            Description = 'Numéro du conteneur d''embarquement';
            Editable = true;
        }
    }

    keys
    {
        // Primary Key
        key(PK; "No embarquement", "No preneur d'ordre", "No ligne")
        {
            Clustered = true;
            SumIndexFields = "Quantité", "Quantité (Pièce)";
        }

        // Secondary Key: Date embarquement, No Article
        key(DateEmbarquement_Article; "Date embarquement", "No Article")
        {
            Enabled = true;
        }

        // Secondary Key: No commande achat, No ligne commande achat
        key(CommAchat_LineCommAchat; "No commande achat", "No ligne commande achat")
        {
            Enabled = true;
        }

        // Secondary Key: No embarquement, No Article
        key(Embarquement_Article; "No embarquement", "No Article")
        {
            Enabled = true;
            SumIndexFields = "Quantité", "Quantité (Pièce)";
        }

        // Secondary Key: No preneur d'ordre, No commande achat, No ligne commande achat, No Article
        key(Pren_CommAchat_LineAchat_Art; "No preneur d'ordre", "No commande achat", "No ligne commande achat", "No Article")
        {
            Enabled = true;
            SumIndexFields = "Quantité", "Quantité (Pièce)";
        }

        // Secondary Key: No Article, Conditionnement produit, Livraison directe, Code magasin, Code casier, Date réception prévue
        key(Article_Conditionnement; "No Article", "Conditionnement produit", "Livraison directe", "Code magasin", "Code casier", "Date réception prévue")
        {
            Enabled = true;
        }
    }



    trigger OnModify()
    begin
        if ("Quantité" <> xRec."Quantité") or ("Quantité (Pièce)" <> xRec."Quantité (Pièce)") then
            DeleteReservEntry();
    end;

    trigger OnDelete()
    begin
        DeleteReservEntry();
    end;

    trigger OnRename()
    begin
        Error('Vous ne pouvez pas renommer %1.', TableCaption());
    end;


    procedure ValidateQuantite()
    var
        LigEmb: Record "LigneEmbarquement";
        LigAchat: Record "Purchase Line";
        QteEmb: Decimal;
        QteEmbPièce: Decimal;
        QteEmb2: Decimal;
        QteEmbPièce2: Decimal;
        QteEnCde: Decimal;
        QteEnCdePièce: Decimal;
        QteAEmb: Decimal;
        QteAEmbPiece: Decimal;
        QteEnPlus: Decimal;
        QteEnPlusPièce: Decimal;
    begin
        QteEmb := 0;
        QteEmbPièce := 0;
        QteEmb2 := 0;
        QteEmbPièce2 := 0;
        LigEmb.Reset();
        LigEmb.SetRange("No commande achat", "No commande achat");
        LigEmb.SetRange("No ligne commande achat", "No ligne commande achat");
        LigAchat.Reset();

        // Calculate the limits for shipping
        if LigAchat.Get(LigAchat."Document Type"::Order, "No commande achat", "No ligne commande achat") then begin
            // Retrieve quantities in the order
            QteEnCde := LigAchat.Quantity;
            QteEnCdePièce := LigAchat."Quantity (Base)";

            // Quantities already shipped in other shipments for the same order and line
            LigEmb.SetFilter("Filtre Embarquement", '<>%1', "No embarquement");
            if LigEmb.FindFirst() then begin
                LigEmb.CalcFields("Qté embarquée", "Qté embarquée (Pièce)");
                QteEmb := LigEmb."Qté embarquée";
                QteEmbPièce := LigEmb."Qté embarquée (Pièce)";
            end;

            // Quantities already shipped in the same shipment for the same order and line
            LigEmb.SetRange("Filtre Embarquement", "No embarquement");
            LigEmb.SetFilter("No ligne", '<>%1', "No ligne");
            if LigEmb.FindFirst() then begin
                LigEmb.CalcFields("Qté embarquée", "Qté embarquée (Pièce)");
                QteEmb2 := LigEmb."Qté embarquée";
                QteEmbPièce2 := LigEmb."Qté embarquée (Pièce)";
            end;

            // Calculate the maximum quantities to be shipped
            QteAEmb := (LigAchat."Outstanding Quantity" - QteEmb - QteEmb2);
            QteAEmbPiece := (LigAchat."Outstanding Qty. (Base)" - QteEmbPièce - QteEmbPièce2);

            // Test entered quantity
            if ("Quantité" > QteAEmb) then begin
                QteEnPlus := ((QteEmb + QteEmb2 + "Quantité") - QteEnCde);
                QteEnPlusPièce := Round(QteEnPlus * "Quantité par unité", 0.00001);
                if Confirm(
                        'La quantité en commande est de %1 (%2 pièces), voulez-vous l''augmenter de %3 (%4 pièces) ?',
                        false, QteEnCde, QteEnCdePièce, QteEnPlus, QteEnPlusPièce) then begin
                    LigAchat.Validate(Quantity, QteEnCde + QteEnPlus);
                    LigAchat.Modify();
                end else
                    Error('Vous ne pouvez embarquer que %1 unités (%2 pièce).', QteAEmb, QteAEmbPiece);
            end;

            // Update field Quantité (Pièce)
            "Quantité (Pièce)" := Round("Quantité" * "Quantité par unité", 0.00001);

            Commit();

            // Update purchase line table
            LigAchat.Reset();
            if LigAchat.Get(LigAchat."Document Type"::Order, "No commande achat", "No ligne commande achat") then begin
                LigAchat."Qté à embarquer" := (LigAchat."Outstanding Quantity" - QteEmb - QteEmb2 - "Quantité");
                LigAchat."Qté à embarquer (Pièce)" := (LigAchat."Outstanding Qty. (Base)" - QteEmbPièce - QteEmbPièce2 - "Quantité (Pièce)");
                LigAchat."Qty. to Receive" := (LigAchat."Outstanding Quantity" - QteEmb - QteEmb2 - "Quantité");
                LigAchat."Qty. to Receive (Base)" := (LigAchat."Outstanding Qty. (Base)" - QteEmbPièce - QteEmbPièce2 - "Quantité (Pièce)");
                LigAchat."Qty. to Invoice" := (LigAchat."Quantity Received" + LigAchat."Qty. to Receive" - LigAchat."Quantity Invoiced");
                LigAchat."Qty. to Invoice (Base)" := (LigAchat."Qty. Received (Base)" + LigAchat."Qty. to Receive (Base)" -
                    LigAchat."Qty. Invoiced (Base)");
                LigAchat.Modify();
                Commit();
            end;
        end else
            Error('Cette ligne de commande n''existe plus.');
    end;


    procedure DeleteReservEntry()
    var
        ReservEntry: Record "Reservation Entry";
        ReservEngineMgt: Codeunit "Reservation Engine Mgt.";
    begin
        if ("Quantité" <> 0) and ItemExists("No Article") then begin
            ReservEntry.SetRange("No embarquement", "No embarquement");
            ReservEntry.SetRange("No ligne embarquement", "No ligne");
            if ReservEntry.FindSet() then
                repeat
                    ReservEngineMgt.CloseReservEntry(ReservEntry, false, false);
                until ReservEntry.Next() = 0;


            CalcFields("Quantité réservée (Pièce)");
            TestField("Quantité réservée (Pièce)", 0);
        end;
    end;

    procedure ItemExists(ItemNo: Code[20]): Boolean
    var
        Item: Record Item;
    begin
        exit(Item.Get(ItemNo));
    end;

    procedure MAJDateReceptEcrReservEmbarq(NouvDateRecept: Date; NEmbarq: Code[10]; NLigneEmbarq: Integer)
    var
        ReservEntry: Record "Reservation Entry";
        ReservEngineMgt: Codeunit "Reservation Engine Mgt.";
    begin
        ReservEntry.SetRange("No embarquement", NEmbarq);
        ReservEntry.SetRange("No ligne embarquement", NLigneEmbarq);
        if ReservEntry.FindSet() then
            ReservEngineMgt.ModifyExpectedReceiptDate(ReservEntry, NouvDateRecept);
    end;

    // Procedure pour No ligne commande achat
    procedure ValidatePurchaseLine()
    var
        LigAchat: Record "Purchase Line";
    begin
        if LigAchat.Get(LigAchat."Document Type"::Order, "No commande achat", "No ligne commande achat") then begin
            "No Article" := LigAchat."No.";
            "Date réception prévue" := LigAchat."Expected Receipt Date";
            CalcFields("Désignation", "Code magasin", "Quantité par unité", "Référence fournisseur", "Qté en commande", "Qté en commande (Pièce)");
        end else
            Error('La ligne de commande n''existe plus.');
    end;


    // Procedure pour calculer la quantité en pieces basé sur "Quantité (pièce)"
    procedure ValidateQuantitePiece()
    begin
        if "Quantité par unité" = 1 then
            Validate(Quantité, "Quantité (Pièce)")
        else
            Validate(Quantité, Round(("Quantité (Pièce)" / "Quantité par unité"), 1, '<'));
    end;


    // Procedure pour mettre a jour la date de reception
    procedure ValidateDateReceptionPrevue()
    begin
        if "Date réception prévue" <> xRec."Date réception prévue" then
            MAJDateReceptEcrReservEmbarq("Date réception prévue", "No embarquement", "No ligne");
    end;

    // Modale 
    procedure ShowReservationEntries(Modal: Boolean)
    var
        ReservEntry: Record "Reservation Entry";
    begin
        TestField("No Article"); // Test de presence de l'article

        // Filtres embarquement
        ReservEntry.SetRange("No embarquement", "No embarquement");
        ReservEntry.SetRange("No ligne embarquement", "No ligne");

        if Modal then
            Page.RunModal(Page::"Reservation Entries", ReservEntry)
        else
            Page.Run(Page::"Reservation Entries", ReservEntry);
    end;

    procedure DeleteLine()
    var
        PurchaseLine: Record "Purchase Line";
    begin
        PurchaseLine.Reset();
        PurchaseLine.SetRange("Document Type", PurchaseLine."Document Type"::Order);
        PurchaseLine.SetRange("Document No.", "No commande achat");
        PurchaseLine.SetRange("Line No.", "No ligne commande achat");
        if PurchaseLine.Find('-') then begin
            Delete(true);
            Commit();
            PurchaseLine.MajQte(PurchaseLine);
        end;
    end;

}
