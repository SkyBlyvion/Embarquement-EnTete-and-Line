table 50247 "HistoriquePRTTable"
{
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "No. calcul"; Integer)
        {
            DataClassification = ToBeClassified;
            Caption = 'No. calcul';
        }
        field(2; "No. article"; Code[20])
        {
            DataClassification = ToBeClassified;
            Caption = 'No. article';
            TableRelation = "Item"."No.";
        }
        field(3; "Date"; Date)
        {
            DataClassification = SystemMetadata;
            Caption = 'Date';
        }
        field(4; "Heure"; Time)
        {
            DataClassification = SystemMetadata;
            Caption = 'Heure';
        }
        field(5; "No. commande"; Code[20])
        {
            DataClassification = ToBeClassified;
            Caption = 'No. commande';
            TableRelation = "Purchase Header"."No." where("Document Type" = const(Order));
        }
        field(6; "Date achat"; Date)
        {
            DataClassification = SystemMetadata;
            Caption = 'Date achat';
        }
        field(7; "Code devise cde"; Code[10])
        {
            DataClassification = ToBeClassified;
            Caption = 'Code devise commande';
            TableRelation = "Currency"."Code";
        }
        field(8; "Facteur devise cde"; Decimal)
        {
            DataClassification = ToBeClassified;
            Caption = 'Facteur devise commande';
        }
        field(9; "Incoterm"; Option)
        {
            DataClassification = ToBeClassified;
            Caption = 'Incoterm';
            OptionMembers = EXW,FOB,CNI,CFR,CNF,CIF;
        }
        field(10; "No. fournisseur"; Code[20])
        {
            DataClassification = ToBeClassified;
            Caption = 'No. fournisseur';
            TableRelation = "Vendor"."No.";
        }
        field(20; "Code transport routier"; Code[10])
        {
            DataClassification = ToBeClassified;
            Caption = 'Code transport routier';
        }
        field(21; "Montant transport routier"; Decimal)
        {
            DataClassification = ToBeClassified;
            Caption = 'Montant transport routier';
        }
        field(22; "Code devise transp. rout."; Code[10])
        {
            DataClassification = ToBeClassified;
            Caption = 'Code devise transport routier';
            TableRelation = Currency."Code";

        }
        field(23; "Facteur devise transp. rout."; Decimal)
        {
            DataClassification = ToBeClassified;
            Caption = 'Facteur devise transport routier';
        }
        field(24; "Code transport maritime"; Code[10])
        {
            DataClassification = ToBeClassified;
            Caption = 'Code transport maritime';
        }
        field(25; "Montant transport maritime"; Decimal)
        {
            DataClassification = ToBeClassified;
            Caption = 'Montant transport maritime';
        }
        field(26; "Code devise transp. marit."; Code[10])
        {
            DataClassification = ToBeClassified;
            Caption = 'Code devise transport maritime';
            TableRelation = Currency."Code";
        }
        field(27; "Facteur devise transp. marit."; Decimal)
        {
            DataClassification = ToBeClassified;
            Caption = 'Facteur devise transport maritime';
        }
        field(28; "% frais financiers"; Decimal)
        {
            DataClassification = ToBeClassified;
            Caption = '% frais financiers';
        }
        field(29; "% assurances"; Decimal)
        {
            DataClassification = ToBeClassified;
            Caption = '% assurances';
        }
        field(30; "% commissions"; Decimal)
        {
            DataClassification = ToBeClassified;
            Caption = '% commissions';
        }
        field(31; "% transit"; Decimal)
        {
            DataClassification = ToBeClassified;
            Caption = '% transit';
        }
        field(32; "Volume commande"; Decimal)
        {
            DataClassification = ToBeClassified;
            Caption = 'Volume commande';
        }
        field(40; "No. ligne"; Text[250])
        {
            DataClassification = ToBeClassified;
            Caption = 'No. ligne';
        }
        field(41; "Quantité achetée"; Decimal)
        {
            DataClassification = ToBeClassified;
            Caption = 'Quantité achetée';
        }
        field(42; "Prix achat (dev soc)"; Decimal)
        {
            DataClassification = ToBeClassified;
            Caption = 'Prix achat (devise société)';
        }
        field(43; "Montant ligne achat"; Decimal)
        {
            DataClassification = ToBeClassified;
            Caption = 'Montant ligne achat';
        }
        field(44; "Volume"; Decimal)
        {
            DataClassification = ToBeClassified;
            Caption = 'Volume';
        }
        field(45; "Coût transport rout. (dev soc)"; Decimal)
        {
            DataClassification = ToBeClassified;
            Caption = 'Coût transport routier (devise société)';
        }
        field(46; "Montant frais fin. (dev soc)"; Decimal)
        {
            DataClassification = ToBeClassified;
            Caption = 'Montant frais financiers (devise société)';
        }
        field(47; "Montant assurances (dev soc)"; Decimal)
        {
            DataClassification = ToBeClassified;
            Caption = 'Montant assurances (devise société)';
        }
        field(48; "Montant commissions (dev soc)"; Decimal)
        {
            DataClassification = ToBeClassified;
            Caption = 'Montant commissions (devise société)';
        }
        field(49; "Montant transit (dev soc)"; Decimal)
        {
            DataClassification = ToBeClassified;
            Caption = 'Montant transit (devise société)';
        }
        field(50; "Montant frais douane (dev soc)"; Decimal)
        {
            DataClassification = ToBeClassified;
            Caption = 'Montant frais douane (devise société)';
        }
        field(51; "CU net douane (dev soc)"; Decimal)
        {
            DataClassification = ToBeClassified;
            Caption = 'CU net douane (devise société)';
        }
        field(52; "% droit douane"; Decimal)
        {
            DataClassification = ToBeClassified;
            Caption = '% droit douane';
        }
        field(53; "Coût transport marit. (devsoc)"; Decimal)
        {
            DataClassification = ToBeClassified;
            Caption = 'Coût transport maritime (devise société)';
        }
        field(54; "% remise ligne"; Decimal)
        {
            DataClassification = ToBeClassified;
            Caption = '% remise ligne';
        }
        field(55; "Frais annexes (dev soc)"; Decimal)
        {
            DataClassification = ToBeClassified;
            Caption = 'Frais annexes (devise société)';
        }
        field(60; "PRT"; Decimal)
        {
            DataClassification = ToBeClassified;
            Caption = 'PRT';
        }
        field(61; "Coût unitaire direct"; Decimal)
        {
            DataClassification = ToBeClassified;
            Caption = 'Coût unitaire direct';
        }
        field(62; "Montant taxe anti-dumping"; Decimal)
        {
            DataClassification = ToBeClassified;
            Caption = 'Montant taxe anti-dumping';
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
