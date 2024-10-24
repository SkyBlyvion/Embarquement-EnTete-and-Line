page 50261 LigneDossierArrivageSubForm
{
    ApplicationArea = All;
    Caption = 'Ligne Dossier Arrivage';
    PageType = ListPart;
    SourceTable = "LigneDossierArrivage";
    Editable = true;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("No. réception"; Rec."No. réception")
                {
                    ToolTip = 'Le numéro de réception associé à cette ligne.';
                }
                field("No. commande"; Rec."No. commande")
                {
                    ToolTip = 'Le numéro de commande associé à cette ligne.';
                }
                field("No. article"; Rec."No. article")
                {
                    ToolTip = 'Le numéro de l''article dans la ligne du dossier.';
                }
                field("Quantité par unité"; Rec."Quantité par unité")
                {
                    ToolTip = 'La quantité d''articles par unité pour cette ligne.';
                }
                field("Désignation"; Rec."Désignation")
                {
                    ToolTip = 'La désignation de l''article pour cette ligne.';
                }
                field("Référence fournisseur"; Rec."Référence fournisseur")
                {
                    ToolTip = 'La référence du fournisseur pour cet article.';
                }
                field("Quantité"; Rec."Quantité")
                {
                    ToolTip = 'La quantité d''articles dans cette ligne.';
                }
                field("Quantité (piece)"; Rec."Quantité (piece)")
                {
                    ToolTip = 'La quantité de pièces pour cet article dans cette ligne.';
                }
                field("Cout unitaire direct"; Rec."Cout unitaire direct")
                {
                    ToolTip = 'Le coût unitaire direct des articles pour cette ligne.';
                }
                field("% Remise ligne"; Rec."% Remise ligne")
                {
                    ToolTip = 'Le pourcentage de remise appliqué sur cette ligne.';
                }
                field("Montant"; Rec."Montant")
                {
                    ToolTip = 'Le montant total pour cette ligne d''article.';
                }
                field("Volume"; Rec."Volume")
                {
                    ToolTip = 'Le volume total des articles dans cette ligne.';
                }
            }
        }
    }
}
