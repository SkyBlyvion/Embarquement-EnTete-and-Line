page 50237 "LigneEmbarqmtSubform"
{
    PageType = ListPart;
    SourceTable = "LigneEmbarquement";
    ApplicationArea = All;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("No. embarquement"; Rec."No. embarquement")
                {
                    ApplicationArea = All;
                    ToolTip = 'Displays the shipment number associated with the shipment lines.';
                }
                field("No. preneur d'ordre"; Rec."No. preneur d'ordre")
                {
                    ApplicationArea = All;
                    ToolTip = 'Displays the vendor number associated with the shipment lines.';
                }
                field("No. Article"; Rec."No. Article")
                {
                    ApplicationArea = All;
                    ToolTip = 'Click to view or edit the details of the selected item.';
                    trigger OnAssistEdit()
                    begin
                        PAGE.RUNMODAL(PAGE::"Item Card", Rec);
                    end;
                }
                field("Quantité"; Rec."Quantité")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the quantity of the item being shipped.';
                }
            }
        }
    }
}
