page 50264 "LigneEmbarquemen"
{
    ApplicationArea = All;
    Caption = 'Lignes Embarquement';
    PageType = List;
    SourceTable = "LigneEmbarquement";
    Editable = true;

    layout
    {
        area(Content)
        {
            repeater(Group)
            {
                field("No. embarquement"; Rec."No. embarquement")
                {
                    ToolTip = 'Numéro de l''embarquement auquel cette ligne est associée.';
                }
                field("No. preneur d'ordre"; Rec."No. preneur d'ordre")
                {
                    ToolTip = 'Numéro du preneur d''ordre pour cette ligne d''embarquement.';
                }
                field("No. ligne"; Rec."No. ligne")
                {
                    ToolTip = 'Numéro de la ligne d''embarquement.';
                }
                field("Date embarquement"; Rec."Date embarquement")
                {
                    ToolTip = 'Date à laquelle l''embarquement a été effectué pour cette ligne.';
                }
                field("No. commande achat"; Rec."No. commande achat")
                {
                    ToolTip = 'Numéro de la commande d''achat liée à cette ligne d''embarquement.';
                }
                field("No. ligne commande achat"; Rec."No. ligne commande achat")
                {
                    ToolTip = 'Numéro de ligne de la commande d''achat correspondante.';
                }
                field("No. Article"; Rec."No. Article")
                {
                    ToolTip = 'Numéro de l''article embarqué pour cette ligne.';
                }
                field("Conditionnement produit"; Rec."Conditionnement produit")
                {
                    ToolTip = 'Détails sur le conditionnement du produit pour cette ligne.';
                }
                field("Désignation"; Rec."Désignation")
                {
                    ToolTip = 'Désignation de l''article lié à cette ligne.';
                }
                field("Code magasin"; Rec."Code magasin")
                {
                    ToolTip = 'Code du magasin où l''article est stocké.';
                }
                field("Quantité"; Rec."Quantité")
                {
                    ToolTip = 'Quantité d''articles embarqués pour cette ligne.';
                }
                field("Quantité par unité"; Rec."Quantité par unité")
                {
                    ToolTip = 'Nombre d''articles par unité de conditionnement.';
                }
                field("Quantité (Pièce)"; Rec."Quantité (Pièce)")
                {
                    ToolTip = 'Quantité d''articles en pièces pour cette ligne.';
                }
                field("Référence fournisseur"; Rec."Référence fournisseur")
                {
                    ToolTip = 'Référence fournisseur pour cette ligne d''embarquement.';
                }
                field("Date réception prévue"; Rec."Date réception prévue")
                {
                    ToolTip = 'Date prévue de réception pour cet embarquement.';
                }
                field("Qté Embarquée"; Rec."Qté Embarquée")
                {
                    ToolTip = 'Quantité d''articles déjà embarquée pour cette ligne.';
                }
                field("Qté embarquée (Pièce)"; Rec."Qté embarquée (Pièce)")
                {
                    ToolTip = 'Quantité d''articles déjà embarquée en pièces.';
                }
                field("Filtre Embarquement"; Rec."Filtre Embarquement")
                {
                    ToolTip = 'Filtre pour le numéro d''embarquement.';
                }
                field("Qté en commande"; Rec."Qté en commande")
                {
                    ToolTip = 'Quantité totale en commande pour cet article.';
                }
                field("Qté en commande (Pièce)"; Rec."Qté en commande (Pièce)")
                {
                    ToolTip = 'Quantité totale en commande en pièces pour cet article.';
                }
                field("Filtre No. ligne"; Rec."Filtre No. ligne")
                {
                    ToolTip = 'Filtre pour le numéro de ligne associé.';
                }
                field("Quantité réservée (Pièce)"; Rec."Quantité réservée (Pièce)")
                {
                    ToolTip = 'Quantité d''articles réservée en pièces pour cette ligne.';
                }
                field("Code casier"; Rec."Code casier")
                {
                    ToolTip = 'Code du casier où l''article est stocké.';
                }
                field("Livraison directe"; Rec."Livraison directe")
                {
                    ToolTip = 'Indique si l''article est en livraison directe.';
                }
                field("No. projet"; Rec."No. projet")
                {
                    ToolTip = 'Numéro de projet associé à cette ligne d''embarquement.';
                }
                field("No. de série"; Rec."No. de série")
                {
                    ToolTip = 'Numéro de série de l''article pour cette ligne.';
                }
                field("No. lot"; Rec."No. lot")
                {
                    ToolTip = 'Numéro de lot de l''article pour cette ligne.';
                }
                field("Qté à réserv non sur achat"; Rec."Qté à réserv non sur achat")
                {
                    ToolTip = 'Quantité à réserver non liée à une commande d''achat.';
                }
                field("Quantité à réservée (Pièce)"; Rec."Quantité à réservée (Pièce)")
                {
                    ToolTip = 'Quantité à réserver en pièces pour cette ligne.';
                }
                field("Quantité réservée"; Rec."Quantité réservée")
                {
                    ToolTip = 'Quantité d''articles déjà réservée pour cette ligne.';
                }
                field("Quantité à réservée"; Rec."Quantité à réservée")
                {
                    ToolTip = 'Quantité d''articles à réserver pour cette ligne.';
                }
                field("No. conteneur"; Rec."No. conteneur")
                {
                    ToolTip = 'Numéro de conteneur associé à cette ligne d''embarquement.';
                }
            }
        }
    }

    actions
    {
        // Ajoutez des actions ici si nécessaire
    }
}
