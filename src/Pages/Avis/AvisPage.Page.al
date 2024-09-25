page 50265 "AvisPage"
{
    ApplicationArea = All;
    Caption = 'Avis';
    PageType = List;
    SourceTable = Avis;
    Editable = true;

    layout
    {
        area(Content)
        {
            repeater(Group)
            {
                field("Code credoc"; Rec."Code credoc")
                {
                    ToolTip = 'Sélectionnez le code du crédit documentaire (Credoc) associé à l''avis.';
                }
                field("No. ligne"; Rec."No. ligne")
                {
                    ToolTip = 'Indiquez le numéro de ligne de l''avis.';
                }
                field("Date"; Rec."Date")
                {
                    ToolTip = 'Spécifiez la date de l''avis.';
                }
                field("Type"; Rec."Type")
                {
                    ToolTip = 'Sélectionnez le type d''avis : Marchandise, Financier, Avoir qualité, Escompte ou Autre.';
                }
                field("Montant"; Rec."Montant")
                {
                    ToolTip = 'Indiquez le montant associé à cet avis.';
                }
                field("Code devise"; Rec."Code devise")
                {
                    ToolTip = 'Sélectionnez la devise utilisée pour l''avis.';
                }
                field("Facteur devise"; Rec."Facteur devise")
                {
                    ToolTip = 'Affiche le facteur de conversion de la devise sélectionnée.';
                }
                field("Imputé"; Rec."Imputé")
                {
                    ToolTip = 'Indique si l''avis est imputé (affecté à un dossier d''arrivage).';
                }
                field("Mnt affecté total (doss)"; Rec."Mnt affecté total (doss)")
                {
                    ToolTip = 'Montant total affecté à l''avis sur les dossiers.';
                }
                field("Mnt affecté total (lig doss)"; Rec."Mnt affecté total (lig doss)")
                {
                    ToolTip = 'Montant total affecté à l''avis sur les lignes des dossiers.';
                }
                field("Mnt total lig doss affectées"; Rec."Mnt total lig doss affectées")
                {
                    ToolTip = 'Montant total des lignes de dossiers affectées.';
                }
                field("Vol total lig doss affectées"; Rec."Vol total lig doss affectées")
                {
                    ToolTip = 'Volume total des lignes de dossiers affectées.';
                }
                field("Prévisionnel"; Rec."Prévisionnel")
                {
                    ToolTip = 'Indique si cet avis est prévisionnel.';
                }
                field("%"; Rec."%")
                {
                    ToolTip = 'Indiquez le pourcentage lié à cet avis.';
                }
            }
        }
    }
}
