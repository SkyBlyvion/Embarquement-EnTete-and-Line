tableextension 50250 "InventorySetupCustom" extends "Inventory Setup"
{
    fields
    {

        field(50000; "Images"; Text[250])
        {
            DataClassification = SystemMetadata;
            Caption = 'Images';
            Description = 'PARAM_STOCK - REVIMPORT - 13/09/24 REV24';
            Editable = true;
        }
        field(50001; "Unité par défault"; Code[10])
        {
            DataClassification = CustomerContent;
            Editable = true;
            Caption = 'Unité par défault';
            Description = 'PARAM_STOCK - REVIMPORT - 13/09/24 REV24';
            TableRelation = "Unit of Measure"."Code";
        }
        field(50002; "Magasin achat"; Code[10])
        {
            DataClassification = CustomerContent;
            Editable = true;
            Caption = 'Magasin achat';
            Description = 'PARAM_STOCK - REVIMPORT - 13/09/24 REV24';
            TableRelation = "Location";
        }
        field(50003; "Magasin vente"; Code[10])
        {
            DataClassification = CustomerContent;
            Editable = true;
            Caption = 'Magasin vente';
            Description = 'PARAM_STOCK - REVIMPORT - 13/09/24 REV24';
            TableRelation = "Location";
        }
        field(50004; "No. Dossier"; Code[10])
        {
            DataClassification = CustomerContent;
            Editable = true;
            Caption = 'No. Dossier';
            Description = 'DOSSIER_ARRIVAGE - REVIMPORT - 13/09/24 REV24';
            TableRelation = "No. Series";
        }
        field(50005; "Dernier No. Reserv."; Integer)
        {
            DataClassification = CustomerContent;
            Editable = false;
            Caption = 'Dernier No. Reserv.';
            Description = 'PARAM_STOCK - REVIMPORT - 13/09/24 REV24';
            BlankNumbers = DontBlank;
        }
    }

    keys
    {
        // Add changes to keys here
    }

    fieldgroups
    {
        // Add changes to field groups here
    }

    var

    /* Triggers to add - check for more !

    
        //PARAM_STOCK PC 08/02/00 NSC2.12 
        Ajout champ : 50005 "Dernier N° Reserv." pour le problème de conflit lors de la saisie de commande de vente.



        //MIGRATION_400 SC 10/10/05 NSC4.00 Migration et documentation
        
        Average Cost Calc. Type - OnValidate()
        IF "Average Cost Calc. Type" <> xRec."Average Cost Calc. Type" THEN BEGIN
        IF ItemLedgEntry.FIND('-') THEN BEGIN
            CODEUNIT.RUN(CODEUNIT::"Change Average Cost Calc. Type");
            FIND;
        END;
        END;


        IsAvgCostCalcTypeItem() : Boolean
        EXIT("Average Cost Calc. Type" = "Average Cost Calc. Type"::Item);
            
    */
}