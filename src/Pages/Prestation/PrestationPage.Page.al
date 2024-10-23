page 50268 "PrestationPage"
{
    ApplicationArea = All;
    Caption = 'Prestation';
    PageType = List;
    SourceTable = "Prestation";
    Editable = true;

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
                    trigger OnAssistEdit()
                    var
                        ModifierTauxChange: Page "Change Exchange Rate";
                    begin

                        ModifierTauxChange.SetParameter(Rec."Code devise", Rec."Facteur devise", WORKDATE());
                        IF ModifierTauxChange.RUNMODAL() = ACTION::OK THEN
                            Rec.VALIDATE(Rec."Facteur devise", ModifierTauxChange.GetParameter());

                        CLEAR(ModifierTauxChange);
                    end;
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
    /*
        RunPageOnRec = false;
        Default = true
        If not specified, the page will run on the current record by default (drill-down behavior). 
        If you want to run the page for a filtered set of records rather than just the current one, you must set it to false 
    */
    actions
    {
        area(Processing)
        {
            action("Dossiers d'arrivages")
            {
                Caption = 'Affecter Partiellement';
                ToolTip = 'Affecte une quantité partiellement de la quantité totale de la prestation.';
                RunObject = Page "PrestationDossierArrivagePage";
                RunPageLink = "No. prestation" = field("No.");
                RunPageOnRec = false; // turn on to activate DrillDown

                // trigger OnAction()
                // begin
                //     Page.Run(Page::PrestationDossierArrivagePage);
                // end;
            }
        }
    }
}