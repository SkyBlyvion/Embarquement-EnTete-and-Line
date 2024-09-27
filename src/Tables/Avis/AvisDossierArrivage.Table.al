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
            Description = 'AVIS_DOSSIER_ARRIVAGE - LN - 23/09/24 REV24';
            Editable = true;
            NotBlank = true;
            TableRelation = "DossierArrivage"."No. Dossier";
        }
        field(2; "Code credoc"; Code[19])
        {
            DataClassification = AccountData;
            Caption = 'Code credoc';
            Description = 'AVIS_DOSSIER_ARRIVAGE - LN - 23/09/24 REV24';
            Editable = true;
            TableRelation = "Credoc"."Code";
        }
        field(3; "No. ligne avis"; Integer)
        {
            DataClassification = AccountData;
            Caption = 'No. ligne avis';
            Description = 'AVIS_DOSSIER_ARRIVAGE - LN - 23/09/24 REV24';
            Editable = true;
            BlankNumbers = DontBlank;
            TableRelation = "Avis"."No. Ligne" where("Code credoc" = field("Code credoc"));

            trigger OnValidate()
            begin

                IF xRec."No. ligne avis" <> Rec."No. ligne avis" THEN BEGIN
                    AvisLigneDossier.SETRANGE("Code credoc", Rec."Code credoc");
                    AvisLigneDossier.SETRANGE("No. ligne avis", Rec."No. ligne avis");

                    IF AvisLigneDossier.FIND('-') THEN
                        REPEAT
                            AvisLigneDossier.VALIDATE(Type, Rec.Type);
                            AvisLigneDossier.MODIFY();
                        UNTIL AvisLigneDossier.NEXT() = 0;
                END;
            end;
        }
        field(4; "Type"; Option)
        {
            DataClassification = AccountData;
            Caption = 'Type';
            Description = 'AVIS_DOSSIER_ARRIVAGE - LN - 23/09/24 REV24';
            Editable = false;
            BlankNumbers = DontBlank;
            OptionMembers = "Marchandise","Financier","Avoir qualité","Escompte","Autre";
        }
        field(8; "Montant affecté"; Decimal)
        {
            DataClassification = AccountData;
            Caption = 'Montant affecté';
            Description = 'AVIS_DOSSIER_ARRIVAGE - LN - 23/09/24 REV24';
            Editable = true;
            BlankNumbers = DontBlank;
            AutoFormatType = 1;
        }
        field(9; "Prévisionnel"; Boolean)
        {
            Caption = 'Prévisionnel';
            Description = 'AVIS_DOSSIER_ARRIVAGE - LN - 23/09/24 REV24';
            Editable = false;
            BlankNumbers = DontBlank;
            FieldClass = FlowField;
            CalcFormula = lookup("Avis"."Prévisionnel" where("Code credoc" = field("Code credoc"), "No. ligne" = field("No. ligne avis")));
        }
        field(10; "Mnt total lignes affectées"; Decimal)
        {
            Caption = 'Mnt total lignes affectées';
            Description = 'AVIS_DOSSIER_ARRIVAGE - LN - 23/09/24 REV24';
            Editable = false;
            BlankNumbers = DontBlank;
            AutoFormatType = 1;
            FieldClass = FlowField;
            CalcFormula = Sum("AvisLigneDossier"."Montant ligne (dev soc)" WHERE("Code credoc" = FIELD("Code credoc"), "No. ligne avis" = FIELD("No. ligne avis"), "No. dossier" = FIELD("No. dossier"), "Affectation" = CONST(true)));
        }
        field(11; "Affectation partielle"; Boolean)
        {
            Caption = 'Affectation partielle';
            Description = 'AVIS_DOSSIER_ARRIVAGE - LN - 23/09/24 REV24';
            Editable = false;
            BlankNumbers = DontBlank;
            FieldClass = FlowField;
            CalcFormula = Exist("AvisLigneDossier" WHERE("No. dossier" = FIELD("No. dossier"), "Code credoc" = FIELD("Code credoc"), "No. ligne avis" = FIELD("No. ligne avis"), "Affectation" = CONST(false)));
        }
        field(12; "Mnt affecté total lig affect"; Decimal)
        {
            Caption = 'Mnt affecté total lig affect';
            Description = 'AVIS_DOSSIER_ARRIVAGE - LN - 23/09/24 REV24';
            Editable = false;
            BlankNumbers = DontBlank;
            AutoFormatType = 1;
            FieldClass = FlowField;
            CalcFormula = Sum("AvisLigneDossier"."Montant affecté" WHERE("No. dossier" = FIELD("No. dossier"), "Code credoc" = FIELD("Code credoc"), "No. ligne avis" = FIELD("No. ligne avis"), "Affectation" = CONST(true)));
        }
        field(13; "Vol total lignes affectées"; Decimal)
        {
            Caption = 'Vol total lignes affectées';
            Description = 'AVIS_DOSSIER_ARRIVAGE - LN - 23/09/24 REV24';
            Editable = true;
            BlankNumbers = DontBlank;
            FieldClass = FlowField;
            CalcFormula = Sum("AvisLigneDossier"."Volume ligne" WHERE("No. dossier" = FIELD("No. dossier"), "Code credoc" = FIELD("Code credoc"), "No. ligne avis" = FIELD("No. ligne avis"), "Affectation" = CONST(true)));
        }
        field(14; "Code devise"; Code[10])
        {
            Caption = 'Code devise';
            Description = 'AVIS_DOSSIER_ARRIVAGE - LN - 23/09/24 REV24';
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
        AvisLigneDossier: Record "AvisLigneDossier";
        Avis: Record "Avis";
        LigneDossier: Record "LigneDossierArrivage";
        AvisDossier: Record "AvisDossierArrivage";
        Dossier: Record "DossierArrivage";

    trigger OnInsert()
    begin
        IF Dossier.GET("No. dossier") THEN
            IF Dossier.Etat = Dossier.Etat::Clôturé THEN
                ERROR('Affectation impossible : ce dossier est clôturé');

        Avis.GET("Code credoc", "No. ligne avis");

        //CREDOC PC 10/05/07 NSC4.28 Autoriser plusierus avis de type avoir qualité
        // On interdit d'associer plusieurs avis d'escompte ou d'avoir qualité à un dossier
        IF (Avis.Type = Avis.Type::Escompte) OR (Avis.Type = Avis.Type::"Avoir qualité") THEN BEGIN
            AvisDossier.RESET();
            AvisDossier.SETRANGE("No. dossier", Rec."No. dossier");
            AvisDossier.SETRANGE(Type, Avis.Type);
            IF AvisDossier.FIND('-') THEN
                ERROR('Il existe déjà un avis de type %1 associé au dossier %2 (avis n°%3 du Credoc n°%4)',
                    Format(Avis.Type), Rec."No. dossier", AvisDossier."No. ligne avis", AvisDossier."Code credoc");
            // Avis.Type, "No. dossier", AvisDossier."No. ligne avis", AvisDossier."Code credoc");
        end;
        // Fin CREDOC PC 10/05/07 NSC4.28 Autoriser plusieurs avis de type avoir qualité

        Rec.Type := Avis.Type;

        LigneDossier.SETRANGE("No. dossier", Rec."No. dossier");
        IF LigneDossier.FIND('-') THEN
            REPEAT
                AvisLigneDossier.INIT();
                AvisLigneDossier."Code credoc" := Rec."Code credoc";
                AvisLigneDossier."No. ligne avis" := Rec."No. ligne avis";
                AvisLigneDossier."No. dossier" := Rec."No. dossier";
                AvisLigneDossier."No. ligne dossier" := LigneDossier."No. ligne";
                //BUG CC 29/05/10 REV4.14
                //AvisLigneDossier."Montant ligne (dev soc)" := LigneDossier."Montant (dev soc)";
                AvisLigneDossier."Montant ligne (dev soc)" := LigneDossier.Montant;
                //Fin BUG CC 29/05/10 REV4.14
                AvisLigneDossier."Volume ligne" := LigneDossier.Volume;
                AvisLigneDossier.Type := Type;
                AvisLigneDossier.Affectation := TRUE;
                AvisLigneDossier.INSERT();
            UNTIL LigneDossier.NEXT() = 0;
    end;



    trigger OnModify()
    begin
        IF Dossier.GET(Rec."No. dossier") THEN
            IF Dossier.Etat = Dossier.Etat::Clôturé THEN
                ERROR('Modification impossible : ce dossier est clôturé');
    end;

    trigger OnDelete()
    begin
        IF Dossier.GET(Rec."No. dossier") THEN
            IF Dossier.Etat = Dossier.Etat::Clôturé THEN
                ERROR('Suppression impossible : ce dossier est clôturé');

        AvisLigneDossier.RESET();
        AvisLigneDossier.SETRANGE("No. dossier", Rec."No. dossier");
        AvisLigneDossier.SETRANGE("Code credoc", Rec."Code credoc");
        AvisLigneDossier.SETRANGE("No. ligne avis", Rec."No. ligne avis");
        AvisLigneDossier.DELETEALL(TRUE);
    end;

    trigger OnRename()
    begin
        IF Dossier.GET(Rec."No. dossier") THEN
            IF Dossier.Etat = Dossier.Etat::Clôturé THEN
                ERROR('Modification impossible : ce dossier est clôturé');

        AvisLigneDossier.RESET();
        AvisLigneDossier.SETRANGE("No. dossier", xRec."No. dossier");
        AvisLigneDossier.SETRANGE("Code credoc", xRec."Code credoc");
        AvisLigneDossier.SETRANGE("No. ligne avis", xRec."No. ligne avis");
        AvisLigneDossier.DELETEALL(TRUE);

        Avis.GET("Code credoc");
        Rec.Type := Avis.Type;

        LigneDossier.SETRANGE("No. dossier", "No. dossier");
        IF LigneDossier.FIND('-') THEN
            REPEAT
                AvisLigneDossier.INIT();
                AvisLigneDossier."Code credoc" := Rec."Code credoc";
                AvisLigneDossier."No. ligne avis" := Rec."No. ligne avis";
                AvisLigneDossier."No. dossier" := Rec."No. dossier";
                AvisLigneDossier."No. ligne dossier" := LigneDossier."No. ligne";
                AvisLigneDossier."Montant ligne (dev soc)" := LigneDossier."Montant (dev soc)";
                AvisLigneDossier."Volume ligne" := LigneDossier.Volume;
                AvisLigneDossier.Type := Rec.Type;
                AvisLigneDossier.Affectation := TRUE;
                AvisLigneDossier.INSERT();
            UNTIL LigneDossier.NEXT() = 0;
    end;

}