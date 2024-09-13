table 50251 "PrestationDossierArrivage"
{
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "No. Dossier"; Code[10])
        {
            DataClassification = CustomerContent;
            Caption = 'No. Dossier';
            Description = 'PRESTATION_DOSSIER_ARRIVAGE - REVIMPORT - 13/09/24 REV24';
            Editable = true;
            NotBlank = true;
            TableRelation = "DossierArrivage"."No. Dossier";
        }
        field(2; "No. prestation"; Code[10])
        {
            DataClassification = CustomerContent;
            Caption = 'No. prestation';
            Description = 'PRESTATION_DOSSIER_ARRIVAGE - REVIMPORT - 13/09/24 REV24';
            Editable = true;
            TableRelation = "Prestation"."Code";
        }
        field(3; "Type"; Option)
        {
            DataClassification = CustomerContent;
            Caption = 'Type';
            Description = 'PRESTATION_DOSSIER_ARRIVAGE - REVIMPORT - 13/09/24 REV24';
            Editable = false;
            NotBlank = true;
            OptionMembers = "Frais de transport","Frais Financiers","Assurances","Commissions","Transit","Douane";
        }
        field(8; "Montant affecté"; Decimal)
        {
            DataClassification = CustomerContent;
            Caption = 'Montant affecté';
            Description = 'PRESTATION_DOSSIER_ARRIVAGE - REVIMPORT - 13/09/24 REV24';
            Editable = true;
        }
        field(9; "Prévisionnel"; Boolean)
        {
            Caption = 'Prévisionnel';
            Description = 'PRESTATION_DOSSIER_ARRIVAGE - REVIMPORT - 13/09/24 REV24';
            Editable = false;
            FieldClass = FlowField;
            CalcFormula = lookup("Prestation"."Prévisionnel" WHERE("No." = FIELD("No. prestation")));
        }
        field(10; "Mnt total lignes affectées"; Decimal)
        {
            Caption = 'Mnt total lignes affectées';
            Description = 'PRESTATION_DOSSIER_ARRIVAGE - REVIMPORT - 13/09/24 REV24';
            Editable = false;
            FieldClass = FlowField;
            CalcFormula = Sum("Prestation / ligne dossier"."Montant ligne (dev soc)" WHERE("No. prestation" = FIELD("No. prestation"), "No. dossier" = FIELD("No. dossier"), "Affectation" = CONST("Yes")));
        } // Sum("Prestation / ligne dossier"."Montant ligne (dev soc)" WHERE (N° prestation=FIELD(N° prestation),N° dossier=FIELD(N° dossier),Affectation=CONST(Yes)))
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