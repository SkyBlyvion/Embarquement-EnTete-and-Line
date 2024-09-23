table 50248 "HistoriquePRRTable"
{
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "No. calcul"; Integer)
        {
            DataClassification = ToBeClassified;
            Caption = 'N° calcul';
            Description = 'HISTORIQUE_PRR - REVIMPORT - 11/09/24 REV24';
            Editable = false;
            BlankNumbers = DontBlank;
        }
        field(2; "No. article"; Code[20])
        {
            DataClassification = ToBeClassified;
            Caption = 'N° article';
            Description = 'HISTORIQUE_PRR - REVIMPORT - 11/09/24 REV24';
            Editable = false;
            TableRelation = "Item"."No.";
        }
        field(3; "Date"; Date)
        {
            DataClassification = SystemMetadata;
            Caption = 'Date';
            Description = 'HISTORIQUE_PRR - REVIMPORT - 11/09/24 REV24';
            Editable = false;
            BlankNumbers = DontBlank;
        }
        field(4; "Heure"; Time)
        {
            DataClassification = SystemMetadata;
            Caption = 'Heure';
            Description = 'HISTORIQUE_PRR - REVIMPORT - 11/09/24 REV24';
            Editable = false;
            BlankNumbers = DontBlank;
        }
        field(5; "Définitif"; Boolean)
        {
            DataClassification = ToBeClassified;
            Caption = 'Définitif';
            Description = 'HISTORIQUE_PRR - REVIMPORT - 11/09/24 REV24';
            BlankNumbers = DontBlank;
        }
        field(10; "No. fournisseur"; Code[20])
        {
            DataClassification = ToBeClassified;
            Caption = 'N° fournisseur';
            Description = 'HISTORIQUE_PRR - REVIMPORT - 11/09/24 REV24';
            Editable = false;
            TableRelation = "Vendor"."No.";
        }
        field(11; "No. réception"; Text[250])
        {
            DataClassification = ToBeClassified;
            Caption = 'N° réception';
            Description = 'HISTORIQUE_PRR - REVIMPORT - 11/09/24 REV24';
            Editable = false;
            TableRelation = "Purch. Rcpt. Header"."No.";
        }
        field(15; "Incoterm"; Option)
        {
            DataClassification = ToBeClassified;
            Caption = 'Incoterm';
            Description = 'HISTORIQUE_PRR - REVIMPORT - 11/09/24 REV24';
            BlankNumbers = DontBlank;
            Editable = false;
            OptionMembers = EXW,FOB,CNI,CFR,CNF,CIF;
        }
        field(16; "Mnt affecté total / avis"; Decimal)
        {
            DataClassification = ToBeClassified;
            Caption = 'Mnt affecté total / avis';
            Description = 'HISTORIQUE_PRR - REVIMPORT - 11/09/24 REV24';
            BlankNumbers = DontBlank;
            AutoFormatType = 2;
            Editable = false;
        }
        field(17; "Mnt affecté total / prest"; Decimal)
        {
            DataClassification = ToBeClassified;
            Caption = 'Mnt affecté total / prest';
            Description = 'HISTORIQUE_PRR - REVIMPORT - 11/09/24 REV24';
            BlankNumbers = DontBlank;
            AutoFormatType = 2;
            Editable = false;
        }
        field(18; "Eléments estimés"; Text[15])
        {
            DataClassification = ToBeClassified;
            Caption = 'Eléments estimés';
            Description = 'HISTORIQUE_PRR - REVIMPORT - 11/09/24 REV24';
            Editable = false;
        }
        field(20; "Mnt affecté total déduction"; Decimal)
        {
            DataClassification = ToBeClassified;
            Caption = 'Mnt affecté total déduction';
            Description = 'HISTORIQUE_PRR - REVIMPORT - 11/09/24 REV24';
            BlankNumbers = DontBlank;
            AutoFormatType = 2;
            Editable = false;
        }
        field(32; "Volume dossier"; Decimal)
        {
            DataClassification = ToBeClassified;
            Caption = 'Volume dossier';
            Description = 'HISTORIQUE_PRR - REVIMPORT - 11/09/24 REV24';
            BlankNumbers = DontBlank;
            Editable = false;
        }
        field(39; "No. dossier"; Code[10])
        {
            DataClassification = ToBeClassified;
            Caption = 'N° dossier';
            Description = 'HISTORIQUE_PRR - REVIMPORT - 11/09/24 REV24';
            Editable = false;
            TableRelation = "DossierArrivage"."No. Dossier";
        }
        field(40; "No. ligne dossier"; Text[250])
        {
            DataClassification = ToBeClassified;
            Caption = 'N° ligne dossier';
            Editable = false;
            Description = 'HISTORIQUE_PRR - REVIMPORT - 11/09/24 REV24';
        }
        field(41; "Quantité"; Decimal)
        {
            DataClassification = ToBeClassified;
            Caption = 'Quantité';
            Description = 'HISTORIQUE_PRR - REVIMPORT - 11/09/24 REV24';
            BlankNumbers = DontBlank;
            DecimalPlaces = 0 : 5;
            Editable = false;
        }
        field(42; "Prix achat (dev soc)"; Decimal)
        {
            DataClassification = ToBeClassified;
            Caption = 'Prix achat (devise société)';
            Description = 'HISTORIQUE_PRR - REVIMPORT - 11/09/24 REV24';
            BlankNumbers = DontBlank;
            AutoFormatType = 2;
            Editable = false;
        }
        field(43; "Montant (dev soc)"; Decimal)
        {
            DataClassification = ToBeClassified;
            Caption = 'Montant (devise société)';
            Description = 'HISTORIQUE_PRR - REVIMPORT - 11/09/24 REV24';
            BlankNumbers = DontBlank;
            AutoFormatType = 2;
            Editable = false;
        }
        field(44; "Volume"; Decimal)
        {
            DataClassification = ToBeClassified;
            Caption = 'Volume';
            Description = 'HISTORIQUE_PRR - REVIMPORT - 11/09/24 REV24';
            BlankNumbers = DontBlank;
            Editable = false;
        }
        field(54; "% remise moyen"; Decimal)
        {
            DataClassification = ToBeClassified;
            Caption = '% remise moyen';
            Description = 'HISTORIQUE_PRR - REVIMPORT - 11/09/24 REV24';
            BlankNumbers = DontBlank;
            DecimalPlaces = 0 : 5;
            Editable = false;
        }
        field(55; "% avoir qualité"; Decimal)
        {
            DataClassification = ToBeClassified;
            Caption = '% avoir qualité';
            Description = 'HISTORIQUE_PRR - REVIMPORT - 11/09/24 REV24';
            BlankNumbers = DontBlank;
            Editable = false;
        }
        field(56; "% escompte"; Decimal)
        {
            DataClassification = ToBeClassified;
            Caption = '% escompte';
            Description = 'HISTORIQUE_PRR - REVIMPORT - 11/09/24 REV24';
            BlankNumbers = DontBlank;
            Editable = false;
        }
        field(60; "PRR"; Decimal)
        {
            DataClassification = ToBeClassified;
            Caption = 'PRR';
            Description = 'HISTORIQUE_PRR - REVIMPORT - 11/09/24 REV24';
            BlankNumbers = DontBlank;
            AutoFormatType = 2;
            Editable = true;
        }
        field(61; "Code devise"; Code[10])
        {
            DataClassification = ToBeClassified;
            Caption = 'Code devise';
            Description = 'HISTORIQUE_PRR - REVIMPORT - 11/09/24 REV24';
            TableRelation = "Currency"."Code";
        }
        field(62; "Facteur devise"; Decimal)
        {
            DataClassification = ToBeClassified;
            Caption = 'Facteur devise';
            Description = 'HISTORIQUE_PRR - REVIMPORT - 11/09/24 REV24';
            BlankNumbers = DontBlank;
        }
        field(63; "Montant"; Decimal)
        {
            DataClassification = ToBeClassified;
            Caption = 'Montant';
            Description = 'HISTORIQUE_PRR - REVIMPORT - 11/09/24 REV24';
            BlankNumbers = DontBlank;
        }
        field(64; "Code credoc Avis source"; Code[19])
        {
            DataClassification = ToBeClassified;
            Caption = 'Code credoc Avis source';
            Description = 'HISTORIQUE_PRR - REVIMPORT - 11/09/24 REV24';
            Editable = false;
        }
        field(65; "No. ligne Avis source"; Integer)
        {
            DataClassification = ToBeClassified;
            Caption = 'N° ligne Avis source';
            Description = 'HISTORIQUE_PRR - REVIMPORT - 11/09/24 REV24';
            Editable = false;
            BlankNumbers = DontBlank;
        }
        field(66; "Date creation Dossier"; Date)
        {
            DataClassification = SystemMetadata;
            Caption = 'Date création Dossier';
            Description = 'HISTORIQUE_PRR - REVIMPORT - 11/09/24 REV24';
            BlankNumbers = DontBlank;
            Editable = false;
        }
        field(67; "Cout unitaire direct"; Decimal)
        {
            DataClassification = ToBeClassified;
            Caption = 'Coût unitaire direct';
            Description = 'HISTORIQUE_PRR - REVIMPORT - 11/09/24 REV24';
            BlankNumbers = DontBlank;
            Editable = false;
        }
    }

    keys
    {
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
        key(SecondaryKey2; "Définitif")
        {
            Enabled = true;
        }

        //  Accélère les recherches d'articles par date.
        key(SecondaryKey3; "No. article", "Date")
        {
            Enabled = true;
        }

        // Permet un accès rapide aux détails filtrés par date, article, et commande.
        key(SecondaryKey4; "Date", "Heure", "No. article", "No. dossier")
        {
            Enabled = true;
        }

        key(SecondaryKey5; "No. article", "Date creation dossier")
        {
            Enabled = true;
        }

    }

}