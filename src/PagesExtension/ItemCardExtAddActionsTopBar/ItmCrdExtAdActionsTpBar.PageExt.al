pageextension 50263 ItmCrdExtAdActionsTpBar extends "Item Card"
{
    actions
    {
        addafter(Resources)
        {
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
                    action("Avis Ligne Dossier")
                    {
                        ApplicationArea = All;
                        Caption = 'Avis Ligne Dossier';
                        ToolTip = 'Voir l''avis de la ligne de dossier pour cet article.';
                        Image = History;

                        trigger OnAction()
                        begin
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
                        begin
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
                        begin
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
                        begin
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
                        begin
                            Page.Run(PAGE::PrestationDossierArrivagePage);
                        end;
                    }
                }
                group("Embarquement")
                {
                    Caption = 'Embarquement';
                    action("EnTete Embarquement")
                    {
                        ApplicationArea = All;
                        Caption = 'Embarquement';
                        ToolTip = 'Voir l''embarquement pour cet article.';
                        Image = History;

                        trigger OnAction()
                        begin
                            Page.Run(PAGE::EnTeteEmbarquemen);
                        end;
                    }
                    action("Ligne Embarquement")
                    {
                        ApplicationArea = All;
                        Caption = 'LigneEmbarquement';
                        ToolTip = 'Voir l''embarquement de la ligne de dossier pour cet article.';
                        Image = History;

                        trigger OnAction()
                        begin
                            Page.Run(PAGE::LigneEmbarquemen);
                        end;
                    }
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
                    action("Dossier Arrivage")
                    {
                        ApplicationArea = All;
                        Caption = 'Dossier Arrivage';
                        ToolTip = 'Voir le dossier d''arrivage pour cet article.';
                        Image = History;

                        trigger OnAction()
                        begin
                            Page.Run(PAGE::DossierArrivagePage);
                        end;
                    }
                    action("Ligne Dossier Arrivage")
                    {
                        ApplicationArea = All;
                        Caption = 'Ligne Dossier Arrivage';
                        ToolTip = 'Voir la ligne de dossier d''arrivage pour cet article.';
                        Image = History;

                        trigger OnAction()
                        begin
                            Page.Run(PAGE::LigneDossierArrivagePage);
                        end;
                    }
                }
                group("Credoc")
                {
                    action("Credit Documentaire")
                    {
                        ApplicationArea = All;
                        Caption = 'Credoc';
                        ToolTip = 'Voir le Credoc pour cet article.';
                        Image = History;

                        trigger OnAction()
                        begin
                            Page.Run(PAGE::CredocPage);
                        end;
                    }
                }
                action("Frais Annexes Achat")
                {
                    ApplicationArea = All;
                    Caption = 'Frais Annexes Achat';
                    ToolTip = 'Voir les frais annexes d''achat pour cet article.';
                    Image = History;

                    trigger OnAction()
                    begin
                        Page.Run(PAGE::FraisAnnexesAchatPage);
                    end;
                }
            }
        }
    }
}