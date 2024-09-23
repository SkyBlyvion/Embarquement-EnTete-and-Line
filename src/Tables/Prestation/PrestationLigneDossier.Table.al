table 50254 "PrestationLigneDossier"
{
    DataClassification = ToBeClassified;

    fields
    {
        field(2; "No. prestation"; Code[10])
        {
            DataClassification = AccountData;
            Caption = 'No. prestation';
            Description = 'PRESTATION_LIGNE_DOSSIER - REVIMPORT - 13/09/24 REV24';
            Editable = false;
            TableRelation = "Prestation"."No.";
        }
        field(4; "No. dossier"; Code[20])
        {
            DataClassification = AccountData;
            Caption = 'No. dossier';
            Description = 'PRESTATION_LIGNE_DOSSIER - REVIMPORT - 13/09/24 REV24';
            Editable = false;
            TableRelation = "LigneDossierArrivage"."No. Dossier"; //TODO: remplir la LigneDossierArrivage
        }
        field(5; "No. ligne dossier"; Integer)
        {
            DataClassification = AccountData;
            Caption = 'No. ligne dossier';
            Description = 'PRESTATION_LIGNE_DOSSIER - REVIMPORT - 13/09/24 REV24';
            Editable = false;
        }
        field(6; "Affectation"; Boolean)
        {
            DataClassification = AccountData;
            Caption = 'Affectation';
            Description = 'PRESTATION_LIGNE_DOSSIER - REVIMPORT - 13/09/24 REV24';
            Editable = true;
            BlankNumbers = DontBlank;
        }
        field(7; "Montant affecté"; Decimal)
        {
            DataClassification = AccountData;
            Caption = 'Montant affecté';
            Description = 'PRESTATION_LIGNE_DOSSIER - REVIMPORT - 13/09/24 REV24';
            Editable = true;
            BlankNumbers = DontBlank;
        }
        field(8; "Type"; Option)
        {
            DataClassification = AccountData;
            Caption = 'Type';
            Description = 'PRESTATION_LIGNE_DOSSIER - REVIMPORT - 23/09/24 REV24';
            Editable = false;
            NotBlank = true;
            OptionMembers = "Frais de transport","Frais Financiers","Assurances","Commissions","Transit","Douane";
        }
        field(9; "Prévisionnel"; Boolean)
        {
            Caption = 'Prévisionnel';
            Description = 'PRESTATION_LIGNE_DOSSIER - REVIMPORT - 23/09/24 REV24';
            Editable = false;
            BlankNumbers = DontBlank;
            FieldClass = FlowField;
            CalcFormula = lookup("Prestation"."Prévisionnel" where("No." = field("No. prestation")));
        }
        field(10; "Désignation"; Text[50])
        {
            Caption = 'Désignation';
            Description = 'PRESTATION_LIGNE_DOSSIER - REVIMPORT - 23/09/24 REV24';
            Editable = false;
            FieldClass = FlowField;
            CalcFormula = lookup("LigneDossierArrivage"."Désignation" where("No. dossier" = field("No. dossier"), "No. ligne" = field("No. ligne dossier")));
        }
        field(11; "Cout unitaire"; Decimal)
        {
            Caption = 'Cout unitaire';
            Description = 'PRESTATION_LIGNE_DOSSIER - REVIMPORT - 23/09/24 REV24';
            Editable = false;
            BlankNumbers = DontBlank;
            FieldClass = FlowField;
            CalcFormula = lookup("LigneDossierArrivage"."Cout unitaire" where("No. dossier" = field("No. dossier"), "No. ligne" = field("No. ligne dossier")));
        }
        field(12; "Quantité (pièce)"; Decimal)
        {
            Caption = 'Quantité (pièce)';
            Description = 'PRESTATION_LIGNE_DOSSIER - REVIMPORT - 23/09/24 REV24';
            Editable = false;
            BlankNumbers = DontBlank;
            FieldClass = FlowField;
            DecimalPlaces = 0 : 5;
            CalcFormula = lookup("LigneDossierArrivage"."Quantité (piece)" where("No. dossier" = field("No. dossier"), "No. ligne" = field("No. ligne dossier")));
        }
        field(13; "Montant ligne (dev soc)"; Decimal)
        {
            DataClassification = AccountData;
            Caption = 'Montant ligne (dev soc)';
            Description = 'PRESTATION_LIGNE_DOSSIER - REVIMPORT - 23/09/24 REV24';
            Editable = false;
            BlankNumbers = DontBlank;
        }
        field(14; "Volume ligne"; Decimal)
        {
            DataClassification = AccountData;
            Caption = 'Volume ligne';
            Description = 'PRESTATION_LIGNE_DOSSIER - REVIMPORT - 23/09/24 REV24';
            Editable = false;
        }
        field(15; "No. article"; Code[20])
        {
            Caption = 'No. article';
            Description = 'PRESTATION_LIGNE_DOSSIER - REVIMPORT - 23/09/24 REV24';
            Editable = false;
            TableRelation = "Item"."No.";
            FieldClass = FlowField;
            CalcFormula = lookup("LigneDossierArrivage"."No. article" where("No. dossier" = field("No. dossier"), "No. ligne" = field("No. ligne dossier")));
        }
        field(16; "No. réception"; Code[20])
        {
            Caption = 'No. réception';
            Description = 'PRESTATION_LIGNE_DOSSIER - REVIMPORT - 23/09/24 REV24';
            Editable = false;
            TableRelation = "Purch. Rcpt. Header";//TODO: TableRelation "No. reception" > "Purch. Rcpt. Header" table which field ? 
            FieldClass = FlowField;
            CalcFormula = lookup("LigneDossierArrivage"."No. réception" where("No. dossier" = field("No. dossier"), "No. ligne" = field("No. ligne dossier")));
        }
        field(17; "Code devise"; Code[10])
        {
            Caption = 'Code devise';
            Description = 'PRESTATION_LIGNE_DOSSIER - REVIMPORT - 23/09/24 REV24';
            Editable = false;
            FieldClass = FlowField;
            CalcFormula = lookup("Prestation"."Code devise" where("No." = field("No. prestation")));
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