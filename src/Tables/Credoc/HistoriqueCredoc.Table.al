table 50279 HistoriqueCredoc
{
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "Code credoc"; Code[19])
        {
            DataClassification = CustomerContent;
            Caption = 'Code credoc';
            Description = 'CREDOC - LN - 26/09/24 REV24';
            Editable = true;
        }
        field(2; "Date validité"; Date)
        {
            DataClassification = SystemMetadata;
            Caption = 'Date validité';
            Description = 'CREDOC - LN - 26/09/24 REV24';
            Editable = true;
            BlankNumbers = DontBlank;
        }
        field(3; "Montant initial"; Decimal)
        {
            DataClassification = CustomerContent;
            Caption = 'Montant initial';
            Description = 'CREDOC - LN - 26/09/24 REV24';
            Editable = true;
            BlankNumbers = DontBlank;
        }
        field(4; "Date modification"; Date)
        {
            DataClassification = SystemMetadata;
            Caption = 'Date modification';
            Description = 'CREDOC - LN - 26/09/24 REV24';
            Editable = true;
            BlankNumbers = DontBlank;
        }
    }

    keys
    {
        key(PK; "Code credoc", "Date validité", "Montant initial", "Date modification")
        {
            Clustered = true;
        }
    }



}