table 50258 Avis
{
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "Code credoc"; Code[19])
        {
            DataClassification = CustomerContent;
            Caption = 'Code credoc';
            Description = 'AVIS - LN - 23/09/24 REV24';
            Editable = true;
            TableRelation = "Credoc"."Code";
        }
        field(2; "No. ligne"; Integer)
        {
            DataClassification = AccountData;
            Caption = 'No. ligne';
            Description = 'AVIS - LN - 23/09/24 REV24';
            Editable = true;
            BlankNumbers = DontBlank;
        }
        field(3; "Date"; Date)
        {
            DataClassification = SystemMetadata;
            Caption = 'Date';
            Description = 'AVIS - LN - 23/09/24 REV24';
            Editable = true;
            BlankNumbers = DontBlank;
        }
        field(4; "Type"; Option)
        {
            DataClassification = AccountData;
            Caption = 'Type';
            Description = 'AVIS - LN - 23/09/24 REV24';
            Editable = true;
            BlankNumbers = DontBlank;
            OptionMembers = "Marchandise","Financier","Avoir qualité","Escompte","Autre";
        }
        field(5; "Montant"; Decimal)
        {
            DataClassification = AccountData;
            Caption = 'Montant';
            Description = 'AVIS - LN - 23/09/24 REV24';
            Editable = true;
            BlankNumbers = DontBlank;
            AutoFormatType = 1;
        }
        field(6; "Code devise"; Code[3])
        {
            DataClassification = CustomerContent;
            Caption = 'Code devise';
            Description = 'AVIS - LN - 24/09/24 REV24';
            Editable = true;
            TableRelation = "Currency"."Code";
        }
        field(7; "Facteur devise"; Decimal)
        {
            DataClassification = AccountData;
            Caption = 'Facteur devise';
            Description = 'AVIS - LN - 24/09/24 REV24';
            Editable = false;
            BlankNumbers = DontBlank;
            AutoFormatType = 0;
            DecimalPlaces = 1 : 15;
        }
        field(8; "Imputé"; Boolean)
        {
            Caption = 'Imputé';
            Description = 'AVIS - LN - 24/09/24 REV24';
            Editable = false;
            BlankNumbers = DontBlank;
            AutoFormatType = 0;
            FieldClass = FlowField;
            CalcFormula = exist("AvisDossierArrivage" where("Code credoc" = field("Code credoc"), "No. ligne avis" = field("No. ligne")));
        }
        field(9; "Mnt affecté total (doss)"; Decimal)
        {
            Caption = 'Mnt affecté total (doss)';
            Description = 'AVIS - LN - 24/09/24 REV24';
            Editable = false;
            BlankNumbers = DontBlank;
            FieldClass = FlowField;
            AutoFormatType = 1;
            CalcFormula = sum("AvisDossierArrivage"."Montant affecté" where("Code credoc" = field("Code credoc"), "No. ligne avis" = field("No. ligne")));
        }
        field(10; "Mnt affecté total (lig doss)"; Decimal)
        {
            Caption = 'Mnt affecté total (lig doss)';
            Description = 'AVIS - LN - 24/09/24 REV24';
            Editable = true;
            BlankNumbers = DontBlank;
            FieldClass = FlowField;
            AutoFormatType = 1;
            CalcFormula = Sum("AvisLigneDossier"."Montant affecté" where("Code credoc" = FIELD("Code credoc"), "No. ligne avis" = FIELD("No. ligne"), "Affectation" = CONST(true)));
        }
        field(11; "Mnt total lig doss affectées"; Decimal)
        {
            Caption = 'Mnt total lig doss affectées';
            Description = 'AVIS - LN - 24/09/24 REV24';
            Editable = true;
            BlankNumbers = DontBlank;
            FieldClass = FlowField;
            AutoFormatType = 1;
            CalcFormula = Sum("AvisLigneDossier"."Montant ligne (dev soc)" WHERE("Code credoc" = FIELD("Code credoc"), "No. ligne avis" = FIELD("No. ligne"), "Affectation" = CONST(true)));
        }
        field(12; "Vol total lig doss affectées"; Decimal)
        {
            Caption = 'Vol total lig doss affectées';
            Description = 'AVIS - LN - 24/09/24 REV24';
            Editable = true;
            BlankNumbers = DontBlank;
            FieldClass = FlowField;
            AutoFormatType = 1;
            CalcFormula = Sum("AvisLigneDossier"."Volume ligne" WHERE("Code credoc" = FIELD("Code credoc"), "No. ligne avis" = FIELD("No. ligne"), "Affectation" = CONST(true)));
        }
        field(13; "Prévisionnel"; Boolean)
        {
            Caption = 'Prévisionnel';
            Description = 'AVIS - LN - 24/09/24 REV24';
            Editable = true;
            BlankNumbers = DontBlank;
        }
        field(14; "%"; Decimal)
        {
            Caption = '%';
            Description = 'AVIS - LN - 24/09/24 REV24';
            Editable = true;
            BlankNumbers = DontBlank;
            AutoFormatType = 0;
            MinValue = 0;
            MaxValue = 100;
        }
    }

    keys
    {
        key(PK; "Code credoc", "No. ligne")
        {
            Clustered = true;
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


    // % - OnValidate()
    // IF NOT (Type IN [Type::Escompte,Type::"Avoir qualité"]) AND ("%" <> 0) THEN
    // ERROR('Le pourcentage ne peut-être saisi que pour les avis de type %1 ou %2',Type::Escompte,Type::"Avoir qualité");

    // % - OnLookup()

    // AssistEdit(AncPrest : Record Prestation) : Boolean

    // MajFacteurDevise()
    // IF "Code devise" <> '' THEN
    // "Facteur devise" := DeviseTauxChange.ExchangeRate(WORKDATE,"Code devise")
    // ELSE
    // "Facteur devise" := 0;

    // ConfirmerMajFacteurDevise()
    // IF CONFIRM('Voulez-vous mettre à jour le taux de change ?',FALSE) THEN
    // VALIDATE("Facteur devise")
    // ELSE
    // "Facteur devise" := xRec."Facteur devise";

}