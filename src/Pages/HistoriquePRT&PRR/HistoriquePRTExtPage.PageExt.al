pageextension 50261 "HistoriquePRTExtPage" extends "Item List"
{
    actions
    {
        addlast(PricesAndDiscounts)
        {
            action("Historique PRT")
            {
                ApplicationArea = All;
                Caption = 'Historique PRT';
                ToolTip = 'Voir l''historique du prix de revient théorique pour cet article.';
                Image = History;

                Promoted = true;
                PromotedCategory = Category6; // You can choose between Process, Home, New, etc.
                PromotedIsBig = true;
                PromotedOnly = false; // Shows in both Actions bar and Promoted toolbar if true.

                trigger OnAction()
                begin
                    Page.Run(PAGE::HistoriquePRTPage);
                end;
            }
            action("Historique PRR")
            {
                ApplicationArea = All;
                Caption = 'Historique PRR';
                ToolTip = 'Voir l''historique du prix de revient réel pour cet article.';
                Image = History;

                Promoted = true;
                PromotedCategory = Category6; // You can choose between Process, Home, New, etc.
                PromotedIsBig = true;
                PromotedOnly = false; // Shows in both Actions bar and Promoted toolbar if true.

                trigger OnAction()
                begin
                    Page.Run(PAGE::HistoriquePRRPage);
                end;
            }
        }
    }
}
