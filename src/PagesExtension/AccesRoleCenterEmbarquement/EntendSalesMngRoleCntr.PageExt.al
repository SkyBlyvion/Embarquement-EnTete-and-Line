pageextension 50282 EntendSalesMngRoleCntr extends "Sales Manager Role Center" // Vous pouvez aussi cibler le Role Center exact
{
    actions
    {
        addafter("SalesOrders")
        {
            action("Embarquement")
            {
                Caption = 'Embarquement';
                ApplicationArea = Basic, Suite;
                RunObject = Page "EnTeteEmbarquemen";
                ToolTip = 'Accédez à la gestion des embarquements pour les commandes d''achat.';
            }
        }
    }
}