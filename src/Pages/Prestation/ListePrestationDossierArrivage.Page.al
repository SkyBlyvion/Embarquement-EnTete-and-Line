page 50295 ListePrestationDossierArrivage
{
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Lists;
    SourceTable = "PrestationDossierArrivage";

    layout
    {
        area(Content)
        {
            repeater(Général)
            {
                field("No. prestation"; Rec."No. prestation")
                {
                    ToolTip = 'Indique le numéro de la prestation.';
                }
                field("Type"; Rec."Type")
                {
                    ToolTip = 'Indique le type de la prestation.';
                }
                field("Montant affecté"; Rec."Montant affecté")
                {
                    ToolTip = 'Indique le montant affecté à la prestation.';
                }
                field("Code devise"; Rec."Code devise")
                {
                    ToolTip = 'Indique le code de la devise.';
                }
                field("Mnt affecté total lig affect"; Rec."Mnt affecté total lig affect")
                {
                    ToolTip = 'Indique le montant total affecté à la ligne de la prestation.';
                }
                field("Mnt total lignes affectées"; Rec."Mnt total lignes affectées")
                {
                    ToolTip = 'Indique le montant total affecté à toutes les lignes de la prestation.';
                }
                field("Affectation partielle"; Rec."Affectation partielle")
                {
                    ToolTip = 'Sélectionnez si la prestation est affecté partiellement.';
                }
            }
        }
        area(Factboxes)
        {

        }
    }

    actions
    {
        area(Processing)
        {
            action(ActionName)
            {

                trigger OnAction()
                begin

                end;
            }
        }
    }
}