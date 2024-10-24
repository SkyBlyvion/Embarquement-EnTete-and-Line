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

            trigger OnValidate()
            begin
                //* Insertion dans la table Historique credoc si changement de la date de validité
                IF (xRec."Date validité" <> Rec."Date validité") AND (xRec."Date validité" <> 0D) THEN BEGIN
                    HistoCredoc.INIT();
                    HistoCredoc."Code credoc" := Code;
                    HistoCredoc."Date validité" := "Date validité";
                    HistoCredoc."Montant initial" := "Montant Initial";
                    HistoCredoc."Date modification" := TODAY;
                    HistoCredoc.INSERT();
                END;
                //*
            end;
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

            trigger OnValidate()
            begin
                // Check if the current field number is different from "Code devise"
                IF CurrFieldNo <> FIELDNO("Code devise") THEN
                    MajFacteurDevise()
                ELSE BEGIN
                    // If the code has changed, update the currency factor
                    IF "Code devise" <> xRec."Code devise" THEN
                        MajFacteurDevise();

                    // Only check and confirm if the code is not empty
                    IF "Code devise" <> '' THEN BEGIN
                        MajFacteurDevise();
                        IF "Facteur devise" <> xRec."Facteur devise" THEN
                            ConfirmerMajFacteurDevise();
                    end;

                end;
            end;
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

            trigger OnValidate()
            begin
                //* Mise à jour de la table Historique credoc si changement du montant initial
                IF (xRec."Montant Initial" <> Rec."Montant Initial") AND (xRec."Montant Initial" <> 0) THEN BEGIN
                    HistoCredoc.SETRANGE("Code credoc", Code);
                    IF HistoCredoc.FIND('-') THEN BEGIN
                        HistoCredoc.INIT();
                        HistoCredoc."Code credoc" := Code;
                        HistoCredoc."Date validité" := "Date validité";
                        HistoCredoc."Montant initial" := "Montant Initial";
                        HistoCredoc."Date modification" := TODAY;
                        HistoCredoc.INSERT();
                    END;
                END;
                //*
            end;
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

    procedure MajFacteurDevise()
    begin
        IF "Code devise" <> '' THEN
            "Facteur devise" := DeviseTauxChange.ExchangeRate(WORKDATE(), "Code devise")
        ELSE
            "Facteur devise" := 0;
    end;

    procedure ConfirmerMajFacteurDevise()
    begin
        IF CONFIRM('Voulez-vous mettre à jour le taux de change ?', FALSE) THEN
            VALIDATE("Facteur devise")
        ELSE
            "Facteur devise" := xRec."Facteur devise";
    end;

    procedure CalculMontantUtiliseEnDev(DeviseSource: Code[10])
    var
        AvisDossierArrivage: Record "AvisDossierArrivage";
        Avis: Record "Avis";
    begin
        AvisDossierArrivage.RESET();
        AvisDossierArrivage.SETRANGE("Code credoc", Code);
        AvisDossierArrivage.SETRANGE(Type, AvisDossierArrivage.Type::Marchandise);

        "Montant utilisé" := 0;

        IF AvisDossierArrivage.FIND('-') THEN
            REPEAT
                Avis.GET(AvisDossierArrivage."Code credoc", AvisDossierArrivage."No. ligne avis");

                "Montant utilisé" := "Montant utilisé" +
                DeviseTauxChange.MntChangeDevVersDev2(WORKDATE(), Avis."Code devise", DeviseSource, AvisDossierArrivage."Montant affecté", 2)

            UNTIL AvisDossierArrivage.NEXT() = 0;
    end;
}
