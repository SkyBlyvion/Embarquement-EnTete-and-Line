page 50267 "AvisDossierArrivagePage"
{
    ApplicationArea = All;
    Caption = 'Avis Dossier Arrivage';
    PageType = List;
    SourceTable = "AvisDossierArrivage";
    Editable = true;

    layout
    {
        area(Content)
        {
            repeater(Group)
            {
                field("No. dossier"; Rec."No. dossier")
                {
                    ToolTip = 'Spécifie le numéro du dossier associé à cet avis.';
                }
                field("Code credoc"; Rec."Code credoc")
                {
                    ToolTip = 'Spécifie le code credoc associé à cet avis.';
                }
                field("No. ligne avis"; Rec."No. ligne avis")
                {
                    ToolTip = 'Indique le numéro de ligne de l''avis.';
                }
                field("Type"; Rec."Type")
                {
                    ToolTip = 'Type d''avis, par exemple, Marchandise, Financier, etc.';
                }
                field("Montant affecté"; Rec."Montant affecté")
                {
                    ToolTip = 'Montant affecté à ce dossier d''arrivage.';
                }
                field("Prévisionnel"; Rec."Prévisionnel")
                {
                    ToolTip = 'Indique si l''avis est prévisionnel ou non.';
                }
                field("Mnt total lignes affectées"; Rec."Mnt total lignes affectées")
                {
                    ToolTip = 'Montant total des lignes affectées pour cet avis.';
                }
                field("Affectation partielle"; Rec."Affectation partielle")
                {
                    ToolTip = 'Indique si une affectation partielle est présente pour cet avis.';
                }
                field("Mnt affecté total lig affect"; Rec."Mnt affecté total lig affect")
                {
                    ToolTip = 'Montant total affecté aux lignes de cet avis.';
                }
                field("Vol total lignes affectées"; Rec."Vol total lignes affectées")
                {
                    ToolTip = 'Volume total des lignes affectées pour cet avis.';
                }
                field("Code devise"; Rec."Code devise")
                {
                    ToolTip = 'Code devise associé à cet avis.';
                }
            }
        }
    }
}
