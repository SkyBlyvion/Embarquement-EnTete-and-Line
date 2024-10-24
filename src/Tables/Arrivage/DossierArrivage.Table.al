table 50249 "DossierArrivage"
{
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "No. Dossier"; Code[10])
        {
            DataClassification = ToBeClassified;
            Caption = 'No. Dossier';
            Description = 'DOSSIER_ARRIVAGE LN 13/09/24 REV24';
            Editable = false; //passer à false aprés debugg
            NotBlank = false;
        }
        field(3; "Date d'ouverture"; Date)
        {
            DataClassification = SystemMetadata;
            Caption = 'Date d''ouverture';
            Description = 'DOSSIER_ARRIVAGE LN 13/09/24 REV24';
            Editable = false;
            BlankNumbers = DontBlank;
        }
        field(4; "Date de clôture"; Date)
        {
            DataClassification = SystemMetadata;
            Caption = 'Date de clôture';
            Description = 'DOSSIER_ARRIVAGE LN 13/09/24 REV24';
            Editable = false;
            BlankNumbers = DontBlank;
        }
        field(5; "No. Fournisseur"; Code[20])
        {
            DataClassification = ToBeClassified;
            Caption = 'No. Fournisseur';
            Description = 'DOSSIER_ARRIVAGE LN 13/09/24 REV24';
            Editable = false;
        }
        field(6; "Souches de No."; Code[10])
        {
            DataClassification = ToBeClassified;
            Caption = 'Souche de No.';
            Description = 'DOSSIER_ARRIVAGE LN 13/09/24 REV24';
            Editable = false;
            TableRelation = "No. Series";
        }
        field(7; "Frais de transport"; Decimal)
        {
            Caption = 'Frais de transport';
            Description = 'DOSSIER_ARRIVAGE LN 13/09/24 REV24';
            FieldClass = FlowField;
            Editable = true;
            BlankNumbers = DontBlank;
            CalcFormula = Sum("PrestationDossierArrivage"."Montant affecté"
                            WHERE("No. Dossier" = field("No. Dossier"),
                            Type = const("Frais de transport")));
            //Sum("Prestation / dossiers arrivage"."Montant affecté" WHERE (N° dossier=FIELD(N° dossier),Type=CONST(Frais de transport)))
        }
        field(8; "Frais Financiers"; Decimal)
        {
            Caption = 'Frais Financiers';
            Description = 'DOSSIER_ARRIVAGE LN 13/09/24 REV24';
            FieldClass = FlowField;
            Editable = true;
            BlankNumbers = DontBlank;
            CalcFormula = Sum("PrestationDossierArrivage"."Montant affecté"
                            WHERE("No. Dossier" = FIELD("No. Dossier"),
                            Type = const("Frais Financiers")));
            //Sum("Prestation / dossiers arrivage"."Montant affecté" WHERE (N° dossier=FIELD(N° dossier),Type=CONST(Frais financiers)))

        }
        field(9; "Assurances"; Decimal)
        {
            Caption = 'Assurances';
            Description = 'DOSSIER_ARRIVAGE LN 13/09/24 REV24';
            FieldClass = FlowField;
            Editable = true;
            BlankNumbers = DontBlank;
            CalcFormula = Sum("PrestationDossierArrivage"."Montant affecté"
                            WHERE("No. Dossier" = FIELD("No. Dossier"),
                            Type = const("Assurances")));
            //Sum("Prestation / dossiers arrivage"."Montant affecté" WHERE (N° dossier=FIELD(N° dossier),Type=CONST(Assurances)))
        }
        field(10; "Commissions"; Decimal)
        {
            Caption = 'Commissions';
            Description = 'DOSSIER_ARRIVAGE LN 13/09/24 REV24';
            FieldClass = FlowField;
            Editable = true;
            BlankNumbers = DontBlank;
            CalcFormula = Sum("PrestationDossierArrivage"."Montant affecté"
                            WHERE("No. Dossier" = FIELD("No. Dossier"),
                            Type = const("Commissions")));
            //Sum("Prestation / dossiers arrivage"."Montant affecté" WHERE (N° dossier=FIELD(N° dossier),Type=CONST(Commissions)))
        }
        field(11; "Transit"; Decimal)
        {
            Caption = 'Transit';
            Description = 'DOSSIER_ARRIVAGE LN 13/09/24 REV24';
            FieldClass = FlowField;
            Editable = true;
            BlankNumbers = DontBlank;
            CalcFormula = Sum("PrestationDossierArrivage"."Montant affecté"
                            WHERE("No. Dossier" = FIELD("No. Dossier"),
                            Type = const("Transit")));
            //Sum("Prestation / dossiers arrivage"."Montant affecté" WHERE (N° dossier=FIELD(N° dossier),Type=CONST(Transit)))
        }
        field(12; "Douane"; Decimal)
        {
            Caption = 'Douane';
            Description = 'DOSSIER ARRIVAGE LN 13/09/24 REV24';
            FieldClass = FlowField;
            Editable = true;
            BlankNumbers = DontBlank;
            CalcFormula = Sum("PrestationDossierArrivage"."Montant affecté" WHERE("No. Dossier" = FIELD("No. Dossier"), Type = const("Douane")));
            //Sum("Prestation / dossiers arrivage"."Montant affecté" WHERE (N° dossier=FIELD(N° dossier),Type=CONST(Douane)))
        }
        field(13; "Nom Fournisseur"; Text[100])
        {
            Caption = 'Nom Fournisseur';
            Description = 'DOSSIER ARRIVAGE LN 13/09/24 REV24';
            Editable = true;
            FieldClass = FlowField;
            CalcFormula = Lookup("Vendor"."Name" WHERE("No." = field("No. Fournisseur")));
        }
        field(14; "Etat"; Option)
        {
            DataClassification = AccountData;
            Caption = 'Etat';
            Description = 'DOSSIER ARRIVAGE LN 13/09/24 REV24';
            Editable = true;
            BlankNumbers = DontBlank;
            OptionMembers = "En attente de facturation","Facturé","Clôturé";

            trigger OnValidate()
            begin

                IF xRec.Etat <> Etat THEN BEGIN

                    // Si on clôture le dossier
                    IF Etat = Etat::Clôturé THEN
                        IF NOT CONFIRM('Voulez-vous clôturer ce dossier d''arrivage ?') THEN
                            ERROR('Changement d''état annulé');
                    BEGIN
                        CalculerPR.CalculerPRRViaDossier(Rec, TRUE);
                        "Date de clôture" := WORKDATE();
                        MODIFY();
                    END;

                    // Si on ré-ouvre le dossier
                    IF xRec.Etat = Etat::Clôturé THEN
                        IF NOT CONFIRM('Attention : ce dossier d''arrivage est clôturé. Voulez-vous changer son état ?') THEN
                            ERROR('Changement d''état annulé');
                    BEGIN
                        "Date de clôture" := 0D;
                        HistoPRR.SETCURRENTKEY(Définitif);
                        HistoPRR.SETRANGE("No. dossier", "No. dossier");
                        HistoPRR.SETRANGE(Définitif, TRUE);
                        IF HistoPRR.FIND('-') THEN
                            REPEAT
                                HistoPRR.Définitif := FALSE;
                                HistoPRR.MODIFY();
                            UNTIL HistoPRR.NEXT() = 0;

                        MODIFY();
                    END;
                END;
            end;
        }
        field(15; "Mnt total lig doss (dev soc)"; Decimal)
        {
            Caption = 'Mnt total lig doss (dev soc)';
            Description = 'DOSSIER ARRIVAGE LN 13/09/24 REV24';
            FieldClass = FlowField;
            Editable = true;
            CalcFormula = sum("Lignedossierarrivage"."Montant (dev soc)" where("No. dossier" = field("No. dossier")));
            AutoFormatType = 1;
            BlankNumbers = DontBlank;
            // Sum("Ligne dossier arrivage"."Montant (dev soc)" WHERE (N° dossier=FIELD(N° dossier)))
        }
    }

    keys
    {
        key(Key1; "No. Dossier")
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
        ParamStock: Record "Inventory Setup";
        AvisDossier: Record "AvisDossierArrivage";
        PrestDossier: Record "PrestationDossierArrivage";
        HistoPRR: Record "HistoriquePRRTable";
        LigDossier: Record "Lignedossierarrivage";
        CalculerPr: Codeunit "CalculerPR";
        NoSeries: Codeunit "No. Series";
        GestionNoSouche: Codeunit "No. Series";
        NoArticlePrec: Code[20];
        NoCalcul: Integer;
        BonReceptions: Record "Purch. Rcpt. Header";

    trigger OnInsert()
    begin
        // Check if the "No. dossier" is empty before generating a new one
        if "No. dossier" = '' then begin
            //MESSAGE('OnInsert Trigger Hit: "No. dossier" is empty, attempting to generate a new number.');

            // Retrieve the stock parameters
            ParamStock.GET();
            //MESSAGE('ParamStock retrieved successfully.');

            // Ensure that "No. Dossier" in ParamStock is set
            ParamStock.TESTFIELD("No. Dossier");
            //MESSAGE('Using Number Series Code: %1', ParamStock."No. Dossier");

            // Try peeking the next number to see if one exists before modifying the series
            //MESSAGE('PeekNextNo: %1', NoSeries.PeekNextNo(ParamStock."No. Dossier", WORKDATE()));

            // Generate the next available number for "No. dossier"
            "No. dossier" := NoSeries.GetNextNo(ParamStock."No. Dossier", WORKDATE(), true);
            //MESSAGE('Generated No. dossier: %1', "No. dossier");

            // Assign the number series reference for "Souches de No."
            "Souches de No." := ParamStock."No. Dossier";
            //MESSAGE('Assigned Souches de No.: %1', "Souches de No.");

            // Validate the "No. dossier" to trigger any additional logic
            VALIDATE("No. dossier");

            // Final check if the "No. dossier" was properly assigned
            if "No. dossier" = '' then
                ERROR('Error: No. dossier was not generated properly.');
        end else
            // Log if "No. dossier" already has a value and doesn't need generation
            MESSAGE('OnInsert Trigger: "No. dossier" already has a value: %1', "No. dossier");

        // Set the opening date
        "Date d'ouverture" := TODAY;
        //MESSAGE('Opening date set to: %1', FORMAT("Date d'ouverture"));
    end;

    trigger OnModify()
    begin

    end;

    trigger OnDelete()
    begin
        // Destruction des Bons de réception liés
        BonReceptions.RESET();
        BonReceptions.SETRANGE("No. dossier", Rec."No. dossier");
        if BonReceptions.FINDSET() then
            repeat
                BonReceptions.DELETE(true);
            until BonReceptions.NEXT() = 0;

        // Check for linked records in Ligne Dossier
        LigDossier.RESET();
        LigDossier.SETRANGE("No. dossier", "No. dossier");
        if LigDossier.FINDFIRST() then
            ERROR(
                'Vous ne pouvez pas supprimer le %1 %2 car il y a des %3 liées à ce %1.',
                TABLECAPTION, "No. dossier", LigDossier.TABLECAPTION);

        // Check for linked records in EcritureArticle
        EcrArt.RESET();
        EcrArt.SETRANGE(EcrArt."No. dossier", "No. dossier");
        if EcrArt.FINDFIRST() then
            ERROR(
                'Vous ne pouvez pas supprimer le %1 %2 car il y a des %3 liées à ce %1.',
                TABLECAPTION, "No. dossier", EcrArt.TABLECAPTION);

        // Check for linked records in EnteteAchat
        EnteteAchat.RESET();
        EnteteAchat.SETRANGE("No. dossier", "No. dossier");
        if EnteteAchat.FINDFIRST() then
            ERROR(
                'Vous ne pouvez pas supprimer le %1 %2 car il y a des %3 liées à ce %1.',
                TABLECAPTION, "No. dossier", EnteteAchat.TABLECAPTION);

        // Deleting related records in AvisDossier
        AvisDossier.RESET();
        AvisDossier.SETRANGE("No. dossier", "No. dossier");
        AvisDossier.DELETEALL();

        // Deleting related records in PrestDossier
        PrestDossier.RESET();
        PrestDossier.SETRANGE("No. dossier", "No. dossier");
        PrestDossier.DELETEALL();
    end;


    trigger OnRename()
    begin

    end;


}