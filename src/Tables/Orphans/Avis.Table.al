table 50258 Avis
{
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "Code credoc"; Code[19])
        {
            DataClassification = CustomerContent;
            Caption = 'Code credoc';
            Description = 'AVIS - REVIMPORT - 23/09/24 REV24';
            Editable = true;
            TableRelation = "Credoc"."Code";
        }
        field(2; "No. ligne"; Integer)
        {
            DataClassification = AccountData;
            Caption = 'No. ligne';
            Description = 'AVIS - REVIMPORT - 23/09/24 REV24';
            Editable = true;
            BlankNumbers = DontBlank;
        }
        field(3; "Date"; Date)
        {
            DataClassification = SystemMetadata;
            Caption = 'Date';
            Description = 'AVIS - REVIMPORT - 23/09/24 REV24';
            Editable = true;
            BlankNumbers = DontBlank;
        }
        field(4; "Type"; Option)
        {
            DataClassification = AccountData;
            Caption = 'Type';
            Description = 'AVIS - REVIMPORT - 23/09/24 REV24';
            Editable = true;
            BlankNumbers = DontBlank;
            OptionMembers = "Marchandise","Financier","Avoir qualité","Escompte","Autre";
        }
        field(5; "Montant"; Decimal)
        {
            DataClassification = AccountData;
            Caption = 'Montant';
            Description = 'AVIS - REVIMPORT - 23/09/24 REV24';
            Editable = true;
            BlankNumbers = DontBlank;
            AutoFormatType = 1;
        }
    }

    keys
    {
        key(Key1; MyField)
        {
            Clustered = true;
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