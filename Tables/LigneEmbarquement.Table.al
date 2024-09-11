table 50235 "LigneEmbarquement"
{
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "No embarquement"; Code[10])
        {
            DataClassification = ToBeClassified;
            Caption = 'No embarquement';
            Description = 'Identifiant unique de l''embarquement';
        }
        field(2; "No preneur d'ordre"; Code[20])
        {
            DataClassification = ToBeClassified;
            Caption = 'No preneur d''ordre';
            Description = 'Code du preneur d''ordre pour cet embarquement';
            TableRelation = Vendor."No.";
        }
        field(3; "No ligne"; Integer)
        {
            DataClassification = ToBeClassified;
            Caption = 'No ligne';
            Description = 'Numéro de ligne pour identifier chaque ligne d''embarquement';
        }
        field(4; "Date embarquement"; Date)
        {
            DataClassification = SystemMetadata;
            Caption = 'Date embarquement';
            Description = 'Date de l''embarquement des articles';
        }
        field(5; "No commande achat"; Code[20])
        {
            DataClassification = ToBeClassified;
            Caption = 'No commande achat';
            Description = 'Numéro de commande d''achat lié à l''embarquement';
            TableRelation = "Purchase Header"."No." where("Document Type" = const(Order), "Buy-from Vendor No." = field("No preneur d'ordre"));
        }
        field(6; "No ligne commande achat"; Integer)
        {
            DataClassification = ToBeClassified;
            Caption = 'No ligne commande achat';
            Description = 'Numéro de ligne pour la commande d''achat associée';
            TableRelation = "Purchase Line"."Line No." where("Document Type" = const(Order), "Buy-from Vendor No." = field("No preneur d'ordre"), "Document No." = field("No commande achat"), Type = const(Item));

        }
        field(7; "No Article"; Code[20])
        {
            DataClassification = ToBeClassified;
            Caption = 'No Article';
            Description = 'Code unique de l''article embarqué';
            TableRelation = "Item"."No.";
        }
        field(8; "Conditionnement produit"; Code[10])
        {
            DataClassification = ToBeClassified;
            Caption = 'Conditionnement produit';
            Description = 'Code du conditionnement pour le produit';
        }
        field(9; "Désignation"; Text[50])
        {
            Caption = 'Désignation';
            Description = 'Description du produit embarqué';
            FieldClass = FlowField;
        }
        field(10; "Code magasin"; Code[10])
        {
            DataClassification = ToBeClassified;
            Caption = 'Code magasin';
            Description = 'Code du magasin où le produit est stocké';
        }
        field(11; "Quantité"; Decimal)
        {
            DataClassification = ToBeClassified;
            Caption = 'Quantité';
            Description = 'Quantité d''articles embarqués';
        }
        field(12; "Quantité par unité"; Decimal)
        {
            DataClassification = ToBeClassified;
            Caption = 'Quantité par unité';
            Description = 'Quantité d''articles par unité de conditionnement';
        }
        field(13; "Quantité (Pièce)"; Decimal)
        {
            DataClassification = ToBeClassified;
            Caption = 'Quantité (Pièce)';
            Description = 'Quantité d''articles exprimée en pièce';
        }
        field(17; "Référence fournisseur"; Text[50])
        {
            Caption = 'Référence fournisseur';
            Description = 'Référence du fournisseur pour l''article';
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
        }
        field(19; "Qté Embarquée"; Decimal)
        {
            Caption = 'Qté embarquée';
            Description = 'Quantité totale embarquée pour cet article.';
            FieldClass = FlowField;
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
        }
        field(22; "Qté en commande"; Decimal)
        {
            Caption = 'Qté en commande';
            Description = 'Quantité totale d''articles en commande';
            FieldClass = FlowField;
            CalcFormula = Lookup("Purchase Line".Quantity
                            WHERE("Document Type" = CONST(Order),
                            "Buy-from Vendor No." = FIELD("No preneur d'ordre"),
                            "Document No." = FIELD("No commande achat"),
                            "Line No." = FIELD("No ligne commande achat")));
        }
        field(23; "Qté en commande (Pièce)"; Decimal)
        {
            DataClassification = ToBeClassified;
            Caption = 'Qté en commande (Pièce)';
            Description = 'Quantité d''articles en commande exprimée en pièce';
        }
        field(24; "Filtre No ligne"; Integer)
        {
            DataClassification = ToBeClassified;
            Caption = 'Filtre No ligne';
            Description = 'Filtre spécifique pour les lignes d''embarquement';
        }
        field(50000; "Quantité réservée (Pièce)"; Decimal)
        {
            DataClassification = ToBeClassified;
            Caption = 'Quantité réservée (Pièce)';
            Description = 'Quantité d''articles réservée exprimée en pièce';
        }
        field(50001; "Code casier"; Code[10])
        {
            DataClassification = ToBeClassified;
            Caption = 'Code casier';
            Description = 'Code du casier de stockage pour les articles';
        }
        field(50002; "Livraison directe"; Boolean)
        {
            DataClassification = ToBeClassified;
            Caption = 'Livraison directe';
            Description = 'Indicateur de livraison directe';
        }
        field(50003; "No projet"; Code[20])
        {
            DataClassification = ToBeClassified;
            Caption = 'No projet';
            Description = 'Numéro de projet lié à l''embarquement';
        }
        field(50004; "No de série"; Code[20])
        {
            DataClassification = ToBeClassified;
            Caption = 'No de série';
            Description = 'Numéro de série de l''article';
        }
        field(50005; "No lot"; Code[20])
        {
            DataClassification = ToBeClassified;
            Caption = 'No lot';
            Description = 'Numéro de lot de l''article';
        }
        field(50006; "Qté à réserv non sur achat"; Boolean)
        {
            DataClassification = ToBeClassified;
            Caption = 'Qté à réserver non sur achat';
            Description = 'Quantité à réserver hors achat';
        }
        field(50007; "Quantité à réservée (Pièce)"; Decimal)
        {
            DataClassification = ToBeClassified;
            Caption = 'Quantité à réserver (Pièce)';
            Description = 'Quantité d''articles à réserver exprimée en pièce';
        }
        field(50008; "Quantité réservée"; Decimal)
        {
            DataClassification = ToBeClassified;
            Caption = 'Quantité réservée';
            Description = 'Quantité totale d''articles réservée';
        }
        field(50009; "Quantité à réservée"; Decimal)
        {
            DataClassification = ToBeClassified;
            Caption = 'Quantité à réserver';
            Description = 'Quantité d''articles à réserver';
        }
        field(50010; "No conteneur"; Text[30])
        {
            DataClassification = ToBeClassified;
            Caption = 'No conteneur';
            Description = 'Numéro du conteneur d''embarquement';
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



    var
        LigAchat: Record "Purchase Line";
        LigEmb: Record "Ligneembarquement";
        QteAEmb: Decimal;
        QteAEmbPiece: Decimal;
        QteEnCde: Decimal;
        QteEnCdePiece: Decimal;
        QteEnPlus: Decimal;
        QteEnPlusPiece: Decimal;
        QteEmb: Decimal;
        QteEmbPiece: Decimal;
        QteEmb2: Decimal;
        QteEmbPiece2: Decimal;
        NSC4_32: Integer;
        PurchaseLine: Record "Purchase Line";
        ReservEntry: Record "Reservation Entry";
        //TODO: Codeunits a créer
        ReservEngineMgt: Codeunit "Reservation Engine Mgt.";
        ReservePurchLine: Codeunit "Purch. Line-Reserve";








}
