page 50272 LigneDossierArrivagePage
{
    ApplicationArea = All;
    Caption = 'Ligne Dossier Arrivage';
    PageType = List;
    SourceTable = "LigneDossierArrivage";
    Editable = true;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("No. dossier"; Rec."No. dossier")
                {
                    ToolTip = 'Le numéro du dossier associé à la ligne d''arrivage.';
                }
                field("No. ligne"; Rec."No. ligne")
                {
                    ToolTip = 'Le numéro de la ligne dans le dossier d''arrivage.';
                }
                field("No. preneur d'ordre"; Rec."No. preneur d'ordre")
                {
                    ToolTip = 'Le numéro du preneur d''ordre pour cette ligne.';
                }
                field("No. réception"; Rec."No. réception")
                {
                    ToolTip = 'Le numéro de réception associé à cette ligne.';
                }
                field("No. ligne réception"; Rec."No. ligne réception")
                {
                    ToolTip = 'Le numéro de la ligne de réception dans le document d''achat.';
                }
                field("No. article"; Rec."No. article")
                {
                    ToolTip = 'Le numéro de l''article dans la ligne du dossier.';
                }
                field("Code magasin"; Rec."Code magasin")
                {
                    ToolTip = 'Le code du magasin où l''article est stocké.';
                }
                field("Désignation"; Rec."Désignation")
                {
                    ToolTip = 'La désignation de l''article pour cette ligne.';
                }
                field("Désignation 2"; Rec."Désignation 2")
                {
                    ToolTip = 'Une deuxième désignation complémentaire de l''article.';
                }
                field("Quantité"; Rec."Quantité")
                {
                    ToolTip = 'La quantité d''articles dans cette ligne.';
                }
                field("Cout unitaire direct"; Rec."Cout unitaire direct")
                {
                    ToolTip = 'Le coût unitaire direct des articles pour cette ligne.';
                }
                field("Cout unitaire (dev soc)"; Rec."Cout unitaire (dev soc)")
                {
                    ToolTip = 'Le coût unitaire des articles exprimé dans la devise de la société.';
                }
                field("Montant"; Rec."Montant")
                {
                    ToolTip = 'Le montant total pour cette ligne d''article.';
                }
                field("Prix unitaire (dev soc)"; Rec."Prix unitaire (dev soc)")
                {
                    ToolTip = 'Le prix unitaire des articles en devise de la société.';
                }
                field("Référence fournisseur"; Rec."Référence fournisseur")
                {
                    ToolTip = 'La référence du fournisseur pour cet article.';
                }
                field("Cout unitaire"; Rec."Cout unitaire")
                {
                    ToolTip = 'Le coût unitaire des articles pour cette ligne.';
                }
                field("Conditionnement produit"; Rec."Conditionnement produit")
                {
                    ToolTip = 'Le conditionnement du produit associé à cette ligne.';
                }
                field("Quantité (piece)"; Rec."Quantité (piece)")
                {
                    ToolTip = 'La quantité de pièces pour cet article dans cette ligne.';
                }
                field("Cout unitaire (piece)"; Rec."Cout unitaire (piece)")
                {
                    ToolTip = 'Le coût unitaire par pièce pour cet article.';
                }
                field("Montant (dev soc)"; Rec."Montant (dev soc)")
                {
                    ToolTip = 'Le montant total pour cette ligne en devise de la société.';
                }
                field("Volume"; Rec."Volume")
                {
                    ToolTip = 'Le volume total des articles dans cette ligne.';
                }
                field("% Remise ligne"; Rec."% Remise ligne")
                {
                    ToolTip = 'Le pourcentage de remise appliqué sur cette ligne.';
                }
                field("No. commande"; Rec."No. commande")
                {
                    ToolTip = 'Le numéro de commande associé à cette ligne.';
                }
                field("Quantité par unité"; Rec."Quantité par unité")
                {
                    ToolTip = 'La quantité d''articles par unité pour cette ligne.';
                }
                field("Code devise"; Rec."Code devise")
                {
                    ToolTip = 'Le code de la devise utilisée pour cette ligne.';
                }
                field("Facteur devise"; Rec."Facteur devise")
                {
                    ToolTip = 'Le facteur de conversion de la devise pour cette ligne.';
                }
            }
        }
    }
}
