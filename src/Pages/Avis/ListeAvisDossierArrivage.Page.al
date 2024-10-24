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
            repeater(GroupName)
            {
                field("Code credoc"; Rec."Code credoc")
                {
                    ToolTip = 'Sélectionnez le code du credit documentaire (Credoc) associé à l''avis.';
                }
            }
        }
        area(Factboxes)
        {

        }
    }
}