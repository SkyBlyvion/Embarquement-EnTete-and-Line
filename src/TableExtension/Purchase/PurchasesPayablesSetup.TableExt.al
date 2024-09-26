tableextension 50237 "PurchasesPayablesSetup" extends "Purchases & Payables Setup"
{

    fields
    {
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