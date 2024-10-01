table 50247 "HistoriquePRTTable"
{
    DataClassification = CustomerContent;

    fields
    {
        field(1; "No. calcul"; Integer)
        {
            DataClassification = CustomerContent;
            Caption = 'No. calcul';
            Description = 'HISTORIQUE_PRT - LN - 10/09/24 REV24';
            Editable = false;
            BlankNumbers = DontBlank;
        }
        field(2; "No. article"; Code[20])
        {
            DataClassification = CustomerContent;
            Caption = 'No. article';
            Description = 'HISTORIQUE_PRT - LN - 10/09/24 REV24';
            Editable = false;
            TableRelation = "Item"."No.";
        }
        field(3; "Date"; Date)
        {
            DataClassification = SystemMetadata;
            Caption = 'Date';
            Description = 'HISTORIQUE_PRT - LN - 10/09/24 REV24';
            Editable = false;
            BlankNumbers = DontBlank;
        }
        field(4; "Heure"; Time)
        {
            DataClassification = SystemMetadata;
            Caption = 'Heure';
            Description = 'HISTORIQUE_PRT - LN - 10/09/24 REV24';
            Editable = false;
            BlankNumbers = DontBlank;
        }
        field(5; "No. commande"; Code[20])
        {
            DataClassification = CustomerContent;
            Caption = 'No. commande';
            Description = 'HISTORIQUE_PRT - LN - 10/09/24 REV24';
            Editable = false;
            TableRelation = "Purchase Header"."No." where("Document Type" = const(Order));
        }
        field(6; "Date achat"; Date)
        {
            DataClassification = SystemMetadata;
            Caption = 'Date achat';
            Description = 'HISTORIQUE_PRT - LN - 10/09/24 REV24';
            Editable = false;
            BlankNumbers = DontBlank;
        }
        field(7; "Code devise cde"; Code[10])
        {
            DataClassification = CustomerContent;
            Caption = 'Code devise commande';
            Description = 'HISTORIQUE_PRT - LN - 10/09/24 REV24';
            TableRelation = "Currency"."Code";
            Editable = false;
        }
        field(8; "Facteur devise cde"; Decimal)
        {
            DataClassification = CustomerContent;
            Caption = 'Facteur devise commande';
            Description = 'HISTORIQUE_PRT - LN - 10/09/24 REV24';
            MinValue = 0;
            Editable = false;
            BlankNumbers = DontBlank;
            DecimalPlaces = 1 : 15;
        }
        field(9; "Incoterm"; Option)
        {
            DataClassification = CustomerContent;
            Caption = 'Incoterm';
            Description = 'HISTORIQUE_PRT - LN - 10/09/24 REV24';
            OptionMembers = EXW,FOB,CNI,CFR,CNF,CIF;
            Editable = false;
            BlankNumbers = DontBlank;
        }
        field(10; "No. fournisseur"; Code[20])
        {
            DataClassification = CustomerContent;
            Caption = 'No. fournisseur';
            Description = 'HISTORIQUE_PRT - LN - 10/09/24 REV24';
            TableRelation = "Vendor"."No.";
            Editable = false;
        }
        field(20; "Code transport routier"; Code[10])
        {
            DataClassification = CustomerContent;
            Caption = 'Code transport routier';
            Description = 'HISTORIQUE_PRT - LN - 10/09/24 REV24';
            Editable = false;
        }
        field(21; "Montant transport routier"; Decimal)
        {
            DataClassification = CustomerContent;
            Caption = 'Montant transport routier';
            Description = 'HISTORIQUE_PRT - LN - 10/09/24 REV24';
            Editable = false;
            AutoFormatType = 2;
            BlankNumbers = DontBlank;
        }
        field(22; "Code devise transp. rout."; Code[10])
        {
            DataClassification = CustomerContent;
            Caption = 'Code devise transport routier';
            Description = 'HISTORIQUE_PRT - LN - 10/09/24 REV24';
            TableRelation = Currency."Code";
            Editable = false;

        }
        field(23; "Facteur devise transp. rout."; Decimal)
        {
            DataClassification = CustomerContent;
            Caption = 'Facteur devise transport routier';
            Description = 'HISTORIQUE_PRT - LN - 10/09/24 REV24';
            MinValue = 0;
            Editable = false;
            BlankNumbers = DontBlank;
            DecimalPlaces = 0 : 15;
        }
        field(24; "Code transport maritime"; Code[10])
        {
            DataClassification = CustomerContent;
            Caption = 'Code transport maritime';
            Description = 'HISTORIQUE_PRT - LN - 10/09/24 REV24';
        }
        field(25; "Montant transport maritime"; Decimal)
        {
            DataClassification = CustomerContent;
            Caption = 'Montant transport maritime';
            Description = 'HISTORIQUE_PRT - LN - 10/09/24 REV24';
            BlankNumbers = DontBlank;
            AutoFormatType = 2;
        }
        field(26; "Code devise transp. marit."; Code[10])
        {
            DataClassification = CustomerContent;
            Caption = 'Code devise transport maritime';
            Description = 'HISTORIQUE_PRT - LN - 10/09/24 REV24';
            TableRelation = Currency."Code";
        }
        field(27; "Facteur devise transp. marit."; Decimal)
        {
            DataClassification = CustomerContent;
            Caption = 'Facteur devise transport maritime';
            Description = 'HISTORIQUE_PRT - LN - 10/09/24 REV24';
            MinValue = 0;
            Editable = false;
            BlankNumbers = DontBlank;
            DecimalPlaces = 0 : 15;
        }
        field(28; "% frais financiers"; Decimal)
        {
            DataClassification = CustomerContent;
            Caption = '% frais financiers';
            Description = 'HISTORIQUE_PRT - LN - 10/09/24 REV24';
            MinValue = 0;
            MaxValue = 100;
            BlankNumbers = DontBlank;
        }
        field(29; "% assurances"; Decimal)
        {
            DataClassification = CustomerContent;
            Caption = '% assurances';
            Description = 'HISTORIQUE_PRT - LN - 10/09/24 REV24';
            MinValue = 0;
            MaxValue = 100;
            BlankNumbers = DontBlank;
        }
        field(30; "% commissions"; Decimal)
        {
            DataClassification = CustomerContent;
            Caption = '% commissions';
            Description = 'HISTORIQUE_PRT - LN - 10/09/24 REV24';
            MinValue = 0;
            MaxValue = 100;
            BlankNumbers = DontBlank;
        }
        field(31; "% transit"; Decimal)
        {
            DataClassification = CustomerContent;
            Caption = '% transit';
            Description = 'HISTORIQUE_PRT - LN - 10/09/24 REV24';
            MinValue = 0;
            MaxValue = 100;
            BlankNumbers = DontBlank;
        }
        field(32; "Volume commande"; Decimal)
        {
            DataClassification = CustomerContent;
            Caption = 'Volume commande';
            Description = 'HISTORIQUE_PRT - LN - 10/09/24 REV24';
            BlankNumbers = DontBlank;
        }
        field(40; "No. ligne"; Text[250])
        {
            DataClassification = CustomerContent;
            Caption = 'No. ligne';
            Description = 'HISTORIQUE_PRT - LN - 10/09/24 REV24';
        }
        field(41; "Quantité achetée"; Decimal)
        {
            DataClassification = CustomerContent;
            Caption = 'Quantité achetée';
            Description = 'HISTORIQUE_PRT - LN - 10/09/24 REV24';
            BlankNumbers = DontBlank;
            DecimalPlaces = 0 : 5;
        }
        field(42; "Prix achat (dev soc)"; Decimal)
        {
            DataClassification = CustomerContent;
            Caption = 'Prix achat (devise société)';
            Description = 'HISTORIQUE_PRT - LN - 10/09/24 REV24';
            BlankNumbers = DontBlank;
            AutoFormatType = 2;
        }
        field(43; "Montant ligne achat"; Decimal)
        {
            DataClassification = CustomerContent;
            Caption = 'Montant ligne achat';
            Description = 'HISTORIQUE_PRT - LN - 10/09/24 REV24';
            BlankNumbers = DontBlank;
            AutoFormatType = 2;
        }
        field(44; "Volume"; Decimal)
        {
            DataClassification = CustomerContent;
            Caption = 'Volume';
            Description = 'HISTORIQUE_PRT - LN - 10/09/24 REV24';
            BlankNumbers = DontBlank;
            AutoFormatType = 2;
        }
        field(45; "Coût transport rout. (dev soc)"; Decimal)
        {
            DataClassification = CustomerContent;
            Caption = 'Coût transport routier (devise société)';
            Description = 'HISTORIQUE_PRT - LN - 10/09/24 REV24';
            BlankNumbers = DontBlank;
            AutoFormatType = 2;
        }
        field(46; "Montant frais fin. (dev soc)"; Decimal)
        {
            DataClassification = CustomerContent;
            Caption = 'Montant frais financiers (devise société)';
            Description = 'HISTORIQUE_PRT - LN - 10/09/24 REV24';
            BlankNumbers = DontBlank;
            AutoFormatType = 2;
        }
        field(47; "Montant assurances (dev soc)"; Decimal)
        {
            DataClassification = CustomerContent;
            Caption = 'Montant assurances (devise société)';
            Description = 'HISTORIQUE_PRT - LN - 10/09/24 REV24';
            BlankNumbers = DontBlank;
            AutoFormatType = 2;
        }
        field(48; "Montant commissions (dev soc)"; Decimal)
        {
            DataClassification = CustomerContent;
            Caption = 'Montant commissions (devise société)';
            Description = 'HISTORIQUE_PRT - LN - 10/09/24 REV24';
            BlankNumbers = DontBlank;
            AutoFormatType = 2;
        }
        field(49; "Montant transit (dev soc)"; Decimal)
        {
            DataClassification = CustomerContent;
            Caption = 'Montant transit (devise société)';
            Description = 'HISTORIQUE_PRT - LN - 10/09/24 REV24';
            BlankNumbers = DontBlank;
            AutoFormatType = 2;
        }
        field(50; "Montant frais douane (dev soc)"; Decimal)
        {
            DataClassification = CustomerContent;
            Caption = 'Montant frais douane (devise société)';
            Description = 'HISTORIQUE_PRT - LN - 10/09/24 REV24';
            BlankNumbers = DontBlank;
            AutoFormatType = 2;
        }
        field(51; "CU net douane (dev soc)"; Decimal)
        {
            DataClassification = CustomerContent;
            Caption = 'CU net douane (devise société)';
            Description = 'HISTORIQUE_PRT - LN - 10/09/24 REV24';
            BlankNumbers = DontBlank;
            AutoFormatType = 2;
        }
        field(52; "% droit douane"; Decimal)
        {
            DataClassification = CustomerContent;
            Caption = '% droit douane';
            Description = 'HISTORIQUE_PRT - LN - 10/09/24 REV24';
            BlankNumbers = DontBlank;
            MinValue = 0;
            MaxValue = 100;
        }
        field(53; "Coût transport marit. (devsoc)"; Decimal)
        {
            DataClassification = CustomerContent;
            Caption = 'Coût transport maritime (devise société)';
            Description = 'HISTORIQUE_PRT - LN - 10/09/24 REV24';
            BlankNumbers = DontBlank;
            AutoFormatType = 2;
        }
        field(54; "% remise ligne"; Decimal)
        {
            DataClassification = CustomerContent;
            Caption = '% remise ligne';
            Description = 'HISTORIQUE_PRT - LN - 10/09/24 REV24';
            BlankNumbers = DontBlank;
            MinValue = 0;
            MaxValue = 100;
        }
        field(55; "Frais annexes (dev soc)"; Decimal)
        {
            DataClassification = CustomerContent;
            Caption = 'Frais annexes (devise société)';
            Description = 'HISTORIQUE_PRT - LN - 10/09/24 REV24';
            BlankNumbers = DontBlank;
        }
        field(60; "PRT"; Decimal)
        {
            DataClassification = CustomerContent;
            Caption = 'PRT';
            Description = 'HISTORIQUE_PRT - LN - 10/09/24 REV24';
            Editable = false;
            BlankNumbers = DontBlank;
            AutoFormatType = 2;
        }
        field(61; "Coût unitaire direct"; Decimal)
        {
            DataClassification = CustomerContent;
            Caption = 'Coût unitaire direct';
            Description = 'HISTORIQUE_PRT - LN - 10/09/24 REV24';
            BlankNumbers = DontBlank;
        }
        field(62; "Montant taxe anti-dumping"; Decimal)
        {
            DataClassification = CustomerContent;
            Caption = 'Montant taxe anti-dumping';
            Description = 'HISTORIQUE_PRT - LN - 10/09/24 REV24';
            BlankNumbers = DontBlank;
        }
    }

    keys
    {   // Clé primaire Composée de "No calcul" et "No article" pour identifier chaque ligne de manière unique.
        key(PK; "No. calcul", "No. article")
        {
            Clustered = true;
        }

        // Optimise les recherches basées sur des dates et heures spécifiques.
        key(SecondaryKey1; "Date", "Heure")
        {
            Enabled = true;
        }

        // Facilite les requêtes sur les numéros de commande avec date et heure.
        key(SecondaryKey2; "No. commande", "Date", "Heure")
        {
            Enabled = true;
        }

        //  Accélère les recherches d'articles par date.
        key(SecondaryKey3; "No. article", "Date")
        {
            Enabled = true;
        }

        // Permet un accès rapide aux détails filtrés par date, article, et commande.
        key(SecondaryKey4; "Date", "Heure", "No. article", "No. commande")
        {
            Enabled = true;
        }

    }


}
