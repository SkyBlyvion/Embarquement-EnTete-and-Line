page 50288 "NDPPAYS"
{
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Lists;
    SourceTable = "NDPPAYS";

    layout
    {
        area(Content)
        {
            repeater(GroupName)
            {
                field("No. nomenclature douanière"; Rec."No. nomenclature douanière")
                {
                    ToolTip = 'No. nomenclature douanière';
                }
                field("Code pays origine"; Rec."Code pays origine")
                {
                    ToolTip = 'Code pays origine';
                }
                field("Taux réduit douane"; Rec."Taux réduit douane")
                {
                    ToolTip = 'Taux réduit douane';
                }
                field("License"; Rec."License")
                {
                    ToolTip = 'License';
                }
                field("Document surveillance"; Rec."Document surveillance")
                {
                    ToolTip = 'Document surveillance';
                }
            }
        }
        area(Factboxes)
        {

        }
    }


}