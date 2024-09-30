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
            Editable = false;
            NotBlank = true;
        }
        field(3; "Date d'ouverture"; Date)
        {
            DataClassification = SystemMetadata;
            Caption = 'Date d''ouverture';
            Description = 'DOSSIER_ARRIVAGE LN 13/09/24 REV24';
            Editable = false;
        }
        field(4; "Date de clôture"; Date)
        {
            DataClassification = SystemMetadata;
            Caption = 'Date de clôture';
            Description = 'DOSSIER_ARRIVAGE LN 13/09/24 REV24';
            Editable = false;
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
            TableRelation = "No. Series"."Code";
        }
        field(7; "Frais de transport"; Decimal)
        {
            Caption = 'Frais de transport';
            Description = 'DOSSIER_ARRIVAGE LN 13/09/24 REV24';
            FieldClass = FlowField;
            Editable = true;
            CalcFormula = Sum("PrestationDossierArrivage"."Montant affecté"
                            WHERE("No. Dossier" = FIELD("No. Dossier"),
                            Type = const("Frais de transport")));
            //Sum("Prestation / dossiers arrivage"."Montant affecté" WHERE (N° dossier=FIELD(N° dossier),Type=CONST(Frais de transport)))
        }
        field(8; "Frais Financiers"; Decimal)
        {
            Caption = 'Frais Financiers';
            Description = 'DOSSIER_ARRIVAGE LN 13/09/24 REV24';
            FieldClass = FlowField;
            Editable = true;
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
            OptionMembers = "En attente de facturation","Facturé","Clôturé";

            // trigger OnValidate()
            // begin

            //     IF xRec.Etat <> Etat THEN BEGIN

            //         // Si on clôture le dossier
            //         IF Etat = Etat::Clôturé THEN
            //             IF NOT CONFIRM('Voulez-vous clôturer ce dossier d''arrivage ?') THEN
            //                 ERROR('Changement d''état annulé');
            //         BEGIN
            //             CalculerPR.CalculerPRRViaDossier(Rec, TRUE);
            //             "Date de clôture" := WORKDATE();
            //             MODIFY();
            //         END;

            //         // Si on ré-ouvre le dossier
            //         IF xRec.Etat = Etat::Clôturé THEN
            //             IF NOT CONFIRM('Attention : ce dossier d''arrivage est clôturé. Voulez-vous changer son état ?') THEN
            //                 ERROR('Changement d''état annulé');
            //         BEGIN
            //             "Date de clôture" := 0D;
            //             HistoPRR.SETCURRENTKEY(Définitif);
            //             HistoPRR.SETRANGE("No. dossier", "No. dossier");
            //             HistoPRR.SETRANGE(Définitif, TRUE);
            //             IF HistoPRR.FIND('-') THEN
            //                 REPEAT
            //                     HistoPRR.Définitif := FALSE;
            //                     HistoPRR.MODIFY;
            //                 UNTIL HistoPRR.NEXT = 0;

            //             MODIFY();
            //         END;
            //     END;
            // end;
        }
        field(15; "Mnt total lig doss (dev soc)"; Decimal)
        {
            Caption = 'Mnt total lig doss (dev soc)';
            Description = 'DOSSIER ARRIVAGE LN 13/09/24 REV24';
            FieldClass = FlowField;
            Editable = true;
            CalcFormula = sum("Lignedossierarrivage"."Montant (dev soc)" where("No. dossier" = field("No. dossier")));
            AutoFormatType = 1;
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
        HistoPR: Record "HistoriquePRRTable";
        LigDossier: Record "Lignedossierarrivage";
        // CalculerPr: Codeunit "Calculer PR"; TODO: Créer le CodeUnit "Calculer PR"
        GestionNoSouche: Codeunit "NoSeriesManagement";
        NoArticlePrec: Code[20];
        NoCalcul: Integer;
        BonReceptions: Record "Purch. Rcpt. Header";

    trigger OnInsert()
    begin

        IF "No. dossier" = '' THEN BEGIN
            ParamStock.GET();
            ParamStock.TESTFIELD("No. Dossier");
            GestionNoSouche.InitSeries(ParamStock."No. Dossier", xRec."Souches de No.", 0D, "No. dossier", "Souches de No.");
        END;

        "Date d'ouverture" := TODAY;
    end;

    trigger OnModify()
    begin

    end;

    trigger OnDelete()
    begin

        // //* NSC1.08 :Destruction des Bons de reception liés
        // BonReceptions.RESET();
        // BonReceptions.SETRANGE("No. dossier", "No. dossier");
        // IF BonReceptions.FIND('-') THEN
        //     REPEAT
        //         BonReceptions.DELETE(TRUE);
        //     UNTIL BonReceptions.NEXT() = 0;
        // //* FIN NSC1.08 :Destruction des Bons de reception liés

        // LigDossier.RESET();
        // LigDossier.SETRANGE("No. dossier", "No. dossier");
        // IF LigDossier.FIND('-') THEN
        //     ERROR(
        //         'Vous ne pouvez pas supprimer le %1 %2 car il y a des %3 liées à ce %1.',
        //         TABLENAME, "No. dossier", LigDossier.TABLENAME);

        // EcrArt.RESET();
        // EcrArt.SETRANGE("No. dossier", "No. dossier");
        // IF EcrArt.FIND('-') THEN
        //     ERROR(
        //         'Vous ne pouvez pas supprimer le %1 %2 car il y a des %3 liées à ce %1.',
        //         TABLENAME, "No. dossier", EcrArt.TABLENAME);

        // EnteteAchat.RESET();
        // EnteteAchat.SETRANGE("No. dossier", "No. dossier");
        // IF EnteteAchat.FIND('-') THEN
        //     ERROR(
        //         'Vous ne pouvez pas supprimer le %1 %2 car il y a des %3 liées à ce %1.',
        //         TABLENAME, "No. dossier", EnteteAchat.TABLENAME);

        // AvisDossier.RESET();
        // AvisDossier.SETRANGE("No. dossier", "No. dossier");
        // AvisDossier.DELETEALL();

        // PrestDossier.RESET();
        // PrestDossier.SETRANGE("No. dossier", "No. dossier");
        // PrestDossier.DELETEALL();
    end;

    trigger OnRename()
    begin

    end;


}