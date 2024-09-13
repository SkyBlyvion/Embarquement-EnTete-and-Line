pageextension 50243 "PurchaseLinePageExt" extends "Purchase Lines" // Lines avec S est la page
{
    layout
    {
        addafter("Outstanding Quantity")
        {
            field("No. dossier"; Rec."No. dossier")
            {
                ApplicationArea = All;
                ToolTip = 'Entrez le numéro de dossier associé à cette ligne de commande.';
            }
            field("Date d'embarquement prévue"; Rec."Date d'embarquement prévue")
            {
                ApplicationArea = All;
                ToolTip = 'Indiquez la date prévue pour l''embarquement des articles.';
            }
            field("Coût unitaire (Pièce)"; Rec."Coût unitaire (Pièce)")
            {
                ApplicationArea = All;
                ToolTip = 'Saisissez le coût unitaire de l''article, en tenant compte du coût par pièce.';
            }
            field("Date de relance"; Rec."Date de relance")
            {
                ApplicationArea = All;
                ToolTip = 'Définissez la date de relance pour cette ligne de commande.';
            }
            field("Qté à embarquer"; Rec."Qté à embarquer")
            {
                ApplicationArea = All;
                ToolTip = 'Indiquez la quantité totale d''articles à embarquer.';
            }
            field("Qté à embarquer (Pièce)"; Rec."Qté à embarquer (Pièce)")
            {
                ApplicationArea = All;
                ToolTip = 'Saisissez la quantité d''articles à embarquer, en pièces.';
            }
            field("Qté embarquée"; Rec."Qté embarquée")
            {
                ApplicationArea = All;
                ToolTip = 'Indiquez la quantité d''articles déjà embarqués.';
            }
            field("Qté embarquée (Pièce)"; Rec."Qté embarquée (Pièce)")
            {
                ApplicationArea = All;
                ToolTip = 'Saisissez la quantité d''articles déjà embarqués, en pièces.';
            }
            field("Volume (unitaire)"; Rec."Volume (unitaire)")
            {
                ApplicationArea = All;
                ToolTip = 'Entrez le volume unitaire des articles.';
            }
            field("Volume"; Rec."Volume")
            {
                ApplicationArea = All;
                ToolTip = 'Saisissez le volume total des articles.';
            }
            field("Poids (unitaire)"; Rec."Poids (unitaire)")
            {
                ApplicationArea = All;
                ToolTip = 'Indiquez le poids unitaire des articles.';
            }
            field("Poids"; Rec."Poids")
            {
                ApplicationArea = All;
                ToolTip = 'Saisissez le poids total des articles.';
            }
            field("TEC"; Rec."TEC")
            {
                ApplicationArea = All;
                ToolTip = 'Saisissez le montant de la taxe d''élimination des déchets pour cet article.';
            }
            field("Incoterm"; Rec."Incoterm")
            {
                ApplicationArea = All;
                ToolTip = 'Sélectionnez l''Incoterm applicable pour cette transaction.';
            }
            field("Quantité/Conditionnement"; Rec."Quantité/Conditionnement")
            {
                ApplicationArea = All;
                ToolTip = 'Indiquez la quantité par conditionnement pour cette ligne de commande.';
            }
            field("No. conteneur"; Rec."No. conteneur")
            {
                ApplicationArea = All;
                ToolTip = 'Entrez le numéro du conteneur utilisé pour l''expédition des articles.';
            }
            field("Taxe anti-dumping"; Rec."Taxe anti-dumping")
            {
                ApplicationArea = All;
                ToolTip = 'Saisissez le montant de la taxe anti-dumping applicable à cet article.';
            }
        }
    }
}
