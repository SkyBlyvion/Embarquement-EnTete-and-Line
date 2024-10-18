page 50271 "DossierArrivagePage"
{
    /*
    ====================================
    PAGE: Liste des Dossiers d'Arrivage
    ====================================
    Description :
    Cette page affiche la liste des dossiers d'arrivage. 
    L'utilisateur peut voir les informations principales comme 
    le numéro de dossier, la date d'ouverture et de clôture, 
    ainsi que le fournisseur associé. 
    
    Fonctionnement :
    - La page utilise la table "DossierArrivage" comme source.
    - L'utilisateur peut cliquer sur un dossier pour ouvrir sa page détaillée (CardPageID).
    - Les champs affichés incluent les numéros de dossier, les dates et les informations sur le fournisseur.
    
    Note :
    Utilisez la page "DossierArrivageDoc" pour gérer les détails d'un dossier spécifique.
    */

    ApplicationArea = All;
    Caption = 'Dossier Arrivage';
    PageType = List;
    SourceTable = "DossierArrivage";
    Editable = true;

    CardPageID = "DossierArrivageDoc"; // Lié à la page Document du dossier

    layout
    {
        area(Content)
        {
            repeater(Group)
            {
                field("No. Dossier"; Rec."No. Dossier")
                {
                    ToolTip = 'Le numéro unique associé à ce dossier d''arrivage.';
                }
                field("Date d'ouverture"; Rec."Date d'ouverture")
                {
                    ToolTip = 'La date à laquelle le dossier a été ouvert.';
                }
                field("Date de clôture"; Rec."Date de clôture")
                {
                    ToolTip = 'La date à laquelle le dossier a été clôturé.';
                }
                field("No. Fournisseur"; Rec."No. Fournisseur")
                {
                    ToolTip = 'Le fournisseur associé à ce dossier.';
                }
                field("Nom Fournisseur"; Rec."Nom Fournisseur")
                {
                    ToolTip = 'Le nom du fournisseur associé à ce dossier.';
                }

            }
        }
    }

}
