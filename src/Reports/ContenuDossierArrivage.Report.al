report 50305 ContenuDossierArrivage
{
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = All;
    Caption = 'Contenu Dossier Arrivage';
    ProcessingOnly = true;
    DefaultRenderingLayout = LayoutName; // TODO: Créer le template

    dataset
    {
        dataitem("Dossier d'arrivage"; "DossierArrivage")
        {
            DataItemTableView = SORTING("No. dossier");
            RequestFilterFields = "No. dossier";
            CalcFields = "Nom Fournisseur";
            //PrintOnlyIfDetails = true;
            //NewPagePerRecord = true;

            column("NoDossier"; "No. dossier")
            {
            }
            dataitem("Ligne dossier arrivage"; "LigneDossierArrivage")
            {
                DataItemTableView = SORTING("No. dossier", "No. ligne");
                DataItemLinkReference = "Dossier d'arrivage";
                DataItemLink = "No. Dossier" = field("No. dossier"), "No. preneur d'ordre" = field("No. Fournisseur");
                RequestFilterFields = "No. article";
                //DataItemIndent = 1;
                //PrintOnlyIfDetails = false;
                //GroupTotalFields = "No. dossier"
                //DataItemVarName = "LigneDossierArrivage";

                column("NoArticle"; "No. Article")
                {
                }

                trigger OnAfterGetRecord()
                var
                    LigRecpt: Record "Purch. Rcpt. Line";
                    LigAcht: Record "Purchase Line";
                    varMtTotal: Decimal;
                    varVolTotal: Decimal;
                    varNbTotalColis: Integer;
                    varReliquat: Integer;
                begin
                    // Accumuler les totaux pour le montant, le volume et la quantité
                    varMtTotal := varMtTotal + Montant;
                    varVolTotal := varVolTotal + Volume;
                    varNbTotalColis := varNbTotalColis + Quantité;

                    // REV1.29 : Calculer le reliquat (pièce) si la ligne de réception existe
                    if LigRecpt.Get("No. réception", "No. ligne réception") then begin
                        LigAcht.Reset();
                        LigAcht.SetRange("Document No.", LigRecpt."Order No.");
                        LigAcht.SetRange("Line No.", LigRecpt."Order Line No.");
                        if LigAcht.FindSet() then
                            repeat
                                varReliquat := LigAcht."Qty. to Receive (Base)";
                            until LigAcht.Next() = 0;
                    end;
                    // Fin REV1.29
                end;
            }
        }

    }

    requestpage
    {
        AboutTitle = 'Teaching tip title';
        AboutText = 'Teaching tip content';
        layout
        {
            area(Content)
            {
                group(GroupName)
                {
                    field("No. Dossier Filter"; "Dossier d'arrivage"."No. dossier")
                    {
                        ApplicationArea = All;
                        Caption = 'No. Dossier';
                        ToolTip = 'No. Dossier';
                    }
                }
            }
        }

        actions
        {
            area(processing)
            {
                action(LayoutName)
                {
                    ApplicationArea = All;
                    ToolTip = 'Generate Report';
                    Caption = 'Generate Report';
                }
            }
        }
    }

    rendering
    {
        layout(LayoutName)
        {
            Type = Excel;
            LayoutFile = 'mySpreadsheet.xlsx';
        }
    }
}