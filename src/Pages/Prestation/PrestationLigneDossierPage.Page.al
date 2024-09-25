page 50269 "PrestationLigneDossierPage"
{
    ApplicationArea = All;
    Caption = 'Prestation Ligne Dossier';
    PageType = List;
    SourceTable = "PrestationLigneDossier";
    Editable = true;

    layout
    {
        area(Content)
        {
            repeater(Group)
            {
                field("No. prestation"; Rec."No. prestation")
                {
                    ToolTip = 'Numéro de la prestation associée à cette ligne de dossier.';
                }
                field("No. dossier"; Rec."No. dossier")
                {
                    ToolTip = 'Numéro du dossier auquel la ligne de prestation est liée.';
                }
                field("No. ligne dossier"; Rec."No. ligne dossier")
                {
                    ToolTip = 'Numéro de la ligne dans le dossier.';
                }
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
                    ToolTip = 'Type de prestation, par exemple, transport ou douane.';
                }
                field("Prévisionnel"; Rec."Prévisionnel")
                {
                    ToolTip = 'Indique si cette ligne est prévisionnelle ou non.';
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
                field("Code devise"; Rec."Code devise")
                {
                    ToolTip = 'Code devise utilisé pour cette ligne de dossier.';
                }
            }
        }
    }
}
