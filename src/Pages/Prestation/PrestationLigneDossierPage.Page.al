page 50269 "PrestationLigneDossierPage"
{
    ApplicationArea = All;
    Caption = 'Prestation Ligne Dossier';
    PageType = List;
    SourceTable = "PrestationLigneDossier";
    Editable = true;

    layout
    {
        area(Content)
        {
            repeater(Group)
            {
                field("Affectation"; Rec."Affectation")
                {
                    ToolTip = 'Indique si cette ligne de prestation est affectée ou non.';
                }
                field("No. ligne dossier"; Rec."No. ligne dossier")
                {
                    ToolTip = 'Numéro de la ligne dans le dossier.';
                }
                field("Montant affecté"; Rec."Montant affecté")
                {
                    ToolTip = 'Montant affecté à cette ligne de dossier.';
                }
                field("Code devise"; Rec."Code devise")
                {
                    ToolTip = 'Code devise utilisé pour cette ligne de dossier.';
                }
                field("No. réception"; Rec."No. réception")
                {
                    ToolTip = 'Numéro de réception associé à cette ligne de dossier.';
                }
                field("No. article"; Rec."No. article")
                {
                    ToolTip = 'Numéro de l''article associé à cette ligne de dossier.';
                }
                field("Désignation"; Rec."Désignation")
                {
                    ToolTip = 'Désignation de l''article lié à cette ligne de dossier.';
                }
                field("Quantité (pièce)"; Rec."Quantité (pièce)")
                {
                    ToolTip = 'Quantité en pièces pour cette ligne de dossier.';
                }
                field("Cout unitaire"; Rec."Cout unitaire")
                {
                    ToolTip = 'Coût unitaire de l''article associé à cette ligne de dossier.';
                }
                field("Montant ligne (dev soc)"; Rec."Montant ligne (dev soc)")
                {
                    ToolTip = 'Montant de la ligne dans la devise de la société.';
                }
                field("Volume ligne"; Rec."Volume ligne")
                {
                    ToolTip = 'Volume de la ligne de dossier.';
                }
            }
        }
    }
    actions
    {
        area(Processing)
        {
            action("Calculer les montants par ligne de dossier")
            {
                Caption = 'Calculer les montants par ligne de dossier';
                ToolTip = 'Calculer les montants par ligne de dossier';

                trigger OnAction()
                var
                    PrestDossier: Record "PrestationDossierArrivage";
                    Dossier: Record "DossierArrivage";
                    CalculerPR: Codeunit "CalculerPR";

                    TextDOSSIER_ARRIVAGE01: Text[100]; // Use Text for variable messages
                    TextDOSSIER_ARRIVAGE02: Text[100];
                begin
                    TextDOSSIER_ARRIVAGE01 := 'Modifications interdites : ce dossier est clôturé';
                    TextDOSSIER_ARRIVAGE02 := 'L''affectation de la prestation %1 au dossier %2 n''a pas été trouvée';

                    IF Dossier.GET(Rec."No. dossier") then
                        IF Dossier.Etat = Dossier.Etat::Clôturé then
                            ERROR(TextDOSSIER_ARRIVAGE01);

                    IF NOT PrestDossier.GET(Rec."No. dossier", Rec."No. prestation") THEN
                        ERROR(TextDOSSIER_ARRIVAGE02, Rec."No. prestation", Rec."No. dossier");

                    CalculerPR.CalculerMntPrestLigneDossier(PrestDossier, TRUE);
                end;
            }
            action("Affectation : décocher tout")
            {
                Caption = 'Affectation : décocher tout';
                ToolTip = 'Affectation : décocher tout';

                trigger OnAction()
                var
                    PrestationLigneDossier: Record "PrestationLigneDossier";
                    TextDOSSIER_ARRIVAGE03: Text[100];
                begin
                    TextDOSSIER_ARRIVAGE03 := 'Décocher toutes les lignes';
                    IF Rec.GETFILTERS <> '' THEN
                        IF CONFIRM(TextDOSSIER_ARRIVAGE03) THEN BEGIN
                            PrestationLigneDossier.RESET();
                            PrestationLigneDossier.COPY(Rec);
                            PrestationLigneDossier.MODIFYALL(Affectation, FALSE, TRUE);
                            // No need for CurrForm.UPDATECONTROLS, page updates automatically
                        END;
                end;
            }
        }
    }

}
