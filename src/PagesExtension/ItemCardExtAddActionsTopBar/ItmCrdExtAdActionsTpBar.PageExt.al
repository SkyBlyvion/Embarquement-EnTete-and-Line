pageextension 50263 ItmCrdExtAdActionsTpBar extends "Item Card"
{
    actions
    {
        addlast(Resources)
        {
            // TODO: Filtre pour chaque action 
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
                        var
                            AvisPage: Page AvisPage;
                        begin
                            AvisPage.SetTableView(Rec);
                            Page.Run(PAGE::AvisPage);
                        end;
                    }
                    action("Avis Ligne Dossier")
                    {
                        ApplicationArea = All;
                        Caption = 'Avis Ligne Dossier';
                        ToolTip = 'Voir l''avis de la ligne de dossier pour cet article.';
                        Image = History;

                        trigger OnAction()
                        var
                            AvisLigneDossierPage: Page AvisLigneDossierPage;
                        begin
                            AvisLigneDossierPage.SetTableView(Rec);
                            Page.Run(PAGE::AvisLigneDossierPage);
                        end;
                    }
                    action("Avis Dossier Arrivage")
                    {
                        ApplicationArea = All;
                        Caption = 'Avis Dossier Arrivage';
                        ToolTip = 'Voir l''avis du dossier d''arrivage pour cet article.';
                        Image = History;

                        trigger OnAction()
                        var
                            AvisDossierArrivagePage: Page AvisDossierArrivagePage;
                        begin
                            AvisDossierArrivagePage.SetTableView(Rec);
                            Page.Run(PAGE::AvisDossierArrivagePage);
                        end;
                    }
                }
                group("Prestations")
                {
                    Caption = 'Prestation';
                    action("Prestation")
                    {
                        ApplicationArea = All;
                        Caption = 'Prestation';
                        ToolTip = 'Voir la prestation pour cet article.';
                        Image = History;

                        trigger OnAction()
                        var
                            PrestationPage: Page PrestationPage;
                        begin
                            PrestationPage.SetTableView(Rec);
                            Page.Run(PAGE::PrestationPage);
                        end;
                    }
                    action("Prestation Ligne Dossier")
                    {
                        ApplicationArea = All;
                        Caption = 'Prestation Ligne Dossier';
                        ToolTip = 'Voir la prestation de la ligne de dossier pour cet article.';
                        Image = History;

                        trigger OnAction()
                        var
                            PrestationLigneDossierPage: Page PrestationLigneDossierPage;
                        begin
                            PrestationLigneDossierPage.SetTableView(Rec);
                            Page.Run(PAGE::PrestationLigneDossierPage);
                        end;
                    }
                    action("Prestation Dossier Arrivage")
                    {
                        ApplicationArea = All;
                        Caption = 'Prestation Dossier Arrivage';
                        ToolTip = 'Voir la prestation du dossier d''arrivage pour cet article.';
                        Image = History;

                        trigger OnAction()
                        var
                            PrestationDossierArrivagePage: Page PrestationDossierArrivagePage;
                        begin
                            PrestationDossierArrivagePage.SetTableView(Rec);
                            Page.Run(PAGE::PrestationDossierArrivagePage);
                        end;
                    }
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