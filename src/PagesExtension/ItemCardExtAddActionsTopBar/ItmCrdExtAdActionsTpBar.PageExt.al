pageextension 50263 ItmCrdExtAdActionsTpBar extends "Item Card"
{
    actions
    {
        addlast(History)
        {
            action("Historique PRT")
            {
                ApplicationArea = All;
                Caption = 'Historique PRT';
                ToolTip = 'Voir l''historique du prix de revient théorique pour cet article.';
                Image = PaymentHistory;

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
                Image = PaymentHistory;

                trigger OnAction()
                begin
                    Page.Run(PAGE::HistoriquePRRPage);
                end;
            }
        }
    }
}