page 50274 FraisAnnexesAchatPage
{
    ApplicationArea = All;
    Caption = 'Frais Annexes Achat';
    PageType = List;
    SourceTable = "FraisAnnexesAchat";
    Editable = true;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Document No."; Rec."Document No.")
                {
                    ToolTip = 'Le numéro de document associé à ce frais annexe d''achat.';
                }
                field("Item No."; Rec."Item No.")
                {
                    ToolTip = 'Le numéro de l''article auquel ce frais annexe est lié.';
                }
                field("Line No."; Rec."Line No.")
                {
                    ToolTip = 'Le numéro de ligne pour identifier cette ligne spécifique.';
                }
                field("Description"; Rec."Description")
                {
                    ToolTip = 'Une brève description du frais annexe d''achat.';
                }
                field("Amount"; Rec."Amount")
                {
                    ToolTip = 'Le montant total du frais annexe.';
                }
                field("Quantity (pcs)"; Rec."Quantity (pcs)")
                {
                    ToolTip = 'La quantité en pièces pour ce frais annexe.';
                }
            }
        }
    }
}
