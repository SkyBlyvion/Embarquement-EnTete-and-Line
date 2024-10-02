page 50271 "DossierArrivagePage"
{
    ApplicationArea = All;
    Caption = 'Dossier Arrivage';
    PageType = List;
    SourceTable = "DossierArrivage";
    Editable = true;

    //TODO: Subform LigneDossierArrivage


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
                    ToolTip = 'Le numéro unique du fournisseur associé à ce dossier.';
                }
                field("Souches de No."; Rec."Souches de No.")
                {
                    ToolTip = 'La souche de numéro utilisée pour ce dossier.';
                }
                field("Frais de transport"; Rec."Frais de transport")
                {
                    ToolTip = 'Le montant des frais de transport affectés à ce dossier.';
                }
                field("Frais Financiers"; Rec."Frais Financiers")
                {
                    ToolTip = 'Le montant des frais financiers affectés à ce dossier.';
                }
                field("Assurances"; Rec."Assurances")
                {
                    ToolTip = 'Le montant des assurances affectées à ce dossier.';
                }
                field("Commissions"; Rec."Commissions")
                {
                    ToolTip = 'Le montant des commissions affectées à ce dossier.';
                }
                field("Transit"; Rec."Transit")
                {
                    ToolTip = 'Le montant des frais de transit affectés à ce dossier.';
                }
                field("Douane"; Rec."Douane")
                {
                    ToolTip = 'Le montant des frais de douane affectés à ce dossier.';
                }
                field("Nom Fournisseur"; Rec."Nom Fournisseur")
                {
                    ToolTip = 'Le nom du fournisseur associé à ce dossier.';
                }
                field("Etat"; Rec."Etat")
                {
                    ToolTip = 'L''état actuel du dossier, comme "En attente de facturation" ou "Clôturé".';
                }
                field("Mnt total lig doss (dev soc)"; Rec."Mnt total lig doss (dev soc)")
                {
                    ToolTip = 'Le montant total des lignes de dossier dans la devise de la société.';
                }
            }
        }
    }
}
