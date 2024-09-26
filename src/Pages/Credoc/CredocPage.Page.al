page 50273 CredocPage
{
    ApplicationArea = All;
    Caption = 'Credoc';
    PageType = List;
    SourceTable = Credoc;
    Editable = true;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Code"; Rec."Code")
                {
                    ToolTip = 'Le code unique associé à ce crédoc.';
                }
                field("Code Banque"; Rec."Code Banque")
                {
                    ToolTip = 'Le code de la banque qui gère ce crédoc.';
                }
                field("Date ouverture"; Rec."Date ouverture")
                {
                    ToolTip = 'La date d''ouverture de ce crédoc.';
                }
                field("Date validité"; Rec."Date validité")
                {
                    ToolTip = 'La date de validité du crédoc.';
                }
                field("Référence proforma"; Rec."Référence proforma")
                {
                    ToolTip = 'La référence proforma associée à ce crédoc.';
                }
                field("Code devise"; Rec."Code devise")
                {
                    ToolTip = 'Le code de la devise utilisée pour ce crédoc.';
                }
                field("Facteur devise"; Rec."Facteur devise")
                {
                    ToolTip = 'Le facteur de conversion pour la devise associée à ce crédoc.';
                }
                field("Montant initial"; Rec."Montant initial")
                {
                    ToolTip = 'Le montant initial du crédoc.';
                }
                field("Montant utilisé"; Rec."Montant utilisé")
                {
                    ToolTip = 'Le montant utilisé du crédoc.';
                }
                field("Cloturé"; Rec."Cloturé")
                {
                    ToolTip = 'Indique si le crédoc est clôturé.';
                }
            }
        }
    }
}
