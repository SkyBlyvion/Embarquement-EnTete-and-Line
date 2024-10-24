page 50301 ListeAvisDossierArrivage
{
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Lists;
    SourceTable = "AvisDossierArrivage";

    layout
    {
        area(Content)
        {
            repeater(Général)
            {
                field("Code credoc"; Rec."Code credoc")
                {
                    ToolTip = 'Sélectionnez le code du credit documentaire (Credoc) associé à l''avis.';
                }
                field("No. ligne avis"; Rec."No. ligne avis")
                {
                    ToolTip = 'Sélectionnez le numéro de ligne de l''avis.';
                }
                field("Type"; Rec."Type")
                {
                    ToolTip = 'Sélectionnez le type de l''avis.';
                }
                field("Montant affecté"; Rec."Montant affecté")
                {
                    ToolTip = 'Sélectionnez le montant affecté à l''avis.';
                }
                field("Code devise"; Rec."Code devise")
                {
                    ToolTip = 'Sélectionnez le code de la devise.';
                }
                field("Mnt affecté total lig affect"; Rec."Mnt affecté total lig affect")
                {
                    ToolTip = 'Sélectionnez le montant total affecté à la ligne de l''avis.';
                }
                field("Mnt total lignes affectées"; Rec."Mnt total lignes affectées")
                {
                    ToolTip = 'Sélectionnez le montant total affecté à toutes les lignes de l''avis.';
                }
                field("Affectation partielle"; Rec."Affectation partielle")
                {
                    ToolTip = 'Sélectionnez si l''avis est affecté partiellement.';
                }
            }
        }
        area(Factboxes)
        {

        }
    }
}