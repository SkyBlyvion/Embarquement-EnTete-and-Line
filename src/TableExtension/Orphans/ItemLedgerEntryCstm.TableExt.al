tableextension 50294 "ItemLedgerEntryCstm" extends "Item Ledger Entry"
{
    fields
    {
        field(50000; "No. dossier"; Code[10])
        {
            Caption = 'No. dossier';
            Description = 'DOSSIER_ARRIVAGE LN 04/10/24 REV24';
            DataClassification = CustomerContent;
        }
        field(50001; "Date disponibilité Perpignan"; Date)
        {
            Caption = 'Date disponibilité Perpignan';
            Description = 'DOSSIER_ARRIVAGE LN 04/10/24 REV24';
            DataClassification = CustomerContent;
            BlankNumbers = DontBlank;
        }
        field(50002; "Origine"; Code[20])
        {
            Caption = 'Origine';
            Description = 'ECRITURE_ARTICLE LN 04/10/24 REV24';
            DataClassification = CustomerContent;
        }
        field(50003; "Promotion"; Boolean)
        {
            Caption = 'Promotion';
            Description = 'ECRITURE_ARTICLE LN 04/10/24 REV24';
            DataClassification = CustomerContent;
            BlankNumbers = DontBlank;
        }
        field(50004; "Avoir financier"; Boolean)
        {
            Caption = 'Avoir financier';
            Description = 'ECRITURE_ARTICLE LN 04/10/24 REV24';
            DataClassification = CustomerContent;
            BlankNumbers = DontBlank;
        }
    }

    keys
    {
        // Add changes to keys here
    }

    fieldgroups
    {
        // Add changes to field groups here
    }

    var
}