table 50254 "PrestationLigneDossier"
{
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "No. prestation"; Code[10])
        {
            DataClassification = ToBeClassified;
            Caption = 'No. prestation';
            Description = 'PRESTATION_LIGNE_DOSSIER - REVIMPORT - 13/09/24 REV24';
            Editable = false;
            TableRelation = "Prestation"."No.";
        }
        field(2; "No. dossier"; Code[20])
        {
            DataClassification = ToBeClassified;
            Caption = 'No. dossier';
            Description = 'PRESTATION_LIGNE_DOSSIER - REVIMPORT - 13/09/24 REV24';
            Editable = false;
            TableRelation = "LigneDossierArrivage"."No. Dossier"; //TODO: remplir la LigneDossierArrivage
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