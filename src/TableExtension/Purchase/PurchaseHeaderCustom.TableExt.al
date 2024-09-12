tableextension 50240 PurchaseHeaderCustom extends "Purchase Header"
{
    fields
    {
        field(50000; "No. Dossier"; Code[10])
        {
            DataClassification = AccountData;
            Caption = 'N° Dossier';
            Description = 'DOSSIER_ARRIVAGE LN 12/09/24 REV24';
            Editable = true;
            //TODO: Dossier D'arrivage
            TableRelation = "Dossier d'arrivage"."No dossier"
                                WHERE("No Fournisseur" = FIELD("Buy-from Vendor No."));
        }
        field(50001; "Date disponibilité Perpignan"; Date)
        {
            DataClassification = AccountData;
            Caption = 'Date disponibilité Perpignan';
            Description = 'ENTETE_ACHAT LN  12/09/24 REV24';
            Editable = true;

        }
        field(50002; "Date d'embarquement prévue"; Date)
        {
            DataClassification = AccountData;
            Caption = 'Date d''embarquement prévue';
            Description = 'EMBARQUEMENT LN  12/09/24 REV24';
            Editable = true;
        }
        field(50004; "Incoterm"; Option)
        {
            DataClassification = AccountData;
            OptionMembers = EXW,FOB,CNI,CNF,CFR,CIF;
            Caption = 'Incoterm';
            Description = 'GENDCODE_INCOTERM LN  12/09/24 REV24';
            Editable = true;
        }
        field(50005; "Gencodage"; Boolean)
        {
            DataClassification = AccountData;
            Caption = 'Gencodage';
            Description = 'GENDCODE_INCOTERM LN  12/09/24 REV24';
            Editable = true;
        }
        field(50006; "Volume"; Decimal)
        {
            Caption = 'Volume';
            Description = 'VOLUME_POIDS LN  12/09/24 REV24';
            FieldClass = FlowField;
            CalcFormula = Sum("Purchase Line"."Volume"
                            WHERE("Document Type" = FIELD("Document Type"),
                            "Buy-from Vendor No." = FIELD("Buy-from Vendor No."),
                            "Document No." = FIELD("No.")));
            Editable = false;
        }
        field(50007; "Poids"; Decimal)
        {
            Caption = 'Poids';
            Description = 'VOLUME_POIDS LN  12/09/24 REV24';
            FieldClass = FlowField;
            CalcFormula = Sum("Purchase Line"."Poids"
                            WHERE("Document Type" = FIELD("Document Type"),
                            "Buy-from Vendor No." = FIELD("Buy-from Vendor No."),
                            "Document No." = FIELD("No.")));
            Editable = false;

        }
        field(50010; "Code transport routier"; Code[10])
        {
            DataClassification = AccountData;
            Caption = 'Code transport routier';
            Description = 'ENTETE_ACHAT LN  12/09/24 REV24';
            TableRelation = "Transport Method"."Code";
            Editable = true;
        }
        field(50011; "Montant transport routier"; Decimal)
        {
            DataClassification = AccountData;
            Caption = 'Montant transport routier';
            Description = 'ENTETE_ACHAT LN  12/09/24 REV24';
            Editable = true;
        }
        field(50012; "Code devise transport routier"; Code[10])
        {
            DataClassification = AccountData;
            Caption = 'Code devise transport routier';
            Description = 'ENTETE_ACHAT LN  12/09/24 REV24';
            Editable = true;
            TableRelation = "Currency"."Code";
        }
        field(50013; "Facteur devise transp. routier"; Decimal)
        {
            DataClassification = AccountData;
            Caption = 'Facteur devise transp. routier';
            Description = 'ENTETE_ACHAT LN  12/09/24 REV24';
            Editable = false;
        }
        field(50014; "Code transport maritime"; Code[10])
        {
            DataClassification = AccountData;
            Caption = 'Code transport maritime';
            Description = 'ENTETE_ACHAT LN  12/09/24 REV24';
            Editable = true;
            TableRelation = "Transport Method"."Code";
        }
        field(50015; "Montant transport maritime"; Decimal)
        {
            DataClassification = AccountData;
            Caption = 'Montant transport maritime';
            Description = 'ENTETE_ACHAT LN  12/09/24 REV24';
            Editable = true;
        }
        field(50016; "Code devise transport maritime"; Code[10])
        {
            DataClassification = AccountData;
            Caption = 'Code devise transport maritime';
            Description = 'ENTETE_ACHAT LN  12/09/24 REV24';
            Editable = true;
            TableRelation = "Currency"."Code";
        }
        field(50017; "Facteur devise transp. maritim"; Decimal)
        {
            DataClassification = AccountData;
            Caption = 'Facteur devise transp. maritime';
            Description = 'ENTETE_ACHAT LN  12/09/24 REV24';
            Editable = false;
        }
        field(50018; "% de frais financier"; Decimal)
        {
            DataClassification = AccountData;
            Caption = '% de frais financier';
            Description = 'ENTETE_ACHAT LN  12/09/24 REV24';
            MinValue = 0; // Pour les champs en % il faut set le Min Max Value( afin d'éviter les négatifs et les infinis )
            MaxValue = 100;
            Editable = true;
        }
        field(50019; "% Assurances"; Decimal)
        {
            DataClassification = AccountData;
            Caption = '% Assurances';
            Description = 'ENTETE_ACHAT LN  12/09/24 REV24';
            MinValue = 0;
            MaxValue = 100;
            Editable = true;
        }
        field(50020; "% Commissions"; Decimal)
        {
            DataClassification = AccountData;
            Caption = '% Commissions';
            Description = 'ENTETE_ACHAT LN  12/09/24 REV24';
            MinValue = 0;
            MaxValue = 100;
            Editable = true;
        }
        field(50021; "% Transit"; Decimal)
        {
            DataClassification = AccountData;
            Caption = '% Transit';
            Description = 'ENTETE_ACHAT LN  12/09/24 REV24';
            MinValue = 0;
            MaxValue = 100;
            Editable = true;
        }
        field(50023; "Date de relance"; Date)
        {
            DataClassification = AccountData;
            Caption = 'Date de relance';
            Description = 'ENTETE_ACHAT LN  12/09/24 REV24';
            Editable = true;
        }
        field(50024; "PRT Calculé"; Boolean)
        {
            Caption = 'PRT Calculé';
            Description = 'ENTETE_ACHAT LN  12/09/24 REV24';
            Editable = false;
            FieldClass = FlowField;
            CalcFormula = Exist("HistoriquePRTTable" WHERE("No commande" = FIELD("No.")));
        }
        field(50025; "Maj Réservation Vente"; Boolean)
        {
            DataClassification = AccountData;
            Caption = 'Maj Réservation Vente';
            Description = 'ENTETE_ACHAT LN  12/09/24 REV24';
        }
        field(50026; "No. commande portable"; Code[20])
        {
            DataClassification = AccountData;
            Caption = 'N° commande portable';
            Description = 'ENTETE_ACHAT LN  12/09/24 REV24';
        }
        field(50027; "Date calcul PRT"; Date)
        {
            DataClassification = AccountData;
            Caption = 'Date calcul PRT';
            Description = 'ENTETE_ACHAT LN  12/09/24 REV24';
        }
        field(50028; "Heure calcul PRT"; Time)
        {
            DataClassification = AccountData;
            Caption = 'Heure calcul PRT';
            Description = 'ENTETE_ACHAT LN  12/09/24 REV24';
        }
        field(50029; "Commande REV'GARDEN"; Boolean)
        {
            DataClassification = AccountData;
            Caption = 'Commande REV''GARDEN';
            Description = 'ENTETE_ACHAT LN  12/09/24 REV24';
        }
        field(50060; "Total Outstanding Quantity"; Decimal)
        {
            DataClassification = AccountData;
            Caption = 'Quantité totale en attente';
            Description = 'ENTETE_ACHAT LN  12/09/24 REV24';
        }
    }
}
