table 50259 Credoc
{
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "Code"; Code[19])
        {
            DataClassification = CustomerContent;
            Caption = 'Code';
            Description = 'CREDOC - LN - 24/09/24 REV24';
            NotBlank = true;
        }
        field(2; "Code Banque"; Code[20])
        {
            DataClassification = CustomerContent;
            Caption = 'Code Banque';
            Description = 'CREDOC - LN - 24/09/24 REV24';
            TableRelation = "Bank Account"."No.";
        }
        field(3; "Date ouverture"; Date)
        {
            DataClassification = SystemMetadata;
            Caption = 'Date ouverture';
            Description = 'CREDOC - LN - 24/09/24 REV24';
            BlankNumbers = DontBlank;
        }
        field(4; "Date validité"; Date)
        {
            DataClassification = SystemMetadata;
            Caption = 'Date validité';
            Description = 'CREDOC - LN - 24/09/24 REV24';
            BlankNumbers = DontBlank;
        }
        field(5; "Référence proforma"; Text[30])
        {
            DataClassification = CustomerContent;
            Caption = 'Référence proforma';
            Description = 'CREDOC - LN - 24/09/24 REV24';
        }
        field(6; "Code devise"; Code[10])
        {
            DataClassification = CustomerContent;
            Caption = 'Code devise';
            Description = 'CREDOC - LN - 24/09/24 REV24';
            TableRelation = "Currency"."Code";
        }
        field(7; "Facteur devise"; Decimal)
        {
            DataClassification = CustomerContent;
            Caption = 'Facteur devise';
            Description = 'CREDOC - LN - 24/09/24 REV24';
            Editable = false;
            BlankNumbers = DontBlank;
            AutoFormatType = 0;
            DecimalPlaces = 1 : 15;
            MinValue = 0;
        }
        field(8; "Montant initial"; Decimal)
        {
            DataClassification = CustomerContent;
            Caption = 'Montant initial';
            Description = 'CREDOC - LN - 24/09/24 REV24';
            Editable = true;
            BlankNumbers = DontBlank;
            AutoFormatType = 2;
        }
        field(9; "Montant utilisé"; Decimal)
        {
            DataClassification = CustomerContent;
            Caption = 'Montant utilisé';
            Description = 'CREDOC - LN - 24/09/24 REV24';
            Editable = false;
            BlankNumbers = DontBlank;
            AutoFormatType = 2;
        }
        field(10; "Cloturé"; Boolean)
        {
            DataClassification = CustomerContent;
            Caption = 'Cloturé';
            Description = 'CREDOC - LN - 24/09/24 REV24';
            Editable = true;
            BlankNumbers = DontBlank;
            AutoFormatType = 0;
        }
    }

    keys
    {
        key(Key1; "Code")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
        // Add changes to field groups here
    }

    var

        EnteteAchat: Record "Purchase Header";
        EcrArt: Record "Item Ledger Entry";
        NDossier: Record "DossierArrivage";
        TransfertNDossier: Record "TransfertNodossier";
        ParamStock: Record "Inventory Setup";
        HistoCredoc: Record "Historiquecredoc";
        Credoc: Record "Credoc";
        DeviseTauxChange: Record "Currency Exchange Rate";
        GestionNoSouche: Codeunit "No. Series";

    trigger OnInsert()
    begin

        //* initialisation
        "Date ouverture" := TODAY;
        //* 

    end;

    trigger OnModify()
    begin

    end;

    trigger OnDelete()
    begin
        //* Supprimer les enregistrements du credoc dans l'Historique du credoc
        HistoCredoc.RESET();
        HistoCredoc.SETRANGE("Code credoc", Code);
        HistoCredoc.DELETEALL();
        //*
    end;

    trigger OnRename()
    begin

    end;
}