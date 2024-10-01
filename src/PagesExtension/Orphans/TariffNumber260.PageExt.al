pageextension 50293 TariffNumber260 extends "Tariff Numbers"
{
    layout
    {
        addafter("Supplementary Units")
        {
            field("TEC"; Rec."TEC")
            {
                ApplicationArea = All;
                ToolTip = 'Tariff Number';
            }
        }
    }
}
