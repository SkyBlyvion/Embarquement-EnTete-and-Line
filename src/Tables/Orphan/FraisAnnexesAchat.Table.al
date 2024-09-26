table 50272 FraisAnnexesAchat
{
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "Document No."; Code[20])
        {
            DataClassification = CustomerContent;
            Caption = 'Document No.';
            Description = 'FRAISANNEXESACHAT - LN - 25/09/24 REV24';
        }
        field(2; "Item No."; Code[20])
        {
            DataClassification = CustomerContent;
            Caption = 'Item No.';
            Description = 'FRAISANNEXESACHAT - LN - 25/09/24 REV24';
        }
        field(3; "Line No."; Integer)
        {
            DataClassification = CustomerContent;
            Caption = 'Line No.';
            Description = 'FRAISANNEXESACHAT - LN - 25/09/24 REV24';
            BlankNumbers = DontBlank;
        }
        field(4; "Description"; Text[80])
        {
            DataClassification = CustomerContent;
            Caption = 'Description';
            Description = 'FRAISANNEXESACHAT - LN - 25/09/24 REV24';
        }
        field(5; "Amount"; Decimal)
        {
            DataClassification = CustomerContent;
            Caption = 'Amount';
            Description = 'FRAISANNEXESACHAT - LN - 25/09/24 REV24';
            BlankNumbers = DontBlank;
        }
        field(6; "Quantity (pcs)"; Integer)
        {
            DataClassification = CustomerContent;
            Caption = 'Quantity (pcs)';
            Description = 'FRAISANNEXESACHAT - LN - 25/09/24 REV24';
            BlankNumbers = DontBlank;
        }
    }

    keys
    {
        key(PK; "Document No.", "Item No.", "Line No.")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
        // Add changes to field groups here
    }



}