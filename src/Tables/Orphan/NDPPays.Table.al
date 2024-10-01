table 50287 "NDPPays"
{
    Caption = 'NDP / PAYS';
    fields
    {
        field(1; "No. nomenclature douanière"; Code[10])
        {
            DataClassification = AccountData;
            Caption = 'No. nomenclature douanière';
            Description = 'NDP_PAYS - LN - 01/10/24 REV24';
            NotBlank = true;
            Numeric = true;
            TableRelation = "Tariff Number"."No.";
        }
        field(2; "Code pays origine"; Code[10])
        {
            DataClassification = AccountData;
            Caption = 'Code pays origine';
            Description = 'NDP_PAYS - LN - 01/10/24 REV24';
            TableRelation = "Country/Region"."Code";
        }
        field(3; "Taux réduit douane"; Decimal)
        {
            DataClassification = AccountData;
            Caption = 'Taux réduit douane';
            Description = 'NDP_PAYS - LN - 01/10/24 REV24';
            BlankNumbers = DontBlank;
            MinValue = 0;
            MaxValue = 100;
        }
        field(4; "License"; Boolean)
        {
            DataClassification = AccountData;
            Caption = 'License';
            Description = 'NDP_PAYS - LN - 01/10/24 REV24';
            BlankNumbers = DontBlank;
        }
        field(5; "Document surveillance"; Boolean)
        {
            DataClassification = AccountData;
            Caption = 'Document surveillance';
            Description = 'NDP_PAYS - LN - 01/10/24 REV24';
            BlankNumbers = DontBlank;
        }
    }

    keys
    {
        key(PK; "No. nomenclature douanière", "Code pays origine")
        {
            Clustered = true;
        }
    }



}