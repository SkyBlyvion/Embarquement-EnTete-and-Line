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

            trigger OnValidate()
            begin
                if xRec.Type <> Type then begin
                    AvisDossier.RESET();
                    AvisDossier.SETRANGE("Code credoc", "Code credoc");
                    AvisDossier.SETRANGE("No. ligne avis", "No. ligne");
                    if AvisDossier.FIND('-') then
                        repeat
                            AvisDossier.VALIDATE(Type, Type);
                            AvisDossier.MODIFY();
                        until AvisDossier.NEXT() = 0;
                    if not (Type in [Type::Escompte, Type::"Avoir qualité"]) and ("%" <> 0) then begin
                        "%" := 0;
                        MODIFY();
                    end;

                end;
            end;
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

            trigger OnValidate()
            begin
                if CurrFieldNo <> FIELDNO("Code devise") then
                    MajFacteurDevise()
                else
                    if "Code devise" <> xRec."Code devise" then
                        MajFacteurDevise()
                    else
                        if "Code devise" <> '' then begin
                            MajFacteurDevise();
                            if "Facteur devise" <> xRec."Facteur devise" then
                                ConfirmerMajFacteurDevise();
                        end;

            end;
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

            trigger OnValidate()
            begin
                if "Facteur devise" <> xRec."Facteur devise" then
                    HistPRR.RESET();
                HistPRR.SETRANGE("Code credoc Avis source", "Code credoc");
                HistPRR.SETRANGE("No. ligne Avis source", "No. ligne");

                //* NSC2.20 PN 22/03/2000 On n'interdit la modif que si le prr est définitif (P.Revel)
                //* mail du 22/03/2000
                // c'est à dire si le dossier est clôturé
                HistPRR.SETRANGE(Définitif, true);
                //* NSC2.20 PN 22/03/2000

                if HistPRR.FIND('-') then
                    ERROR('Il existe des lignes d''historique PRR (définitif) basées sur l''Avis en cours. Pour pouvoir ' +
                        'changer le taux de devise, il vous faut déclôturer les dossiers d''arrivages associés à cet avis');
            end;
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
        DeviseTauxChange: Record "Currency Exchange Rate";
        Avis: Record "Avis";
        AvisDossier: Record "AvisDossierArrivage";
        Dossier: Record "DossierArrivage";
        HistPRR: Record "HistoriquePRRTable";

    trigger OnInsert()
    begin
        if "No. ligne" = 0 then begin
            Avis.RESET();
            Avis.SETRANGE("Code credoc", "Code credoc");
            if Avis.FIND('+') then
                "No. ligne" := Avis."No. ligne" + 1
            else
                "No. ligne" := 1;
        end;
    end;

    trigger OnModify()
    begin

    end;

    trigger OnDelete()
    begin
        AvisDossier.RESET();
        AvisDossier.SETRANGE("Code credoc", "Code credoc");
        AvisDossier.SETRANGE("No. ligne avis", "No. ligne");

        Dossier.SETRANGE(Etat, Dossier.Etat::Clôturé);
        repeat
            AvisDossier.SETRANGE("No. dossier", Dossier."No. dossier");
            if AvisDossier.FIND('-') then
                ERROR('Suppression impossible : cette prestation est associée à des dossiers clôturés');
        until Avis.NEXT() = 0;

        AvisDossier.SETRANGE("No. dossier");
        AvisDossier.DELETEALL(true);
    end;

    trigger OnRename()
    begin

    end;

    procedure MajFacteurDevise()
    begin
        if "Code devise" <> '' then
            "Facteur devise" := DeviseTauxChange.ExchangeRate(WORKDATE(), "Code devise")
        else
            "Facteur devise" := 0;
    end;

    procedure ConfirmerMajFacteurDevise()
    begin
        if CONFIRM('Voulez-vous mettre à jour le taux de change ?', false) then
            VALIDATE("Facteur devise")
        else
            "Facteur devise" := xRec."Facteur devise";
    end;
}