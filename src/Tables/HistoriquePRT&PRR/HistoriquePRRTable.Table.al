table 50248 "HistoriquePRRTable"
{
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "No. calcul"; Integer)
        {
            DataClassification = ToBeClassified;
            Caption = 'N° calcul';
        }
        field(2; "No. article"; Code[20])
        {
            DataClassification = ToBeClassified;
            Caption = 'N° article';
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
        field(5; "Définitif"; Boolean)
        {
            DataClassification = ToBeClassified;
            Caption = 'Définitif';
        }
        field(10; "No. fournisseur"; Code[20])
        {
            DataClassification = ToBeClassified;
            Caption = 'N° fournisseur';
            TableRelation = "Vendor"."No.";
        }
        field(11; "No. réception"; Text[250])
        {
            DataClassification = ToBeClassified;
            Caption = 'N° réception';
            TableRelation = "Purch. Rcpt. Header"."No.";
        }
        field(15; "Incoterm"; Option)
        {
            DataClassification = ToBeClassified;
            Caption = 'Incoterm';
            OptionMembers = EXW,FOB,CNI,CFR,CNF,CIF;
        }
        field(16; "Mnt affecté total / avis"; Decimal)
        {
            DataClassification = ToBeClassified;
            Caption = 'Mnt affecté total / avis';
        }
        field(17; "Mnt affecté total / prest"; Decimal)
        {
            DataClassification = ToBeClassified;
            Caption = 'Mnt affecté total / prest';
        }
        field(18; "Eléments estimés"; Text[15])
        {
            DataClassification = ToBeClassified;
            Caption = 'Eléments estimés';
        }
        field(20; "Mnt affecté total déduction"; Decimal)
        {
            DataClassification = ToBeClassified;
            Caption = 'Mnt affecté total déduction';
        }
        field(32; "Volume dossier"; Decimal)
        {
            DataClassification = ToBeClassified;
            Caption = 'Volume dossier';
        }
        field(39; "No. dossier"; Code[10])
        {
            DataClassification = ToBeClassified;
            Caption = 'N° dossier';
            TableRelation = "DossierArrivage"."No. Dossier";// TODO: créer la table "Dossier d'arrivage"
        }
        field(40; "No. ligne dossier"; Text[250])
        {
            DataClassification = ToBeClassified;
            Caption = 'N° ligne dossier';
        }
        field(41; "Quantité"; Decimal)
        {
            DataClassification = ToBeClassified;
            Caption = 'Quantité';
        }
        field(42; "Prix achat (dev soc)"; Decimal)
        {
            DataClassification = ToBeClassified;
            Caption = 'Prix achat (devise société)';
        }
        field(43; "Montant (dev soc)"; Decimal)
        {
            DataClassification = ToBeClassified;
            Caption = 'Montant (devise société)';
        }
        field(44; "Volume"; Decimal)
        {
            DataClassification = ToBeClassified;
            Caption = 'Volume';
        }
        field(54; "% remise moyen"; Decimal)
        {
            DataClassification = ToBeClassified;
            Caption = '% remise moyen';
        }
        field(55; "% avoir qualité"; Decimal)
        {
            DataClassification = ToBeClassified;
            Caption = '% avoir qualité';
        }
        field(56; "% escompte"; Decimal)
        {
            DataClassification = ToBeClassified;
            Caption = '% escompte';
        }
        field(60; "PRR"; Decimal)
        {
            DataClassification = ToBeClassified;
            Caption = 'PRR';
        }
        field(61; "Code devise"; Code[10])
        {
            DataClassification = ToBeClassified;
            Caption = 'Code devise';
            TableRelation = "Currency"."Code";
        }
        field(62; "Facteur devise"; Decimal)
        {
            DataClassification = ToBeClassified;
            Caption = 'Facteur devise';
        }
        field(63; "Montant"; Decimal)
        {
            DataClassification = ToBeClassified;
            Caption = 'Montant';
        }
        field(64; "Code credoc Avis source"; Code[19])
        {
            DataClassification = ToBeClassified;
            Caption = 'Code credoc Avis source';
        }
        field(65; "No. ligne Avis source"; Integer)
        {
            DataClassification = ToBeClassified;
            Caption = 'N° ligne Avis source';
        }
        field(66; "Date creation Dossier"; Date)
        {
            DataClassification = SystemMetadata;
            Caption = 'Date création Dossier';
        }
        field(67; "Cout unitaire direct"; Decimal)
        {
            DataClassification = ToBeClassified;
            Caption = 'Coût unitaire direct';
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