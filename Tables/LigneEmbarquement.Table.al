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
            TableRelation = Vendor;
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
            DataClassification = ToBeClassified;
            Caption = 'Désignation';
            Description = 'Description du produit embarqué';
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
            CalcFormula = Lookup("Purchase Line"."Vendor Item No."
                                WHERE("Document Type" = CONST(Order),
                                        "Buy-from Vendor No." = FIELD("No preneur d'ordre"),
                                        "Document No." = FIELD("No commande achat"),
                                        "Line No." = FIELD("No ligne commande achat")));
        }
        field(18; "Date réception prévue"; Date)
        {
            DataClassification = SystemMetadata;
            Caption = 'Date réception prévue';
            Description = 'Date prévue pour la réception de l''article embarqué';
        }
        field(19; "Qté embarquée"; Decimal)
        {
            DataClassification = ToBeClassified;
            Caption = 'Qté embarquée';
            Description = 'Quantité d''articles embarqués';
        }
        field(20; "Qté embarquée (Pièce)"; Decimal)
        {
            DataClassification = ToBeClassified;
            Caption = 'Qté embarquée (Pièce)';
            Description = 'Quantité d''articles embarqués exprimée en pièce';
        }
        field(21; "Filtre Embarquement"; Code[10])
        {
            DataClassification = ToBeClassified;
            Caption = 'Filtre Embarquement';
            Description = 'Filtre spécifique pour l''embarquement';
        }
        field(22; "Qté en commande"; Decimal)
        {
            DataClassification = ToBeClassified;
            Caption = 'Qté en commande';
            Description = 'Quantité totale d''articles en commande';
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
        key(PK; "No embarquement", "No ligne")
        {
            Clustered = true;
        }

        key(SecondaryKey1; "No commande achat", "No article")
        {
            Enabled = true;
        }

        key(SecondaryKey2; "No article", "No projet")
        {
            Enabled = true;
        }
    }
}
