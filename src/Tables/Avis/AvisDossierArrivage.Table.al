// Liaison Table Credoc / Avis / Avis ligne dossier
table 50257 AvisDossierArrivage
{
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "No. dossier"; Code[10])
        {
            DataClassification = AccountData;
            Caption = 'No. dossier';
            Description = 'AVIS_DOSSIER_ARRIVAGE - REVIMPORT - 23/09/24 REV24';
            Editable = true;
            NotBlank = true;
            TableRelation = "DossierArrivage"."No. Dossier";
        }
        field(2; "Code credoc"; Code[19])
        {
            DataClassification = AccountData;
            Caption = 'Code credoc';
            Description = 'AVIS_DOSSIER_ARRIVAGE - REVIMPORT - 23/09/24 REV24';
            Editable = true;
            TableRelation = "Credoc"."Code";
        }
        field(3; "No. ligne avis"; Integer)
        {
            DataClassification = AccountData;
            Caption = 'No. ligne avis';
            Description = 'AVIS_DOSSIER_ARRIVAGE - REVIMPORT - 23/09/24 REV24';
            Editable = true;
            BlankNumbers = DontBlank;
            TableRelation = "Avis"."No. Ligne" where("Code credoc" = field("Code credoc"));
        }
        field(4; "Type"; Option)
        {
            DataClassification = AccountData;
            Caption = 'Type';
            Description = 'AVIS_DOSSIER_ARRIVAGE - REVIMPORT - 23/09/24 REV24';
            Editable = false;
            BlankNumbers = DontBlank;
            OptionMembers = "Marchandise","Financier","Avoir qualité","Escompte","Autre";
        }
        field(8; "Montant affecté"; Decimal)
        {
            DataClassification = AccountData;
            Caption = 'Montant affecté';
            Description = 'AVIS_DOSSIER_ARRIVAGE - REVIMPORT - 23/09/24 REV24';
            Editable = true;
            BlankNumbers = DontBlank;
            AutoFormatType = 1;
        }
        field(9; "Prévisionnel"; Boolean)
        {
            Caption = 'Prévisionnel';
            Description = 'AVIS_DOSSIER_ARRIVAGE - REVIMPORT - 23/09/24 REV24';
            Editable = false;
            BlankNumbers = DontBlank;
            FieldClass = FlowField;
            CalcFormula = lookup("Avis"."Prévisionnel" where("Code credoc" = field("Code credoc"), "No. ligne" = field("No. ligne avis")));
        }
        field(10; "Mnt total lignes affectées"; Decimal)
        {
            Caption = 'Mnt total lignes affectées';
            Description = 'AVIS_DOSSIER_ARRIVAGE - REVIMPORT - 23/09/24 REV24';
            Editable = false;
            BlankNumbers = DontBlank;
            AutoFormatType = 1;
            FieldClass = FlowField;
            CalcFormula = Sum("AvisLigneDossier"."Montant ligne (dev soc)" WHERE("Code credoc" = FIELD("Code credoc"), "No. ligne avis" = FIELD("No. ligne avis"), "No. dossier" = FIELD("No. dossier"), "Affectation" = CONST(true)));
        }
        field(11; "Affectation partielle"; Boolean)
        {
            Caption = 'Affectation partielle';
            Description = 'AVIS_DOSSIER_ARRIVAGE - REVIMPORT - 23/09/24 REV24';
            Editable = false;
            BlankNumbers = DontBlank;
            FieldClass = FlowField;
            CalcFormula = Exist("AvisLigneDossier" WHERE("No. dossier" = FIELD("No. dossier"), "Code credoc" = FIELD("Code credoc"), "No. ligne avis" = FIELD("No. ligne avis"), "Affectation" = CONST(false)));
        }
        field(12; "Mnt affecté total lig affect"; Decimal)
        {
            Caption = 'Mnt affecté total lig affect';
            Description = 'AVIS_DOSSIER_ARRIVAGE - REVIMPORT - 23/09/24 REV24';
            Editable = false;
            BlankNumbers = DontBlank;
            AutoFormatType = 1;
            FieldClass = FlowField;
            CalcFormula = Sum("AvisLigneDossier"."Montant affecté" WHERE("No. dossier" = FIELD("No. dossier"), "Code credoc" = FIELD("Code credoc"), "No. ligne avis" = FIELD("No. ligne avis"), "Affectation" = CONST(true)));
        }
        field(13; "Vol total lignes affectées"; Decimal)
        {
            Caption = 'Vol total lignes affectées';
            Description = 'AVIS_DOSSIER_ARRIVAGE - REVIMPORT - 23/09/24 REV24';
            Editable = true;
            BlankNumbers = DontBlank;
            FieldClass = FlowField;
            CalcFormula = Sum("AvisLigneDossier"."Volume ligne" WHERE("No. dossier" = FIELD("No. dossier"), "Code credoc" = FIELD("Code credoc"), "No. ligne avis" = FIELD("No. ligne avis"), "Affectation" = CONST(true)));
        }
        field(14; "Code devise"; Code[10])
        {
            Caption = 'Code devise';
            Description = 'AVIS_DOSSIER_ARRIVAGE - REVIMPORT - 23/09/24 REV24';
            Editable = false;
            FieldClass = FlowField;
            CalcFormula = Lookup(Avis."Code devise" WHERE("Code credoc" = FIELD("Code credoc"), "No. ligne" = FIELD("No. ligne avis")));
        }
    }

    keys
    {
        key(PK; "No. dossier", "Code credoc", "No. ligne avis")
        {
            Clustered = true;
            SumIndexFields = "Montant affecté";
        }
        key(SecondaryKey; "Type")
        {
            Enabled = true;
            SumIndexFields = "Montant affecté";
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