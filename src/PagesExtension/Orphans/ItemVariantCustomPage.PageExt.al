pageextension 50277 ItemVariantCustomPage extends "Item Variants"
{
    Caption = 'Custom Item Variants';

    layout
    {
        addafter("Description")
        {

            field("Quantité Conditionnement"; Rec."Quantité Conditionnement")
            {
                ApplicationArea = All;
                ToolTip = 'Indique la quantité de conditionnement pour cet article.';
            }
            field("Sous Colisage"; Rec."Sous Colisage")
            {
                ApplicationArea = All;
                ToolTip = 'Indique le sous-colisage du produit.';
            }
            field("Longeur"; Rec."Longeur")
            {
                ApplicationArea = All;
                ToolTip = 'Spécifie la longueur du produit en centimètres.';
            }
            field("Largeur"; Rec."Largeur")
            {
                ApplicationArea = All;
                ToolTip = 'Spécifie la largeur du produit en centimètres.';
            }
            field("Hauteur"; Rec."Hauteur")
            {
                ApplicationArea = All;
                ToolTip = 'Spécifie la hauteur du produit en centimètres.';
            }
            field("Volume"; Rec."Volume")
            {
                ApplicationArea = All;
                ToolTip = 'Indique le volume total du produit en centimètres cubes.';
            }
            field("Poids"; Rec."Poids")
            {
                ApplicationArea = All;
                ToolTip = 'Indique le poids total du produit en kilogrammes.';
            }
            field("Prioritaire Achat"; Rec."Prioritaire Achat")
            {
                ApplicationArea = All;
                ToolTip = 'Indique si cet article est prioritaire pour l''achat.';
            }
            field("Choix"; Rec."Choix")
            {
                ApplicationArea = All;
                ToolTip = 'Spécifie si cet article est utilisé pour les achats, ventes ou les deux.';
            }
            field("Présentation"; Rec."Présentation")
            {
                ApplicationArea = All;
                ToolTip = 'Spécifie le type de présentation du produit.';
            }
            field("Prioritaire Vente"; Rec."Prioritaire Vente")
            {
                ApplicationArea = All;
                ToolTip = 'Indique si cet article est prioritaire pour la vente.';
            }
            field("Qté minimum vente"; Rec."Qté minimum vente")
            {
                ApplicationArea = All;
                ToolTip = 'Indique la quantité minimum pour la vente de cet article.';
            }
        }
    }
}
