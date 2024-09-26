pageextension 50281 EntendWhseMngRoleCntr extends "Warehouse Manager Role Center" // Vous pouvez aussi cibler le Role Center exact
{
    actions
    {
        addafter("Orders1")
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