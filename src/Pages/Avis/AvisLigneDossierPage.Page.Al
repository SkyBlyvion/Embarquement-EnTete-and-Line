page 50266 "AvisLigneDossierPage"
{
    ApplicationArea = All;
    Caption = 'Avis Ligne Dossier';
    PageType = List;
    SourceTable = "AvisLigneDossier";
    Editable = true;

    layout
    {
        area(Content)
        {
            repeater(Group)
            {
                field("Affectation"; Rec."Affectation")
                {
                    ToolTip = 'Indique si cette ligne est affectée ou non.';
                }
                field("No. ligne dossier"; Rec."No. ligne dossier")
                {
                    ToolTip = 'Indique le numéro de ligne du dossier associé.';
                }
                field("Montant affecté"; Rec."Montant affecté")
                {
                    ToolTip = 'Montant qui a été affecté à cette ligne.';
                }
                field("Code devise"; Rec."Code devise")
                {
                    ToolTip = 'Le code de devise utilisé pour cette ligne.';
                }
                field("Code credoc"; Rec."Code credoc")
                {
                    ToolTip = 'Spécifie le code credoc associé à cette ligne de dossier.';
                }
                field("No. réception"; Rec."No. réception")
                {
                    ToolTip = 'Numéro de réception associé à cette ligne.';
                }
                field("No. article"; Rec."No. article")
                {
                    ToolTip = 'Numéro de l''article associé à cette ligne.';
                }
                field("Désignation"; Rec."Désignation")
                {
                    ToolTip = 'La désignation de la ligne de dossier.';
                }
                field("Quantité (pièce)"; Rec."Quantité (pièce)")
                {
                    ToolTip = 'Quantité en pièces de cette ligne.';
                }
                field("Cout unitaire"; Rec."Cout unitaire")
                {
                    ToolTip = 'Le coût unitaire de cette ligne.';
                }
                field("Montant ligne (dev soc)"; Rec."Montant ligne (dev soc)")
                {
                    ToolTip = 'Montant de la ligne dans la devise de la société.';
                }
                field("Volume ligne"; Rec."Volume ligne")
                {
                    ToolTip = 'Le volume de la ligne.';
                }
                // field("No. ligne avis"; Rec."No. ligne avis")
                // {
                //     ToolTip = 'Indique le numéro de ligne associé à cet avis.';
                // }
                // field("No. dossier"; Rec."No. dossier")
                // {
                //     ToolTip = 'Spécifie le numéro du dossier associé à cette ligne.';
                // }
                // field("Type"; Rec."Type")
                // {
                //     ToolTip = 'Type de l''avis, par exemple, Marchandise, Financier, etc.';
                // }
                // field("Prévisionnel"; Rec."Prévisionnel")
                // {
                //     ToolTip = 'Indique si cette ligne est prévisionnelle ou non.';
                // }
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
                    AvisDossier: Record "AvisDossierArrivage";
                    CalculerPR: Codeunit "CalculerPR";
                    TextDOSSIER_ARRIVAGE01: Text[100];
                begin
                    TextDOSSIER_ARRIVAGE01 := 'L''affectation de l''avis n° %1 du Credoc n° 2 au dossier %3 n''a pas été trouvée';

                    IF NOT AvisDossier.GET(Rec."No. dossier", Rec."Code credoc", Rec."No. ligne avis") THEN
                        ERROR(TextDOSSIER_ARRIVAGE01, Rec."No. ligne avis",
                                Rec."Code credoc", Rec."No. dossier");
                    CalculerPR.CalculerMntAvisLigneDossier(AvisDossier, TRUE);

                end;
            }
            action("Affectation : décocher tout")
            {
                Caption = 'Affectation : décocher tout';
                ToolTip = 'Affectation : décocher tout';

                trigger OnAction()
                var
                    AvisLigneDossier: Record "Avislignedossier";
                    TextDOSSIER_ARRIVAGE03: Text[100];
                begin
                    TextDOSSIER_ARRIVAGE03 := 'Décocher toutes les lignes';
                    IF Rec.GETFILTERS <> '' THEN
                        IF CONFIRM(TextDOSSIER_ARRIVAGE03) THEN BEGIN
                            AvisLigneDossier.RESET();
                            AvisLigneDossier.COPY(Rec);
                            AvisLigneDossier.MODIFYALL(Affectation, FALSE, TRUE);
                        END;
                end;
            }
        }
    }

}
