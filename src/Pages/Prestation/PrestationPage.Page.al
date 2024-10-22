page 50268 "PrestationPage"
{
    ApplicationArea = All;
    Caption = 'Prestation';
    PageType = List;
    SourceTable = "Prestation";
    Editable = true;

    CardPageID = "PrestationDossierArrivagePage";

    layout
    {
        area(Content)
        {
            repeater(Group)
            {
                field("No."; Rec."No.")
                {
                    ToolTip = 'Indique le numéro de la prestation.';
                }
                field("Prévisionnel"; Rec."Prévisionnel")
                {
                    ToolTip = 'Indique si cette prestation est prévisionnelle ou non.';
                }
                field("No. document"; Rec."No. document")
                {
                    ToolTip = 'Indique le numéro de document associé à la prestation.';
                }
                field("Date"; Rec."Date")
                {
                    ToolTip = 'Spécifie la date de la prestation.';
                }
                field("Type"; Rec."Type")
                {
                    ToolTip = 'Indique le type de prestation, par exemple, Frais de transport ou Douane.';
                }
                field("Montant"; Rec."Montant")
                {
                    ToolTip = 'Spécifie le montant de la prestation.';
                }
                field("Code devise"; Rec."Code devise")
                {
                    ToolTip = 'Indique le code de la devise utilisée pour la prestation.';
                }
                field("Imputé"; Rec."Imputé")
                {
                    ToolTip = 'Indique si la prestation a été imputée ou non.';
                }
                field("Mnt affecté total (doss)"; Rec."Mnt affecté total (doss)")
                {
                    ToolTip = 'Montant total affecté pour ce dossier de prestation.';
                }
            }
        }
    }
}
