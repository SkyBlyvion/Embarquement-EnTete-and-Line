page 50237 "LigneEmbarqmtSubform"
{
    PageType = ListPart;
    SourceTable = "LigneEmbarquement";
    ApplicationArea = All;
    Caption = 'Lignes embarquement';

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("No. commande achat"; Rec."No. commande achat")
                {
                    ApplicationArea = All;
                    ToolTip = 'Displays the order number associated with the shipment lines.';
                }
                field("No. ligne commande achat"; Rec."No. ligne commande achat")
                {
                    ApplicationArea = All;
                    ToolTip = 'Displays the order line number associated with the shipment lines.';
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
                field("Désignation"; Rec."Désignation")
                {
                    ApplicationArea = All;
                    ToolTip = 'Displays the description of the item being shipped.';
                }
                field("Quantité"; Rec."Quantité")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the quantity of the item being shipped.';
                }
                field("Colisage"; Rec."Colisage") // S'agit de la quantité de conditionnement et ce champ précis est défini depuis table LigneEmbarquement FlowField
                {
                    ApplicationArea = All;
                    ToolTip = 'Displays the package size of the item being shipped.';
                }
                field("Quantité (Pièce)"; Rec."Quantité (Pièce)")
                {
                    ApplicationArea = All;
                    ToolTip = 'Displays the quantity of the item being shipped in pieces.';
                }
                field("Référence fournisseur"; Rec."Référence fournisseur")
                {
                    ApplicationArea = All;
                    ToolTip = 'Displays the supplier reference of the item being shipped.';
                }
                field("No. conteneur"; Rec."No. conteneur")
                {
                    ApplicationArea = All;
                    ToolTip = 'Displays the container number associated with the shipment lines.';
                }
                field("Date réception prévue"; Rec."Date réception prévue")
                {
                    ApplicationArea = All;
                    ToolTip = 'Displays the expected receipt date of the item being shipped.';
                }
            }
        }
    }
}
