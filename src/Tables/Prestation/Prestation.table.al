table 50253 Prestation
{
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "No."; Code[10])
        {
            DataClassification = CustomerContent;
            Caption = 'No.';
            Description = 'PRESTATION - REVIMPORT - 13/09/24 REV24';
            Editable = true;
            NotBlank = false;
        }
        field(2; "No. document"; Code[20])
        {
            DataClassification = CustomerContent;
            Caption = 'No. document';
            Description = 'PRESTATION - REVIMPORT - 13/09/24 REV24';
            Editable = true;
            NotBlank = false;
        }
        field(3; "Date"; Date)
        {
            DataClassification = SystemMetadata;
            Caption = 'Date';
            Description = 'PRESTATION - REVIMPORT - 13/09/24 REV24';
            Editable = true;
            NotBlank = true;
            ClosingDates = false;
        }
        field(4; "Type"; Option)
        {
            DataClassification = CustomerContent;
            Caption = 'Type';
            Description = 'PRESTATION - REVIMPORT - 13/09/24 REV24';
            Editable = true;
            NotBlank = true;
            BlankNumbers = DontBlank;
            OptionMembers = "Frais de transport","Frais Financiers","Assurances","Commissions","Transit","Douane";
        }
        field(5; "Montant"; Decimal)
        {
            DataClassification = CustomerContent;
            Caption = 'Montant';
            Description = 'PRESTATION - REVIMPORT - 13/09/24 REV24';
            Editable = true;
            NotBlank = false;
        }
        field(6; "Code devise"; Code[10])
        {
            DataClassification = SystemMetadata;
            Caption = 'Code devise';
            Description = 'PRESTATION - REVIMPORT - 13/09/24 REV24';
            Editable = true;
            NotBlank = false;
            TableRelation = "Currency"."Code";
        }
        field(7; "Facteur devise"; Decimal)
        {
            DataClassification = CustomerContent;
            BlankNumbers = DontBlank;
            Editable = false;
            MinValue = 0;
            DecimalPlaces = 1 : 15;
        }
        field(8; "Imputé"; Boolean)
        {
            Caption = 'Imputé';
            Description = 'PRESTATION - REVIMPORT - 13/09/24 REV24';
            Editable = false;
            NotBlank = false;
            FieldClass = FlowField;
            InitValue = false;
            CalcFormula = Exist("PrestationDossierArrivage" WHERE("No. prestation" = FIELD("No.")));
        }
        field(9; "Mnt affecté total (doss)"; Decimal)
        {
            Caption = 'Mnt affecté total (doss)';
            Description = 'PRESTATION - REVIMPORT - 13/09/24 REV24';
            Editable = false;
            BlankNumbers = DontBlank;
            FieldClass = FlowField;
            CalcFormula = Sum("PrestationDossierArrivage"."Montant affecté" WHERE("No. prestation" = FIELD("No.")));
        }
        field(10; "Mnt affecté total (lig doss)"; Decimal)
        {
            Caption = 'Mnt affecté total (lig doss)';
            Description = 'PRESTATION - REVIMPORT - 13/09/24 REV24';
            Editable = true;
            BlankNumbers = DontBlank;
            FieldClass = FlowField;
            CalcFormula = Sum("Prestation / ligne dossier"."Montant affecté" WHERE("No. prestation" = FIELD("No."), "Affectation" = CONST(Yes)));
        }
        field(11; "Mnt total lig doss affectées"; Decimal)
        {
            Caption = 'Mnt total lig doss affectées';
            Description = 'PRESTATION - REVIMPORT - 13/09/24 REV24';
            Editable = true;
            BlankNumbers = DontBlank;
            FieldClass = FlowField;
            CalcFormula = Sum("Prestation / ligne dossier"."Montant ligne (dev soc)" WHERE("No. prestation" = FIELD("No."), "Affectation" = CONST(Yes)));
        }
        field(12; "Vol total lig doss affectées"; Decimal)
        {
            Caption = 'Vol total lig doss affectées';
            Description = 'PRESTATION - REVIMPORT - 13/09/24 REV24';
            Editable = true;
            BlankNumbers = DontBlank;
            FieldClass = FlowField;
            CalcFormula = Sum("Prestation / ligne dossier"."Volume ligne" WHERE("No. prestation" = FIELD("No."), "Affectation" = CONST(Yes)));
        }
        field(13; "Prévisionnel"; Boolean)
        {
            DataClassification = CustomerContent;
            Caption = 'Prévisionnel';
            Description = 'PRESTATION - REVIMPORT - 13/09/24 REV24';
            Editable = true;
            NotBlank = false;
        }
        field(15; "Souches de No."; Code[10])
        {
            DataClassification = SystemMetadata;
            Caption = 'Souche de No.';
            Description = 'PRESTATION - REVIMPORT - 13/09/24 REV24';
            Editable = false;
            TableRelation = "No. Series"."Code";
        }
    }



    keys
    {
        key(PK; "No.")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
        // Add changes to field groups here
    }

    var
        Dossier: Record "DossierArrivage";
        DeviseTauxChange: Record "Currency Exchange Rate";
        Prest: Record "Prestation";
        ParamAchat: Record "Purchases & Payables Setup";
        PrestDossier: Record "PrestationDossierArrivage";
        GestionNoSouche: Codeunit "NoSeriesManagement";


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