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
        }
        field(11; "Cout unitaire direct"; Decimal)
        {
            DataClassification = AccountData;
            Caption = 'Cout unitaire direct';
            Description = 'LIGNE_DOSSIER_ARRIVAGE LN 23/09/24 REV24';
            Editable = true;
            BlankNumbers = DontBlank;
            AutoFormatType = 2;
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
        myInt: Integer;

    trigger OnInsert()
    begin

    end;

    trigger OnModify()
    begin

    end;

    trigger OnDelete()
    begin

    end;

    trigger OnRename()
    begin

    end;

}