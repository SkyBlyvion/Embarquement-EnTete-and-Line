page 50270 "PrestationDossierArrivagePage"
{
    ApplicationArea = All;
    Caption = 'Prestation Dossier Arrivage';
    PageType = List;
    SourceTable = "PrestationDossierArrivage";
    Editable = true;

    //CardPageID = "PrestationLigneDossierPage";

    layout
    {
        area(Content)
        {
            repeater(Group)
            {
                field("No. Dossier"; Rec."No. Dossier")
                {
                    ToolTip = 'Le numéro du dossier associé à cette prestation.';
                }
                field("No. prestation"; Rec."No. prestation")
                {
                    ToolTip = 'Le numéro de la prestation.';
                    Visible = false;
                }
                field("Montant affecté"; Rec."Montant affecté")
                {
                    ToolTip = 'Le montant affecté à cette prestation.';
                }
                field("Code devise"; Rec."Code devise")
                {
                    ToolTip = 'Le code devise utilisé pour cette prestation.';
                }
                field("Mnt affecté total lig affect"; Rec."Mnt affecté total lig affect")
                {
                    ToolTip = 'Le montant total affecté pour les lignes associées.';
                }
                field("Mnt total lignes affectées"; Rec."Mnt total lignes affectées")
                {
                    ToolTip = 'Le montant total des lignes affectées pour cette prestation.';
                }
                field("Affectation partielle"; Rec."Affectation partielle")
                {
                    ToolTip = 'Indique si l''affectation est partielle.';
                }
            }
        }
    }
    actions
    {
        area(Processing)
        {
            action("Affecter Partiellement")
            {
                Caption = 'Affecter Partiellement';
                ToolTip = 'Affecte une quantité partiellement de la quantité totale de la prestation.';

                trigger OnAction()
                begin
                    Page.Run(Page::PrestationLigneDossierPage);
                end;
            }

            action("Calculer les montants par dossier")
            {
                Caption = 'Calculer les montants par dossier';
                ToolTip = 'Calculer les montants par dossier';

                trigger OnAction()
                var
                    CalculerPR: Codeunit "CalculerPR";
                begin
                    // Appel de la méthode pour calculer les montants par dossier
                    CalculerPR.CalculerMntPrestDossier(Rec);
                end;
            }
            action("Calculer les montants par ligne de dossier")
            {
                Caption = 'Calculer les montants par ligne de dossier';
                ToolTip = 'Calculer les montants par ligne de dossier';

                trigger OnAction()
                var
                    CalculerPR: Codeunit "CalculerPR";
                begin
                    // Appel de la méthode pour calculer les montants par dossier
                    CalculerPR.CalculerMntPrestLigneDossier(Rec, true);
                end;
            }
            action("Calculer PRR")
            {
                Caption = 'Calculer PRR';
                ToolTip = 'Calculer PRR pour chaque dossier lié à la prestation';

                trigger OnAction()
                var
                    PrestDossier: Record "PrestationDossierArrivage"; // Table pour les prestations liées
                    Dossier: Record "DossierArrivage"; // Table pour les dossiers d'arrivage
                    CalculerPR: Codeunit "CalculerPR"; // Référence au codeunit Calculer PR
                begin
                    // Copier l'enregistrement actuel
                    PrestDossier.COPY(Rec);

                    // Parcourir chaque dossier de prestation
                    if PrestDossier.FIND('-') then
                        repeat
                            // Si un dossier est trouvé, appeler la méthode pour calculer le PRR
                            if Dossier.GET(PrestDossier."No. dossier") then
                                CalculerPR.CalculerPRRViaDossier(Dossier, FALSE);
                        until PrestDossier.NEXT() = 0;
                end;
            }

        }
    }
    procedure TestPresDossClot()
    var
        Dossier: Record "DossierArrivage";
        PrestDossier: Record "PrestationDossierArrivage";
        NbDossNonClot: Integer;
        NbDossClot: Integer;
    begin
        NbDossNonClot := 0;
        NbDossClot := 0;

        PrestDossier.COPY(Rec);
        if PrestDossier.FIND('-') then
            repeat
                if Dossier.GET(PrestDossier."No. dossier") then
                    if Dossier.Etat = Dossier.Etat::Clôturé then
                        NbDossClot := NbDossClot + 1
                    else
                        NbDossNonClot := NbDossNonClot + 1;
            until PrestDossier.NEXT() = 0;
    end;
}