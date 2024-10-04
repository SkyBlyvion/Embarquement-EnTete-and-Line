pageextension 50291 "PurchaseOrderSubForm" extends "Purchase Order SubForm"
{
    layout
    {
        addbefore(Description)
        {
            field("Colisage"; Rec."Quantité/Conditionnement")
            {
                ApplicationArea = All;
                ToolTip = 'colisage de cette commande.';
            }
            field("Date d'embarquement prévue"; Rec."Date d'embarquement prévue")
            {
                ApplicationArea = All;
                ToolTip = 'Indiquez la date prévue pour l''embarquement des articles.';
            }
            field("Date de rangement"; Rec."Expected Receipt Date")
            {
                ApplicationArea = All;
                ToolTip = 'Indiquez la date à laquelle les articles seront disponibles à Perpignan.';
            }

        }
        addafter(Quantity)
        {
            // field("Quantité (pièce)"; Rec."Quantité (pièce)") // TODO: Trouver comment ajouter ce champ aussi
            // {
            //     ApplicationArea = All;
            //     ToolTip = 'Saisissez la quantité totale d''articles.';
            // }
        }
        addbefore("Qty. to Receive")
        {
            field("Tec"; Rec."Tec")
            {
                ApplicationArea = All;
                ToolTip = 'Saisissez le montant de la taxe d''élimination des déchets pour cet article.';
            }
            field("Taxe anti-dumping"; Rec."Taxe anti-dumping")
            {
                ApplicationArea = All;
                ToolTip = 'Saisissez le montant de la taxe anti-dumping applicable à cet article.';
            }
            field("Incoterm"; Rec."Incoterm")
            {
                ApplicationArea = All;
                ToolTip = 'Sélectionnez l''Incoterm applicable pour cette transaction.';
            }
            field("Qté embarquée"; Rec."Qté embarquée")
            {
                ApplicationArea = All;
                ToolTip = 'Indiquez la quantité d''articles débarqués.';
            }
            field("Qté à embarquer "; Rec."Qté à embarquer")
            {
                ApplicationArea = All;
                ToolTip = 'Saisissez la quantité d''articles débarqués, en déchets.';
            }
            // field("Quantité restante"; Rec."Quantité restante")
            // {
            //     ApplicationArea = All;
            //     ToolTip = 'Saisissez la quantité restante d''articles à embarquer.';
            // }
            field("Volume"; Rec."Volume")
            {
                ApplicationArea = All;
                ToolTip = 'Saisissez le volume total des articles.';
            }
            // field("Montant ligne HT"; Rec."Montant ligne HT")
            // {
            //     ApplicationArea = All;
            //     ToolTip = 'Saisissez le montant HT de la ligne de commande.';
            // }
        }

    }

    actions
    {
        // Add changes to page actions here
    }


}