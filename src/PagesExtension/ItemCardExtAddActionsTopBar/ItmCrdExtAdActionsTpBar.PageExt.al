pageextension 50263 ItmCrdExtAdActionsTpBar extends "Item Card"
{
    actions
    {
        addlast(Resources)
        {
            // TODO: Filtre pour chaque action ouverture de page afin de charger seulement la ou les lignes correspondantes.
            group("Gestion et Suivi des Opérations")
            {
                Caption = 'Gestion et Suivi des Opérations';
                group("Avis")
                {
                    Caption = 'Avis';
                    action("Les Avis")
                    {
                        ApplicationArea = All;
                        Caption = 'Les Avis';
                        ToolTip = 'Voir l''avis pour cet article.';
                        Image = History;

                        trigger OnAction()
                        begin
                            Page.Run(PAGE::AvisPage);
                        end;
                    }
                }
                group("Prestation")
                {
                    Caption = 'Prestation';
                }
                group("Embarquement")
                {
                    Caption = 'Embarquement';
                }
                group("Historique PRT & PRR")
                {
                    action("Historique PRT")
                    {
                        ApplicationArea = All;
                        Caption = 'Historique PRT';
                        ToolTip = 'Voir l''historique du prix de revient théorique pour cet article.';
                        Image = History;

                        // Promoted = true;
                        // PromotedCategory = Category6; // You can choose between Process, Home, New, etc.
                        // PromotedIsBig = true;
                        // PromotedOnly = false; // Shows in both Actions bar and Promoted toolbar if true.

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

                        // Promoted = true;
                        // PromotedCategory = Category6; // You can choose between Process, Home, New, etc.
                        // PromotedIsBig = true;
                        // PromotedOnly = false; // Shows in both Actions bar and Promoted toolbar if true.

                        trigger OnAction()
                        begin
                            Page.Run(PAGE::HistoriquePRRPage);
                        end;
                    }
                }
                group("Arrivage")
                {
                }
                group("Credoc")
                {
                }
            }
        }
    }
}