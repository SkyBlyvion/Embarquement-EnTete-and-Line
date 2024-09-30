pageextension 50280 ExtendBusnMngRoleCntr extends "Business Manager Role Center" // Vous pouvez aussi cibler le Role Center exact
{
    actions
    {
        // Ajouter une nouvelle action pour "Embarquement" dans le Menu de la landing page sous Achats
        addbefore("Blanket Purchase Orders")
        {
            action("Embarquement")
            {
                Caption = 'Embarquements';
                ApplicationArea = Basic, Suite;
                RunObject = Page "EnTeteEmbarquemen";
                ToolTip = 'Accédez à la gestion des embarquements pour les commandes d''achat.';
            }
        }
        // Ajouter une nouvelle action pour "Dossiers Arrivage" dans le Menu de la landing page a droite de Achats
        addlast(Sections)
        {
            group("Dossiers d'arrivage")
            {
                Caption = 'Dossiers d''arrivage';

                action("Dossier d'arrivage")
                {
                    Caption = 'Gestion des Dossiers';
                    ApplicationArea = Basic, Suite;
                    RunObject = Page "DossierArrivagePage";
                    ToolTip = 'Accéder à la gestion des dossiers d''arrivage pour les achats.';
                }
                action("Avis")
                {
                    Caption = 'Gestion des Avis';
                    ApplicationArea = Basic, Suite;
                    RunObject = Page "AvisDossierArrivagePage";
                    ToolTip = 'Accéder à la gestion des dossiers d''arrivage pour les achats.';
                }
                action("Prestation")
                {
                    Caption = 'Gestion des Prestations';
                    ApplicationArea = Basic, Suite;
                    RunObject = Page "PrestationDossierArrivagePage";
                    ToolTip = 'Accéder à la gestion des dossiers d''arrivage pour les achats.';
                }
            }
        }
    }
}
