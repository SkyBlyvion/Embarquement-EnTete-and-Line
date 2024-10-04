tableextension 50293 PurchRcptLine extends "Purch. Rcpt. Line"
{
    fields
    {
        field(50000; "No. dossier"; Code[10])
        {
            Caption = 'No. dossier';
            Description = 'DOSSIER_ARRIVAGE LN 04/10/24 REV24';
            DataClassification = CustomerContent;
            TableRelation = DossierArrivage."No. dossier";
        }
        field(50001; "Date d'embarquement"; Date)
        {
            Caption = 'Date d''embarquement';
            Description = 'EMBARQUEMENT LN 04/10/24 REV24';
            DataClassification = CustomerContent;
            BlankNumbers = DontBlank;
        }
        field(50002; "Coût unitaire (Pièce)"; Decimal)
        {
            Caption = 'Coû unitaire (Pièce)';
            Description = 'LIGNE_RECEPTION_ACHAT LN 04/10/24 REV24';
            DataClassification = CustomerContent;
            BlankNumbers = DontBlank;
        }
        field(50003; "Date de relance"; Date)
        {
            Caption = 'Date de relance';
            Description = 'LIGNE_RECEPTION_ACHAT LN 04/10/24 REV24';
            DataClassification = CustomerContent;
            BlankNumbers = DontBlank;
        }
        field(50004; "Volume (unitaire)"; Decimal)
        {
            Caption = 'Volume unitaire';
            Description = 'VOLUME_POIDS LN 04/10/24 REV24';
            DataClassification = CustomerContent;
            BlankNumbers = DontBlank;
            DecimalPlaces = 3 : 3;
        }
        field(50005; "Volume"; Decimal)
        {
            Caption = 'Volume';
            Description = 'VOLUME_POIDS LN 04/10/24 REV24';
            DataClassification = CustomerContent;
            BlankNumbers = DontBlank;
            DecimalPlaces = 3 : 3;
        }
        field(50006; "Poids (unitaire)"; Decimal)
        {
            Caption = 'Poids unitaire';
            Description = 'VOLUME_POIDS LN 04/10/24 REV24';
            DataClassification = CustomerContent;
            BlankNumbers = DontBlank;
            DecimalPlaces = 3 : 3;
        }
        field(50007; "Poids"; Decimal)
        {
            Caption = 'Poids';
            Description = 'VOLUME_POIDS LN 04/10/24 REV24';
            DataClassification = CustomerContent;
            BlankNumbers = DontBlank;
            DecimalPlaces = 3 : 3;
        }

    }

    keys
    {

        key(Key8; "Buy-from Vendor No.", "Document No.")
        {
            Enabled = true;
        }
    }

    fieldgroups
    {
        // Add changes to field groups here
    }

    var

}