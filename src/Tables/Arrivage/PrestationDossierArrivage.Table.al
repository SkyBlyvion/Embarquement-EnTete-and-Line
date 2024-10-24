table 50251 "PrestationDossierArrivage"
{
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "No. Dossier"; Code[10])
        {
            DataClassification = CustomerContent;
            Caption = 'No. Dossier';
            Description = 'PRESTATION_DOSSIER_ARRIVAGE - LN - 10/09/24 REV24';
            Editable = true;
            NotBlank = true;
            TableRelation = "DossierArrivage"."No. Dossier";
        }
        field(2; "No. prestation"; Code[10])
        {
            DataClassification = CustomerContent;
            Caption = 'No. prestation';
            Description = 'PRESTATION_DOSSIER_ARRIVAGE - LN - 10/09/24 REV24';
            Editable = true;
            TableRelation = "Prestation"."No.";
        }
        field(3; "Type"; Option)
        {
            DataClassification = CustomerContent;
            Caption = 'Type';
            Description = 'PRESTATION_DOSSIER_ARRIVAGE - LN - 10/09/24 REV24';
            Editable = false;
            NotBlank = true;
            BlankNumbers = DontBlank;
            OptionMembers = "Frais de transport","Frais Financiers","Assurances","Commissions","Transit","Douane";

            trigger OnValidate()
            begin
                if xRec.Type <> Type then
                    PrestLigneDossier.SETRANGE("No. prestation", "No. prestation");
                if PrestLigneDossier.FIND('-') then
                    repeat
                        PrestLigneDossier.VALIDATE(Type, Type); // Apply validation on the Type field
                        PrestLigneDossier.MODIFY(true); // Always set MODIFY to true to ensure it locks and updates the record
                    until PrestLigneDossier.NEXT() = 0;
            end;

        }
        field(8; "Montant affecté"; Decimal)
        {
            DataClassification = CustomerContent;
            Caption = 'Montant affecté';
            Description = 'PRESTATION_DOSSIER_ARRIVAGE - LN - 10/09/24 REV24';
            Editable = true;
            BlankNumbers = DontBlank;
            AutoFormatType = 1;
        }
        field(9; "Prévisionnel"; Boolean)
        {
            Caption = 'Prévisionnel';
            Description = 'PRESTATION_DOSSIER_ARRIVAGE - LN - 10/09/24 REV24';
            Editable = false;
            FieldClass = FlowField;
            CalcFormula = lookup("Prestation"."Prévisionnel" WHERE("No." = FIELD("No. prestation")));
        }
        field(10; "Mnt total lignes affectées"; Decimal)
        {
            Caption = 'Mnt total lignes affectées';
            Description = 'PRESTATION_DOSSIER_ARRIVAGE - LN - 10/09/24 REV24';
            Editable = false;
            FieldClass = FlowField;
            AutoFormatType = 1;
            BlankNumbers = DontBlank;
            CalcFormula = Sum("PrestationLigneDossier"."Montant ligne (dev soc)" WHERE("No. prestation" = FIELD("No. prestation"), "No. dossier" = FIELD("No. dossier"), "Affectation" = CONST(true)));
            // Sum("Prestation / ligne dossier"."Montant ligne (dev soc)" WHERE (N° prestation=FIELD(N° prestation),N° dossier=FIELD(N° dossier),Affectation=CONST(Yes)))
        }
        field(11; "Affectation partielle"; Boolean)
        {
            Caption = 'Affectation partielle';
            Description = 'PRESTATION_DOSSIER_ARRIVAGE - LN - 10/09/24 REV24';
            Editable = false;
            FieldClass = FlowField;
            BlankNumbers = DontBlank;
            CalcFormula = Exist("PrestationLigneDossier" WHERE("No. dossier" = FIELD("No. dossier"), "No. prestation" = FIELD("No. prestation"), "Affectation" = CONST(false)));
        }
        field(12; "Mnt affecté total lig affect"; Decimal)
        {
            Caption = 'Mnt affecté total lig affect';
            Description = 'PRESTATION_DOSSIER_ARRIVAGE - LN - 10/09/24 REV24';
            Editable = false;
            BlankNumbers = DontBlank;
            FieldClass = FlowField;
            AutoFormatType = 1;
            CalcFormula = Sum("PrestationLigneDossier"."Montant affecté" WHERE("No. dossier" = FIELD("No. dossier"), "No. prestation" = FIELD("No. prestation"), "Affectation" = CONST(true)));
        }
        field(13; "Vol total lignes affect"; Decimal)
        {
            Caption = 'Vol total lignes affect';
            Description = 'PRESTATION_DOSSIER_ARRIVAGE - LN - 10/09/24 REV24';
            Editable = true;
            BlankNumbers = DontBlank;
            FieldClass = FlowField;
            CalcFormula = Sum("PrestationLigneDossier"."Volume ligne" WHERE("No. prestation" = FIELD("No. prestation"), "No. dossier" = FIELD("No. dossier"), "Affectation" = CONST(true)));
        }
        field(14; "Code devise"; Code[10])
        {
            Caption = 'Code devise';
            Description = 'PRESTATION_DOSSIER_ARRIVAGE - LN - 10/09/24 REV24';
            Editable = false;
            FieldClass = FlowField;
            CalcFormula = Lookup("Prestation"."Code devise" WHERE("No." = FIELD("No. prestation")));
        }
    }

    keys
    {
        key(Key1; "No. Dossier", "No. prestation")
        {
            Clustered = true;
            SumIndexFields = "Montant affecté";
        }

        key(Key2; "Type")
        {
            Enabled = true;
            SumIndexFields = "Montant affecté";
        }
        key(SIFT; "No. Dossier", "Type", "Montant affecté")
        {
            Enabled = true;
        }

    }

    fieldgroups
    {
        // Add changes to field groups here
    }

    var
        Dossier: Record "DossierArrivage";
        PrestLigneDossier: Record "PrestationLigneDossier";
        Prest: Record "Prestation";
        LigneDossier: Record "Lignedossierarrivage";

    trigger OnInsert()
    begin

        IF Dossier.GET("No. dossier") THEN
            IF Dossier.Etat = Dossier.Etat::Clôturé THEN
                ERROR('Affectation impossible : ce dossier est clôturé');

        Prest.GET("No. prestation");
        Type := Prest.Type;

        LigneDossier.SETRANGE("No. Dossier", "No. Dossier");
        IF LigneDossier.FIND('-') THEN
            REPEAT
                PrestLigneDossier.INIT();
                PrestLigneDossier."No. prestation" := "No. prestation";
                PrestLigneDossier."No. dossier" := "No. dossier";
                PrestLigneDossier."No. ligne dossier" := LigneDossier."No. ligne";
                //BUG CC 29/05/10 REV4.14
                //PrestLigneDossier."Montant ligne (dev soc)" := LigneDossier."Montant (dev soc)";
                PrestLigneDossier."Montant ligne (dev soc)" := LigneDossier."Montant";
                //Fin BUG CC 29/05/10 REV4.14
                PrestLigneDossier."Volume ligne" := LigneDossier."Volume";
                PrestLigneDossier.Type := Prest.Type;
                PrestLigneDossier."Affectation" := TRUE;
                PrestLigneDossier.INSERT();
            UNTIL LigneDossier.NEXT() = 0;

    end;

    trigger OnModify()
    begin
        IF Dossier.GET("No. dossier") THEN
            IF Dossier.Etat = Dossier.Etat::"Clôturé" THEN
                ERROR('Modification impossible : ce dossier est clôturé');
    end;

    trigger OnDelete()
    begin

        IF Dossier.GET("No. dossier") THEN
            IF Dossier.Etat = Dossier.Etat::"Clôturé" THEN
                ERROR('Suppression impossible : ce dossier est clôturé');

        PrestLigneDossier.SETRANGE("No. dossier", "No. dossier");
        PrestLigneDossier.SETRANGE("No. prestation", "No. prestation");
        PrestLigneDossier.DELETEALL();
    end;

    trigger OnRename()
    begin

        IF Dossier.GET("No. dossier") THEN
            IF Dossier.Etat = Dossier.Etat::"Clôturé" THEN
                ERROR('Modification impossible : ce dossier est clôturé');

        PrestLigneDossier.SETRANGE("No. dossier", xRec."No. dossier");
        PrestLigneDossier.SETRANGE("No. prestation", xRec."No. prestation");
        PrestLigneDossier.DELETEALL();

        Prest.GET("No. prestation");
        Type := Prest.Type;

        LigneDossier.SETRANGE("No. dossier", "No. dossier");
        IF LigneDossier.FIND('-') THEN
            PrestLigneDossier.INIT();
        PrestLigneDossier."No. prestation" := "No. prestation";
        PrestLigneDossier."No. dossier" := "No. dossier";
        PrestLigneDossier."No. ligne dossier" := LigneDossier."No. ligne";
        PrestLigneDossier."Montant ligne (dev soc)" := LigneDossier."Montant (dev soc)";
        PrestLigneDossier."Volume ligne" := LigneDossier."Volume";
        PrestLigneDossier.Type := Prest.Type;
        PrestLigneDossier.Affectation := TRUE;
        PrestLigneDossier.INSERT();
        REPEAT
        UNTIL LigneDossier.NEXT() = 0;
    end;


}