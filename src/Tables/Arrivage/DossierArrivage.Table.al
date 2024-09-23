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


}