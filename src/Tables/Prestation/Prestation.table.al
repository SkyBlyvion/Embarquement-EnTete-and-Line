table 50253 Prestation
{
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "No."; Code[10])
        {
            DataClassification = CustomerContent;
            Caption = 'No.';
            Description = 'PRESTATION - LN - 09/09/24 REV24';
            Editable = true;
            NotBlank = false;

            /*
            Trigger cause des erreurs empechant la creation de numeros

            trigger OnValidate()
            var
                ParamAchat: Record "Purchases & Payables Setup";
                NoSeriesMgt: Codeunit "No. Series";
            begin
                // Check if the No. field is empty to avoid validation errors
                if "No." = '' then
                    exit;

                // Check if the No. has been changed manually
                if "No." <> xRec."No." then begin
                    // Get the purchasing parameters and ensure "No. prestation" series is set
                    ParamAchat.GET();
                    NoSeriesMgt.TestManual(ParamAchat."No. prestation"); // Verifies if the number series allows manual numbering

                    // Clear the number series reference since this is a manual change
                    "Souches de No." := '';
                end;
            end;

            */
        }
        field(2; "No. document"; Code[20])
        {
            DataClassification = CustomerContent;
            Caption = 'No. document';
            Description = 'PRESTATION - LN - 09/09/24 REV24';
            Editable = true;
            NotBlank = false;
        }
        field(3; "Date"; Date)
        {
            DataClassification = SystemMetadata;
            Caption = 'Date';
            Description = 'PRESTATION - LN - 09/09/24 REV24';
            Editable = true;
            NotBlank = true;
            ClosingDates = false;
        }
        field(4; "Type"; Option)
        {
            DataClassification = CustomerContent;
            Caption = 'Type';
            Description = 'PRESTATION - LN - 09/09/24 REV24';
            Editable = true;
            NotBlank = true;
            BlankNumbers = DontBlank;
            OptionMembers = "Frais de transport","Frais Financiers","Assurances","Commissions","Transit","Douane";

            trigger OnValidate()
            var
                PrestDossier: Record "PrestationDossierArrivage";
            begin
                if xRec.Type <> Type then begin
                    PrestDossier.SETRANGE("No. prestation", "No.");
                    IF PrestDossier.FINDSET() THEN
                        REPEAT
                            PrestDossier.VALIDATE(Type, Type);
                            PrestDossier.MODIFY(true);
                        UNTIL PrestDossier.NEXT() = 0;
                end;
            end;
        }
        field(5; "Montant"; Decimal)
        {
            DataClassification = CustomerContent;
            Caption = 'Montant';
            Description = 'PRESTATION - LN - 09/09/24 REV24';
            Editable = true;
            NotBlank = false;
        }
        field(6; "Code devise"; Code[10])
        {
            DataClassification = SystemMetadata;
            Caption = 'Code devise';
            Description = 'PRESTATION - LN - 09/09/24 REV24';
            Editable = true;
            NotBlank = false;
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
            DataClassification = CustomerContent;
            Caption = 'Facteur devise';
            Description = 'PRESTATION - LN - 09/09/24 REV24';
            BlankNumbers = DontBlank;
            Editable = false;
            MinValue = 0;
            DecimalPlaces = 1 : 15;
        }
        field(8; "Imputé"; Boolean)
        {
            Caption = 'Imputé';
            Description = 'PRESTATION - LN - 09/09/24 REV24';
            Editable = false;
            NotBlank = false;
            FieldClass = FlowField;
            InitValue = false;
            CalcFormula = Exist("PrestationDossierArrivage" WHERE("No. prestation" = FIELD("No.")));
            // checks if there is any record in the "PrestationDossierArrivage" table where 
            // the "No. prestation" field matches the current "No." in the "Prestation" table.
        }
        field(9; "Mnt affecté total (doss)"; Decimal)
        {
            Caption = 'Mnt affecté total (doss)';
            Description = 'PRESTATION - LN - 09/09/24 REV24';
            Editable = false;
            BlankNumbers = DontBlank;
            FieldClass = FlowField;
            CalcFormula = Sum("PrestationDossierArrivage"."Montant affecté" WHERE("No. prestation" = FIELD("No.")));
        }
        field(10; "Mnt affecté total (lig doss)"; Decimal)
        {
            Caption = 'Mnt affecté total (lig doss)';
            Description = 'PRESTATION - LN - 09/09/24 REV24';
            Editable = true;
            BlankNumbers = DontBlank;
            FieldClass = FlowField;
            CalcFormula = Sum("Prestationlignedossier"."Montant affecté" WHERE("No. prestation" = FIELD("No."), "Affectation" = CONST(true)));
        }
        field(11; "Mnt total lig doss affectées"; Decimal)
        {
            Caption = 'Mnt total lig doss affectées';
            Description = 'PRESTATION - LN - 09/09/24 REV24';
            Editable = true;
            BlankNumbers = DontBlank;
            FieldClass = FlowField;
            CalcFormula = Sum("Prestationlignedossier"."Montant ligne (dev soc)" WHERE("No. prestation" = FIELD("No."), "Affectation" = CONST(true)));
        }
        field(12; "Vol total lig doss affectées"; Decimal)
        {
            Caption = 'Vol total lig doss affectées';
            Description = 'PRESTATION - LN - 09/09/24 REV24';
            Editable = true;
            BlankNumbers = DontBlank;
            FieldClass = FlowField;
            CalcFormula = Sum("Prestationlignedossier"."Volume ligne" WHERE("No. prestation" = FIELD("No."), "Affectation" = CONST(true)));
        }
        field(13; "Prévisionnel"; Boolean)
        {
            DataClassification = CustomerContent;
            Caption = 'Prévisionnel';
            Description = 'PRESTATION - LN - 09/09/24 REV24';
            Editable = true;
            NotBlank = false;
        }
        field(15; "Souches de No."; Code[10])
        {
            DataClassification = SystemMetadata;
            Caption = 'Souche de No.';
            Description = 'PRESTATION - LN - 09/09/24 REV24';
            Editable = false;
        }
    }



    keys
    {
        key(PK; "No.")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
        // Add changes to field groups here
    }

    var
        Dossier: Record "DossierArrivage";
        DeviseTauxChange: Record "Currency Exchange Rate";
        Prest: Record "Prestation";
        ParamAchat: Record "Purchases & Payables Setup";
        PrestDossier: Record "PrestationDossierArrivage";
        //GestionNoSouche: Codeunit "NoSeriesManagement";
        NoSeries: Codeunit "No. Series";

    trigger OnInsert()
    begin
        if "No." = '' then begin
            //MESSAGE('OnInsert Trigger Hit: No. is empty, attempting to generate a new number.');

            // Retrieve the Purchases & Payables Setup
            ParamAchat.GET();

            // Check if No. prestation is set
            ParamAchat.TESTFIELD("No. prestation");

            // Debugging message to confirm the number series being used
            //MESSAGE('Using Number Series Code: %1', ParamAchat."No. prestation");

            // Try peeking the next number to see if one exists before modifying the series
            //MESSAGE('PeekNextNo: %1', NoSeries.PeekNextNo(ParamAchat."No. prestation", WORKDATE()));

            // Generate the next available number from the series
            "No." := NoSeries.GetNextNo(ParamAchat."No. prestation", WORKDATE(), true);

            // Log the generated number
            MESSAGE('Generated No.: %1', "No.");

            // Validate the "No." field to trigger any validation logic
            VALIDATE("No.");

            // Assign the number series reference if necessary
            "Souches de No." := ParamAchat."No. prestation";

            // Log the number series being assigned
            //MESSAGE('Assigned Souches de No.: %1', "Souches de No.");

            // Final check if the "No." was properly assigned
            if "No." = '' then
                ERROR('Error: No. was not generated properly.');
        end else
            // Log if No. already has a value and doesn't need generation
            MESSAGE('OnInsert Trigger: No. field already has a value: %1', "No.");

    end;




    trigger OnModify()
    begin

    end;

    trigger OnDelete()
    begin
        // Prevent deletion if the prestation is linked to a closed dossier
        Dossier.SETRANGE(Etat, Dossier.Etat::Clôturé);
        REPEAT
            PrestDossier.SETRANGE("No. dossier", Dossier."No. dossier");
            PrestDossier.SETRANGE("No. prestation", "No.");
            IF PrestDossier.FINDFIRST() THEN
                ERROR('Suppression impossible : cette prestation est associée à des dossiers clôturés');
        UNTIL Dossier.NEXT() = 0;

        // If no restrictions, delete the linked records
        PrestDossier.RESET();
        PrestDossier.SETRANGE("No. prestation", "No.");
        PrestDossier.DELETEALL(true);
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
        if CONFIRM('Voulez-vous mettre à jour le taux de change ?', FALSE) then
            VALIDATE("Facteur devise")
        else
            "Facteur devise" := xRec."Facteur devise";
    end;

    /*
        procedure AssistEdit(var AncPrest: Record Prestation): Boolean
        var

            NoSeriesMgt: Codeunit "No. Series";
        begin
            // Assurez-vous que les paramètres d'achat sont disponibles et corrects
            ParamAchat.GET();
            ParamAchat.TESTFIELD("No. prestation");

            // Assigner directement le prochain numéro généré au champ "No."
            "No." := NoSeriesMgt.GetNextNo(ParamAchat."No. prestation", WORKDATE(), true);

            // Mettre à jour l'enregistrement avec les informations de AncPrest
            Rec := AncPrest;

            exit(true); // Retourne true si l'opération s'est bien déroulée
        end;
    */

}