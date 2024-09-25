pageextension 50275 PurchasePayablesSetup extends "Purchases & Payables Setup"
{
    layout
    {
        addafter("Posted Prepmt. Cr. Memo Nos.")
        {
            field("No. prestation"; Rec."No. prestation")
            {
                ApplicationArea = All;
                ToolTip = 'Numero de la prestation';
                Description = 'PARAM_ACHAT - REVIMPORT - 25/09/24';
            }
            field("No. embarquement"; Rec."No. embarquement")
            {
                ApplicationArea = All;
                ToolTip = 'Numero de l''embarquement';
                Description = 'PARAM_ACHAT - REVIMPORT - 25/09/24';
            }
        }
    }

}