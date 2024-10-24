page 50300 "DossierArrivageDoc"
{
    PageType = Document;
    SourceTable = "DossierArrivage";
    ApplicationArea = All;
    Caption = 'Dossier d''Arrivage';

    layout
    {
        area(content)
        {
            group(General)
            {
                Caption = 'Informations générales';
                field("No. Dossier"; Rec."No. Dossier")
                {
                    ToolTip = 'Le numéro unique associé à ce dossier d''arrivage.';
                }
                field("No. fournisseur"; Rec."No. fournisseur")
                {
                    ToolTip = 'Le fournisseur associé à ce dossier.';
                }
                field("Etat"; Rec."Etat")
                {
                    ToolTip = 'Le statut du dossier d''arrivage.';
                }
                field("Date d'ouverture"; Rec."Date d'ouverture")
                {
                    ToolTip = 'La date à laquelle le dossier a été ouvert.';
                }
                field("Date de clôture"; Rec."Date de clôture")
                {
                    ToolTip = 'La date à laquelle le dossier a été clôturé.';
                }
                field("Frais de transport"; Rec."Frais de transport")
                {
                    ToolTip = 'Le frais de transport associé à ce dossier.';
                }
                field("Frais financiers"; Rec."Frais financiers")
                {
                    ToolTip = 'Le frais financiers associé à ce dossier.';
                }
                field("Assurances"; Rec."Assurances")
                {
                    ToolTip = 'Les assurances associées à ce dossier.';
                }
                field("Commissions"; Rec."Commissions")
                {
                    ToolTip = 'Les commissions associées à ce dossier.';
                }
                field("Transit"; Rec."Transit")
                {
                    ToolTip = 'Le transit associé à ce dossier.';
                }
                field("Douane"; Rec."Douane")
                {
                    ToolTip = 'La douane associée à ce dossier.';
                }

            }
            part(LignesDossierArrivage; "LigneDossierArrivageSubForm")
            {
                ApplicationArea = All;
                Editable = true;
                SubPageLink = "No. Dossier" = field("No. Dossier");
                Caption = 'Lignes du Dossier d''Arrivage';
            }


        }
    }
    actions
    {
        area(Processing)
        {
            action("Liste des Avis de la ligne de dossier")
            {
                Caption = 'Liste des Avis associés à la ligne de dossier';
                ToolTip = 'Cliquez pour voir la liste des avis de la ligne de dossier.';

                trigger OnAction()
                var
                    AvisDossierArrivageRec: Record "LigneDossierArrivage";
                begin
                    AvisDossierArrivageRec.AfficherAvis(); // Call the procedure from the table

                end;
            }
            action("Liste des Prestations de la ligne de dossier")
            {
                Caption = 'Liste des Prestations associées à la ligne de dossier';
                ToolTip = 'Cliquez pour voir la liste des prestations de la ligne de dossier.';

                trigger OnAction()
                var
                    LigneDossierArrivageRec: Record "LigneDossierArrivage";
                begin
                    LigneDossierArrivageRec.AfficherPrestations(); // Call the procedure from the table
                end;
            }
            action("Calculer PRR")
            {
                Caption = 'Calculer PRR';
                ToolTip = 'Cliquez pour calculer le PRR.';

                trigger OnAction()
                var
                    CalculerPR: Codeunit "CalculerPR"; // Reference to codeunit
                begin
                    // Call the method and pass the current dossier record and a boolean value
                    CalculerPR.CalculerPRRViaDossier(Rec, false); // TRUE indicates a definitive calculation
                    Message('Le PRR a été calculé pour le dossier %1.', Rec."No. Dossier");
                end;
            }
            action("Liste des Avis associés au dossier")
            {
                Caption = 'Liste des Avis associés au dossier';
                ToolTip = 'Cliquez pour voir la liste des aviss associés au dossier.';

                RunObject = Page "ListeAvisDossierArrivage";
                RunPageLink = "No. Dossier" = field("No. Dossier");
                RunPageOnRec = false;

            }
            action("Liste des Prestations associées au dossier")
            {
                Caption = 'Liste des Prestations associées au dossier';
                ToolTip = 'Cliquez pour voir la liste des prestations associées au dossier.';

                RunObject = Page "ListePrestationDossierArrivage";
                RunPageLink = "No. Dossier" = field("No. Dossier");
                RunPageOnRec = false;

            }
            action("Contenu dossier arrivage")
            {
                Caption = 'Contenu dossier arrivage';
                ToolTip = 'Cliquez pour voir le contenu du dossier d''arrivage.';

                trigger OnAction()
                var
                    NDossier: Record "DossierArrivage";
                begin
                    NDossier.RESET();
                    NDossier.SETRANGE("No. dossier", Rec."No. dossier");
                    IF NDossier.FIND('-') THEN
                        REPORT.RUNMODAL(50305, TRUE, FALSE, NDossier);
                end;

            }

        }
    }
    trigger OnAfterGetCurrRecord()
    var
        PrestationDossier: Record "PrestationDossierArrivage";
        TauxDevise: Record "Currency Exchange Rate";
        FraisTransport: Decimal;
        FraisFinancier: Decimal;
    begin
        // Initialize the totals
        FraisTransport := 0;
        FraisFinancier := 0;

        // Reset and set ranges for calculating "Frais de transport"
        PrestationDossier.Reset();
        PrestationDossier.SetCurrentKey("No. Dossier", "No. prestation");
        PrestationDossier.SetRange("No. Dossier", Rec."No. Dossier");
        PrestationDossier.SetCurrentKey(Type);
        PrestationDossier.SetRange(Type, PrestationDossier.Type::"Frais de transport");

        if PrestationDossier.FindSet() then
            repeat
                // Calculate exchange rate for "Frais de transport"
                PrestationDossier.CalcFields("Code devise");
                FraisTransport := FraisTransport + TauxDevise.ExchangeAmtFCYToFCY(
                    Rec."Date d'ouverture",
                    PrestationDossier."Code devise",
                    '',
                    PrestationDossier."Montant affecté"
                );
            until PrestationDossier.Next() = 0;


        // Reset and set ranges for calculating "Frais financiers"
        PrestationDossier.SetRange(Type, PrestationDossier.Type::"Frais financiers");

        if PrestationDossier.FindSet() then
            repeat
                // Calculate exchange rate for "Frais financiers"
                PrestationDossier.CalcFields("Code devise");
                FraisFinancier := FraisFinancier + TauxDevise.ExchangeAmtFCYToFCY(
                    Rec."Date d'ouverture",
                    PrestationDossier."Code devise",
                    '',
                    PrestationDossier."Montant affecté"
                );
            until PrestationDossier.Next() = 0;

    end;


}
