table 50235 EnTeteEmbarquement
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
        }
        field(13; "Souches de N°"; Code[10])
        {
            DataClassification = ToBeClassified;
            Caption = 'Souches de N°';
        }
    }

    keys
    {
        key(PK; "No embarquement")
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
