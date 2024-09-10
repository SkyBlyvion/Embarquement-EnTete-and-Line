tableextension 50236 "PurchasesPayablesSetup" extends "Purchases & Payables Setup"
{

    fields
    {
        field(50000; "No prestation"; Code[10])
        {
            DataClassification = ToBeClassified;
            Caption = 'No prestation';
            Description = 'PARAM_ACHAT - REVIMPORT - 10/09/24';
            TableRelation = "No. Series";
        }

        field(50001; "No embarquement"; Code[10])
        {
            DataClassification = ToBeClassified;
            Caption = 'No embarquement';
            Description = 'EMBARQUEMENT - REVIMPORT - 10/09/24';
            TableRelation = "No. Series";
        }

    }


}