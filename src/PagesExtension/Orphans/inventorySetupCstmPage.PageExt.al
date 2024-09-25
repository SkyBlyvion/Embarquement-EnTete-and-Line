pageextension 50276 inventorySetupCstmPage extends "Inventory Setup"
{
    Caption = 'Inventory Setup Custom';

    layout
    {
        addafter("Allow Inventory Adjustment")
        {

            field("Images"; Rec."Images")
            {
                ApplicationArea = All;
                ToolTip = 'Définir les chemins des images utilisées dans les paramètres d''inventaire.';
            }
            field("Unité par défault"; Rec."Unité par défault")
            {
                ApplicationArea = All;
                ToolTip = 'Sélectionner l''unité de mesure par défaut pour les articles en stock.';
            }
            field("Magasin achat"; Rec."Magasin achat")
            {
                ApplicationArea = All;
                ToolTip = 'Définir le magasin utilisé pour les achats.';
            }
            field("Magasin vente"; Rec."Magasin vente")
            {
                ApplicationArea = All;
                ToolTip = 'Définir le magasin utilisé pour les ventes.';
            }
            field("No. Dossier"; Rec."No. Dossier")
            {
                ApplicationArea = All;
                ToolTip = 'Spécifier le numéro du dossier lié à ce paramètre d''inventaire.';
            }
            field("Dernier No. Reserv."; Rec."Dernier No. Reserv.")
            {
                ApplicationArea = All;
                ToolTip = 'Afficher le dernier numéro de réservation attribué dans l''inventaire.';
            }

        }
    }
}
