pageextension 50280 ExtendBusnMngRoleCntr extends "Business Manager Role Center" // Vous pouvez aussi cibler le Role Center exact
{
    actions
    {
        addbefore("Blanket Purchase Orders")
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