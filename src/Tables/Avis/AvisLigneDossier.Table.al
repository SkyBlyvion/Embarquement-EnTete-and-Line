table 50260 "AvisLigneDossier"
{
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "Code credoc"; Code[19])
        {
            DataClassification = CustomerContent;
            Caption = 'Code credoc';
            Description = 'AVIS_LIGNE_DOSSIER - REVIMPORT - 24/09/24 REV24';
            TableRelation = "Credoc"."Code";
        }
        field(2; "No. ligne avis"; Integer)
        {
            DataClassification = AccountData;
            Caption = 'No. ligne';
            Description = 'AVIS_LIGNE_DOSSIER - REVIMPORT - 24/09/24 REV24';
            Editable = false;
            BlankNumbers = DontBlank;
            TableRelation = "Avis"."No. Ligne" where("Code credoc" = field("Code credoc"));
        }
        field(4; "No. dossier"; Code[20])
        {
            DataClassification = AccountData;
            Caption = 'No. dossier';
            Description = 'AVIS_LIGNE_DOSSIER - REVIMPORT - 24/09/24 REV24';
            Editable = false;
            TableRelation = "LigneDossierArrivage"."No. Dossier";
        }
        field(5; "No. ligne dossier"; Integer)
        {
            DataClassification = AccountData;
            Caption = 'No. ligne dossier';
            Description = 'AVIS_LIGNE_DOSSIER - REVIMPORT - 24/09/24 REV24';
            Editable = false;
            BlankNumbers = DontBlank;
            TableRelation = "LigneDossierArrivage"."No. Ligne" where("No. dossier" = field("No. dossier"));
        }
        field(6; "Affectation"; Boolean)
        {
            DataClassification = AccountData;
            Caption = 'Affectation';
            Description = 'AVIS_LIGNE_DOSSIER - REVIMPORT - 24/09/24 REV24';
            BlankNumbers = DontBlank;
        }
        field(7; "Montant affecté"; Decimal)
        {
            DataClassification = AccountData;
            Caption = 'Montant affecté';
            Description = 'AVIS_LIGNE_DOSSIER - REVIMPORT - 24/09/24 REV24';
            Editable = true;
            BlankNumbers = DontBlank;
            AutoFormatType = 1;
        }
        field(8; "Type"; Option)
        {
            DataClassification = AccountData;
            Caption = 'Type';
            Description = 'AVIS_LIGNE_DOSSIER - REVIMPORT - 24/09/24 REV24';
            Editable = false;
            BlankNumbers = DontBlank;
            OptionMembers = "Marchandise","Financier","Avoir qualité","Escompte","Autre";
        }
        field(9; "Prévisionnel"; Boolean)
        {
            Caption = 'Prévisionnel';
            Description = 'AVIS_LIGNE_DOSSIER - REVIMPORT - 24/09/24 REV24';
            Editable = false;
            BlankNumbers = DontBlank;
            FieldClass = FlowField;
            CalcFormula = lookup("Avis"."Prévisionnel" where("Code credoc" = field("Code credoc"), "No. ligne" = field("No. ligne avis")));
        }
        field(10; "Désignation"; Text[50])
        {
            Caption = 'Désignation';
            Description = 'AVIS_LIGNE_DOSSIER - REVIMPORT - 24/09/24 REV24';
            Editable = false;
            FieldClass = FlowField;
            CalcFormula = lookup("LigneDossierArrivage"."Désignation" where("No. dossier" = field("No. dossier"), "No. ligne" = field("No. ligne dossier")));
        }
        field(11; "Cout unitaire"; Decimal)
        {
            Caption = 'Cout unitaire';
            Description = 'AVIS_LIGNE_DOSSIER - REVIMPORT - 24/09/24 REV24';
            Editable = false;
            BlankNumbers = DontBlank;
            FieldClass = FlowField;
            AutoFormatType = 1;
            CalcFormula = lookup("LigneDossierArrivage"."Cout unitaire" WHERE("No. dossier" = FIELD("No. dossier"), "No. ligne" = FIELD("No. ligne dossier")));
        }
        field(12; "Quantité (pièce)"; Decimal)
        {
            Caption = 'Quantité (pièce)';
            Description = 'AVIS_LIGNE_DOSSIER - REVIMPORT - 24/09/24 REV24';
            Editable = false;
            BlankNumbers = DontBlank;
            FieldClass = FlowField;
            DecimalPlaces = 0 : 5;
            CalcFormula = lookup("LigneDossierArrivage"."Quantité (piece)" where("No. dossier" = field("No. dossier"), "No. ligne" = field("No. ligne dossier")));
        }
        field(13; "Montant ligne (dev soc)"; Decimal)
        {
            Caption = 'Montant ligne (dev soc)';
            Description = 'AVIS_LIGNE_DOSSIER - REVIMPORT - 24/09/24 REV24';
            Editable = false;
            BlankNumbers = DontBlank;
            AutoFormatType = 1;
        }
        field(14; "Volume ligne"; Decimal)
        {
            Caption = 'Volume ligne';
            Description = 'AVIS_LIGNE_DOSSIER - REVIMPORT - 24/09/24 REV24';
            Editable = false;
            BlankNumbers = DontBlank;
        }
        field(15; "No. article"; Code[20])
        {
            Caption = 'No. article';
            Description = 'AVIS_LIGNE_DOSSIER - REVIMPORT - 24/09/24 REV24';
            Editable = false;
            FieldClass = FlowField;
            TableRelation = "Item"."No.";
            CalcFormula = lookup("LigneDossierArrivage"."No. article" where("No. dossier" = field("No. dossier"), "No. ligne" = field("No. ligne dossier")));
        }
        field(16; "No. réception"; Code[20])
        {
            Caption = 'No. réception';
            Description = 'AVIS_LIGNE_DOSSIER - REVIMPORT - 24/09/24 REV24';
            Editable = false;
            FieldClass = FlowField;
            TableRelation = "Purch. Rcpt. Header"."No.";
            CalcFormula = lookup("LigneDossierArrivage"."No. réception" where("No. dossier" = field("No. dossier"), "No. ligne" = field("No. ligne dossier")));
        }
        field(17; "Code devise"; Code[10])
        {
            Caption = 'Code devise';
            Description = 'AVIS_LIGNE_DOSSIER - REVIMPORT - 24/09/24 REV24';
            Editable = false;
            FieldClass = FlowField;
            CalcFormula = lookup("Avis"."Code devise" where("Code credoc" = field("Code credoc"), "No. ligne" = field("No. ligne avis")));
        }
    }

    keys
    {
        key(PK; "Code credoc", "No. ligne avis", "No. dossier", "No. ligne dossier")
        {
            Clustered = true;
        }
        key(SecondaryKey; "Type")
        {
            Enabled = true;
            SumIndexFields = "Montant affecté";
        }
        key(Key3; "Affectation")
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