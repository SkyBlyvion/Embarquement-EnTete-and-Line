page 50266 "AvisLigneDossierPage"
{
    ApplicationArea = All;
    Caption = 'Avis Ligne Dossier';
    PageType = List;
    SourceTable = "AvisLigneDossier";
    Editable = true;

    layout
    {
        area(Content)
        {
            repeater(Group)
            {
                field("Code credoc"; Rec."Code credoc")
                {
                    ToolTip = 'Spécifie le code credoc associé à cette ligne de dossier.';
                }
                field("No. ligne avis"; Rec."No. ligne avis")
                {
                    ToolTip = 'Indique le numéro de ligne associé à cet avis.';
                }
                field("No. dossier"; Rec."No. dossier")
                {
                    ToolTip = 'Spécifie le numéro du dossier associé à cette ligne.';
                }
                field("No. ligne dossier"; Rec."No. ligne dossier")
                {
                    ToolTip = 'Indique le numéro de ligne du dossier associé.';
                }
                field("Affectation"; Rec."Affectation")
                {
                    ToolTip = 'Indique si cette ligne est affectée ou non.';
                }
                field("Montant affecté"; Rec."Montant affecté")
                {
                    ToolTip = 'Montant qui a été affecté à cette ligne.';
                }
                field("Type"; Rec."Type")
                {
                    ToolTip = 'Type de l''avis, par exemple, Marchandise, Financier, etc.';
                }
                field("Prévisionnel"; Rec."Prévisionnel")
                {
                    ToolTip = 'Indique si cette ligne est prévisionnelle ou non.';
                }
                field("Désignation"; Rec."Désignation")
                {
                    ToolTip = 'La désignation de la ligne de dossier.';
                }
                field("Cout unitaire"; Rec."Cout unitaire")
                {
                    ToolTip = 'Le coût unitaire de cette ligne.';
                }
                field("Quantité (pièce)"; Rec."Quantité (pièce)")
                {
                    ToolTip = 'Quantité en pièces de cette ligne.';
                }
                field("Montant ligne (dev soc)"; Rec."Montant ligne (dev soc)")
                {
                    ToolTip = 'Montant de la ligne dans la devise de la société.';
                }
                field("Volume ligne"; Rec."Volume ligne")
                {
                    ToolTip = 'Le volume de la ligne.';
                }
                field("No. article"; Rec."No. article")
                {
                    ToolTip = 'Numéro de l''article associé à cette ligne.';
                }
                field("No. réception"; Rec."No. réception")
                {
                    ToolTip = 'Numéro de réception associé à cette ligne.';
                }
                field("Code devise"; Rec."Code devise")
                {
                    ToolTip = 'Le code de devise utilisé pour cette ligne.';
                }
            }
        }
    }

    actions
    {
        // You can add actions here if needed
    }
}
