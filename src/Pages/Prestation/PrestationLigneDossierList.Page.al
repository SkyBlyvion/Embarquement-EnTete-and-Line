page 50296 "PrestationLigneDossierList"
{
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Lists;
    SourceTable = "PrestationLigneDossier";
    Caption = 'Prestation Ligne Dossier List';
    /* Anciennement "Liste prestations/lig. dossier"  */

    layout
    {
        area(Content)
        {
            repeater(Group)
            {
                field("Affectation"; Rec."Affectation")
                {
                    ToolTip = 'Indique si cette ligne de prestation est affectée ou non.';
                }
                field("Montant affecté"; Rec."Montant affecté")
                {
                    ToolTip = 'Montant affecté à cette ligne de dossier.';
                }
                field("Type"; Rec."Type")
                {
                    ToolTip = 'Type de la ligne de dossier.';
                }
                field("Prévisionnel"; Rec."Prévisionnel")
                {
                    ToolTip = 'Prévisionnel de la ligne de dossier.';
                }
                field("Désignation"; Rec."Désignation")
                {
                    ToolTip = 'Désignation de l''article lié à cette ligne de dossier.';
                }
                field("Cout unitaire"; Rec."Cout unitaire")
                {
                    ToolTip = 'Coût unitaire de l''article associé à cette ligne de dossier.';
                }
                field("Quantité (pièce)"; Rec."Quantité (pièce)")
                {
                    ToolTip = 'Quantité en pièces pour cette ligne de dossier.';
                }
                field("Montant ligne (dev soc)"; Rec."Montant ligne (dev soc)")
                {
                    ToolTip = 'Montant de la ligne dans la devise de la société.';
                }
                field("Volume ligne"; Rec."Volume ligne")
                {
                    ToolTip = 'Volume de la ligne de dossier.';
                }
                field("No. article"; Rec."No. article")
                {
                    ToolTip = 'Numéro de l''article associé à cette ligne de dossier.';
                }
                field("No. réception"; Rec."No. réception")
                {
                    ToolTip = 'Numéro de réception associé à cette ligne de dossier.';
                }
            }
        }
    }
}