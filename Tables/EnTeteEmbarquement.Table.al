table 50236 EnTeteEmbarquement
{
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "No embarquement"; Code[10])
        {
            DataClassification = ToBeClassified;
            Caption = 'N° embarquement';
        }
        field(2; "No preneur d'ordre"; Code[20])
        {
            DataClassification = ToBeClassified;
            Caption = 'N° preneur d''ordre';
            TableRelation = Vendor;
        }
        field(3; "Date embarquement"; Date)
        {
            DataClassification = SystemMetadata;
            Caption = 'Date embarquement';
        }
        field(4; "Date réception prévue"; Date)
        {
            DataClassification = SystemMetadata;
            Caption = 'Date réception prévue';
        }
        field(5; "Nom du preneur d'ordre"; Text[30])
        {
            DataClassification = ToBeClassified;
            Caption = 'Nom du preneur d''ordre';
        }
        field(6; "Adresse preneur d'ordre"; Text[30])
        {
            DataClassification = ToBeClassified;
            Caption = 'Adresse preneur d''ordre';
        }
        field(7; "Adresse preneur d'ordre 2"; Text[30])
        {
            DataClassification = ToBeClassified;
            Caption = 'Adresse preneur d''ordre 2';
        }
        field(8; "Adresse preneur d'ordre 3"; Text[30])
        {
            DataClassification = ToBeClassified;
            Caption = 'Adresse preneur d''ordre 3';
        }
        field(9; "Ville preneur d'ordre"; Text[30])
        {
            DataClassification = ToBeClassified;
            Caption = 'Ville preneur d''ordre';
        }
        field(10; "Contact preneur d'ordre"; Text[30])
        {
            DataClassification = ToBeClassified;
            Caption = 'Contact preneur d''ordre';
        }
        field(11; "Code postal preneur d'ordre"; Code[20])
        {
            DataClassification = ToBeClassified;
            Caption = 'Code postal preneur d''ordre';
        }
        field(12; "Code pays preneur d'ordre"; Code[10])
        {
            DataClassification = ToBeClassified;
            Caption = 'Code pays preneur d''ordre';
            TableRelation = "Country/Region";
        }
        field(13; "Souches de No"; Code[10])
        {
            DataClassification = ToBeClassified;
            Caption = 'Souches de N°';
            TableRelation = "No. Series";
        }
    }

    keys
    {
        key(PK; "No embarquement")
        {
            Clustered = true;
        }
        key(SecondaryKey; "No preneur d'ordre", "Date embarquement")
        {
            Clustered = false;
        }
    }

    fieldgroups
    {
        // Add changes to field groups here
    }

    var
        ParamAchat: Record "Purchases & Payables Setup";
        Fns: Record Vendor;
        LigEmbarquement: Record "Ligne Embarquement"; // Assuming "Ligne Embarquement" is a custom table
        LigAchat: Record "Purchase Line";
        GestionNoSouche: Codeunit "NoSeriesManagement";

    trigger OnInsert()
    begin
        if ("No embarquement" = '') then begin
            ParamAchat.TESTFIELD("No embarquement");
            GestionNoSouche.InitSeries(ParamAchat."No embarquement", xRec."Souches de No", 0D, "No embarquement", "Souches de No");
        end;
        "Date embarquement" := Today;
    end;

    trigger OnModify()
    begin
        // No specific logic
    end;

    trigger OnDelete()
    var
        LigEmbarquement: Record "Ligne Embarquement";
        LigAchat: Record "Purchase Line";

    begin
        LigEmbarquement.Reset();
        LigEmbarquement.SetRange("No embarquement", "No embarquement");
        if LigEmbarquement.FindSet() then begin
            CancelReservEntry();
            repeat
                if LigAchat.Get(LigAchat."Document Type"::Order, LigEmbarquement."No commande achat", LigEmbarquement."No ligne commande achat") then begin
                    LigEmbarquement.Delete();
                    LigAchat.InitQteAEmbarquer();
                    LigAchat.Modify();
                end else
                    LigEmbarquement.Delete();
            until LigEmbarquement.Next() = 0;
        end;
    end;

    trigger OnRename()
    begin
        Error('Vous ne pouvez pas renommer %1.', TableName);
    end;

    procedure CancelReservEntry()
    var
        LigEmbarquement: Record "Ligne Embarquement";
    begin
        LigEmbarquement.Reset();
        LigEmbarquement.SetRange("No embarquement", "No embarquement");
        if LigEmbarquement.FindSet() then begin
            repeat
                LigEmbarquement.DeleteReservEntry();
            until LigEmbarquement.Next() = 0;
        end;
    end;

    trigger OnValidate()
    begin
        ExtrFns("No preneur d'ordre");
        "Nom du preneur d'ordre" := .Name;
        "Adresse preneur d'ordre" := Fns.Address;
        "Adresse preneur d'ordre 2" := Fns."Address 2";
        "Ville preneur d'ordre" := Fns.City;
        "Code postal preneur d'ordre" := Fns."Post Code";
        "Adresse preneur d'ordre 3" := Fns.County;
        "Code pays preneur d'ordre" := Fns."Country Code";
        "Contact preneur d'ordre" := Fns.Contact;
    end;
}
