table 50254 "PrestationLigneDossier"
{
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "No. prestation"; Code[10])
        {
            DataClassification = CustomerContent;
            Caption = 'No. prestation';
            Description = 'PRESTATION_LIGNE_DOSSIER - REVIMPORT - 13/09/24 REV24';
            Editable = false;
            TableRelation = "Prestation"."No.";
        }
        field(2; "No. dossier"; Code[20])
        {
            DataClassification = CustomerContent;
            Caption = 'No. dossier';
            Description = 'PRESTATION_LIGNE_DOSSIER - REVIMPORT - 13/09/24 REV24';
            Editable = false;
            TableRelation = "LigneDossierArrivage"."No. Dossier"; //TODO: remplir la LigneDossierArrivage
        }
        field(3; "No. ligne dossier"; Integer)
        {
            DataClassification = CustomerContent;
            Caption = 'No. ligne dossier';
            Description = 'PRESTATION_LIGNE_DOSSIER - REVIMPORT - 13/09/24 REV24';
            Editable = false;
        }
        field(4; "Affectation"; Boolean)
        {
            DataClassification = CustomerContent;
            Caption = 'Affectation';
            Description = 'PRESTATION_LIGNE_DOSSIER - REVIMPORT - 13/09/24 REV24';
            Editable = true;
            BlankNumbers = DontBlank;
        }
        field(5; "Montant affecté"; Decimal)
        {
            DataClassification = CustomerContent;
            Caption = 'Montant affecté';
            Description = 'PRESTATION_LIGNE_DOSSIER - REVIMPORT - 13/09/24 REV24';
            Editable = true;
            BlankNumbers = DontBlank;
        }
        field(6; "Type"; Option)
        {

        }
    }

    keys
    {
        key(PK; "No. prestation", "No. dossier", "No. ligne dossier")
        {
            Clustered = true;
        }

        key(Key2; "Type")
        {
            Enabled = true;
            SumIndexFields = "Montant affecté";
        }

        key(3; "Affectation")
        {
            Enabled = true;
            SumIndexFields = "Montant affecté", "Montant ligne (dev soc)", "Volume ligne";
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