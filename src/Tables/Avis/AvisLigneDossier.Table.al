table 50260 "AvisLigneDossier"
{
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "Code credoc"; Code[19])
        {
            DataClassification = CustomerContent;
            Caption = 'Code credoc';
            Description = 'CREDOC - REVIMPORT - 24/09/24 REV24';
            TableRelation = "Credoc"."Code";
        }
    }

    keys
    {
        key(PK; "Code credoc")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
        // Add changes to field groups here
    }

    var

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