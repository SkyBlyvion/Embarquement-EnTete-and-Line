tableextension 50237 "PurchasesPayablesSetup" extends "Purchases & Payables Setup"
{

    fields
    {
        field(50002; "No. dossier"; Code[10])
        {
            DataClassification = ToBeClassified;
            Caption = 'No. dossier';
            Description = 'PARAM_ACHAT - LN - 10/09/24';
            TableRelation = "No. Series".Code;
            ObsoleteState = Removed;
            ObsoleteReason = 'No. dossier est géré directement dans InventorySetupCustom';
        }
        field(50000; "No. prestation"; Code[10])
        {
            DataClassification = ToBeClassified;
            Caption = 'No. prestation';
            Description = 'PARAM_ACHAT - LN - 10/09/24';
            TableRelation = "No. Series".Code;
        }
        field(50001; "No. embarquement"; Code[10])
        {
            DataClassification = ToBeClassified;
            Caption = 'No. embarquement';
            Description = 'EMBARQUEMENT - LN - 10/09/24';
            TableRelation = "No. Series".Code;
        }

    }


}