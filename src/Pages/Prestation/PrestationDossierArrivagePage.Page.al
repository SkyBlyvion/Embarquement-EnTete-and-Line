page 50270 "PrestationDossierArrivagePage"
{
    ApplicationArea = All;
    Caption = 'Prestation Dossier Arrivage';
    PageType = List;
    SourceTable = "PrestationDossierArrivage";
    Editable = true;

    layout
    {
        area(Content)
        {
            repeater(Group)
            {
                field("No. Dossier"; Rec."No. Dossier")
                {
                    ToolTip = 'Le numéro du dossier associé à cette prestation.';
                }
                field("No. prestation"; Rec."No. prestation")
                {
                    ToolTip = 'Le numéro de la prestation associée au dossier.';
                }
                field("Type"; Rec."Type")
                {
                    ToolTip = 'Le type de prestation, comme les frais de transport ou la douane.';
                }
                field("Montant affecté"; Rec."Montant affecté")
                {
                    ToolTip = 'Le montant affecté à cette prestation.';
                }
                field("Prévisionnel"; Rec."Prévisionnel")
                {
                    ToolTip = 'Indique si la prestation est prévisionnelle ou non.';
                }
                field("Mnt total lignes affectées"; Rec."Mnt total lignes affectées")
                {
                    ToolTip = 'Le montant total des lignes affectées pour cette prestation.';
                }
                field("Affectation partielle"; Rec."Affectation partielle")
                {
                    ToolTip = 'Indique si l''affectation est partielle.';
                }
                field("Mnt affecté total lig affect"; Rec."Mnt affecté total lig affect")
                {
                    ToolTip = 'Le montant total affecté pour les lignes associées.';
                }
                field("Vol total lignes affect"; Rec."Vol total lignes affect")
                {
                    ToolTip = 'Le volume total des lignes affectées à cette prestation.';
                }
                field("Code devise"; Rec."Code devise")
                {
                    ToolTip = 'Le code devise utilisé pour cette prestation.';
                }
            }
        }
    }
}
