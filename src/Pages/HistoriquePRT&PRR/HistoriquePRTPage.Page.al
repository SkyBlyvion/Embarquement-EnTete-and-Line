page 50245 "HistoriquePRTPage"
{
    PageType = List;
    ApplicationArea = All;
    SourceTable = "HistoriquePRTTable";
    Editable = true;
    Caption = 'Historique PRT';

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("No. calcul"; Rec."No. calcul")
                {
                    ApplicationArea = All;
                    ToolTip = 'Numéro de calcul associé à l''historique.';
                }
                field("No. article"; Rec."No. article")
                {
                    ApplicationArea = All;
                    ToolTip = 'Numéro d''article associé à l''historique.';
                }
                field("Date"; Rec."Date")
                {
                    ApplicationArea = All;
                    ToolTip = 'Date du calcul.';
                }
                field("Heure"; Rec."Heure")
                {
                    ApplicationArea = All;
                    ToolTip = 'Heure du calcul.';
                }
                field("No. commande"; Rec."No. commande")
                {
                    ApplicationArea = All;
                    ToolTip = 'Numéro de commande lié à cet historique.';
                }
                field("Date achat"; Rec."Date achat")
                {
                    ApplicationArea = All;
                    ToolTip = 'Date d''achat associée à la commande.';
                }
                field("Code devise cde"; Rec."Code devise cde")
                {
                    ApplicationArea = All;
                    ToolTip = 'Code de la devise utilisée pour la commande.';
                }
                field("Facteur devise cde"; Rec."Facteur devise cde")
                {
                    ApplicationArea = All;
                    ToolTip = 'Facteur de conversion de la devise de la commande.';
                }
                field("Incoterm"; Rec."Incoterm")
                {
                    ApplicationArea = All;
                    ToolTip = 'Incoterm utilisé dans la commande.';
                }
                field("No. fournisseur"; Rec."No. fournisseur")
                {
                    ApplicationArea = All;
                    ToolTip = 'Numéro de fournisseur associé à la commande.';
                }
                field("Code transport routier"; Rec."Code transport routier")
                {
                    ApplicationArea = All;
                    ToolTip = 'Code du transport routier associé.';
                }
                field("Montant transport routier"; Rec."Montant transport routier")
                {
                    ApplicationArea = All;
                    ToolTip = 'Montant du transport routier.';
                }
                field("Code devise transp. rout."; Rec."Code devise transp. rout.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Code de la devise pour le transport routier.';
                }
                field("Facteur devise transp. rout."; Rec."Facteur devise transp. rout.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Facteur de conversion pour la devise du transport routier.';
                }
                field("Code transport maritime"; Rec."Code transport maritime")
                {
                    ApplicationArea = All;
                    ToolTip = 'Code du transport maritime associé.';
                }
                field("Montant transport maritime"; Rec."Montant transport maritime")
                {
                    ApplicationArea = All;
                    ToolTip = 'Montant du transport maritime.';
                }
                field("Code devise transp. marit."; Rec."Code devise transp. marit.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Code de la devise pour le transport maritime.';
                }
                field("Facteur devise transp. marit."; Rec."Facteur devise transp. marit.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Facteur de conversion pour la devise du transport maritime.';
                }
                field("% frais financiers"; Rec."% frais financiers")
                {
                    ApplicationArea = All;
                    ToolTip = 'Pourcentage des frais financiers appliqués.';
                }
                field("% assurances"; Rec."% assurances")
                {
                    ApplicationArea = All;
                    ToolTip = 'Pourcentage des assurances appliquées.';
                }
                field("% commissions"; Rec."% commissions")
                {
                    ApplicationArea = All;
                    ToolTip = 'Pourcentage des commissions appliquées.';
                }
                field("% transit"; Rec."% transit")
                {
                    ApplicationArea = All;
                    ToolTip = 'Pourcentage des frais de transit appliqués.';
                }
                field("Volume commande"; Rec."Volume commande")
                {
                    ApplicationArea = All;
                    ToolTip = 'Volume de la commande passée.';
                }
                field("No. ligne"; Rec."No. ligne")
                {
                    ApplicationArea = All;
                    ToolTip = 'Numéro de ligne de la commande.';
                }
                field("Quantité achetée"; Rec."Quantité achetée")
                {
                    ApplicationArea = All;
                    ToolTip = 'Quantité d''articles achetés.';
                }
                field("Prix achat (dev soc)"; Rec."Prix achat (dev soc)")
                {
                    ApplicationArea = All;
                    ToolTip = 'Prix d''achat dans la devise de la société.';
                }
                field("Montant ligne achat"; Rec."Montant ligne achat")
                {
                    ApplicationArea = All;
                    ToolTip = 'Montant total de la ligne d''achat.';
                }
                field("Volume"; Rec."Volume")
                {
                    ApplicationArea = All;
                    ToolTip = 'Volume associé à cette ligne d''achat.';
                }
                field("Coût transport rout. (dev soc)"; Rec."Coût transport rout. (dev soc)")
                {
                    ApplicationArea = All;
                    ToolTip = 'Coût du transport routier dans la devise de la société.';
                }
                field("Montant frais fin. (dev soc)"; Rec."Montant frais fin. (dev soc)")
                {
                    ApplicationArea = All;
                    ToolTip = 'Montant des frais financiers dans la devise de la société.';
                }
                field("Montant assurances (dev soc)"; Rec."Montant assurances (dev soc)")
                {
                    ApplicationArea = All;
                    ToolTip = 'Montant des assurances dans la devise de la société.';
                }
                field("Montant commissions (dev soc)"; Rec."Montant commissions (dev soc)")
                {
                    ApplicationArea = All;
                    ToolTip = 'Montant des commissions dans la devise de la société.';
                }
                field("Montant transit (dev soc)"; Rec."Montant transit (dev soc)")
                {
                    ApplicationArea = All;
                    ToolTip = 'Montant des frais de transit dans la devise de la société.';
                }
                field("Montant frais douane (dev soc)"; Rec."Montant frais douane (dev soc)")
                {
                    ApplicationArea = All;
                    ToolTip = 'Montant des frais de douane dans la devise de la société.';
                }
                field("CU net douane (dev soc)"; Rec."CU net douane (dev soc)")
                {
                    ApplicationArea = All;
                    ToolTip = 'Coût unitaire net après frais de douane dans la devise de la société.';
                }
                field("% droit douane"; Rec."% droit douane")
                {
                    ApplicationArea = All;
                    ToolTip = 'Pourcentage du droit de douane appliqué.';
                }
                field("Coût transport marit. (devsoc)"; Rec."Coût transport marit. (devsoc)")
                {
                    ApplicationArea = All;
                    ToolTip = 'Coût du transport maritime dans la devise de la société.';
                }
                field("% remise ligne"; Rec."% remise ligne")
                {
                    ApplicationArea = All;
                    ToolTip = 'Pourcentage de remise appliqué à la ligne.';
                }
                field("Frais annexes (dev soc)"; Rec."Frais annexes (dev soc)")
                {
                    ApplicationArea = All;
                    ToolTip = 'Frais annexes dans la devise de la société.';
                }
                field("PRT"; Rec."PRT")
                {
                    ApplicationArea = All;
                    ToolTip = 'Prix de revient théorique de l''article.';
                }
                field("Coût unitaire direct"; Rec."Coût unitaire direct")
                {
                    ApplicationArea = All;
                    ToolTip = 'Coût unitaire direct de l''article.';
                }
                field("Montant taxe anti-dumping"; Rec."Montant taxe anti-dumping")
                {
                    ApplicationArea = All;
                    ToolTip = 'Montant de la taxe anti-dumping appliquée.';
                }
            }
        }
    }
}
