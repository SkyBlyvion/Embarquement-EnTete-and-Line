table 50283 ReglementCredoc
{
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "Code credoc"; Code[19])
        {
            DataClassification = CustomerContent;
            Caption = 'Code credoc';
            Description = 'REGLEMENT_CREDOC - LN - 26/09/24 REV24';
            Editable = true;
        }
        field(2; "No. dossier"; Code[10])
        {
            DataClassification = CustomerContent;
            Caption = 'No. dossier';
            Description = 'REGLEMENT_CREDOC - LN - 26/09/24 REV24';
            Editable = true;
        }
        field(3; "Date"; Date)
        {
            DataClassification = SystemMetadata;
            Caption = 'Date';
            Description = 'REGLEMENT_CREDOC - LN - 26/09/24 REV24';
            BlankNumbers = DontBlank;
            Editable = true;
        }
        field(4; "Montant"; Decimal)
        {
            DataClassification = CustomerContent;
            Caption = 'Montant';
            Description = 'REGLEMENT_CREDOC - LN - 26/09/24 REV24';
            Editable = true;
            BlankNumbers = DontBlank;
        }
    }

    keys
    {
        key(PK; "Code credoc")
        {
            Clustered = true;
        }
    }



}