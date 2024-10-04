pageextension 50298 "SalesPriceListExtension" extends "Sales Prices"
{
    layout
    {
        addlast(Control1)
        {
            field("Prix net"; Rec."Prix net")
            {
                ApplicationArea = All;
                ToolTip = 'Prix net de l''article dans la devise de la société.';
            }
            field("Remise prix net"; Rec."Remise prix net")
            {
                ApplicationArea = All;
                ToolTip = 'Remise sur le Prix net de l''article.';
            }
            field("Prix Net simulé"; Rec."Prix Net simulé")
            {
                ApplicationArea = All;
                ToolTip = 'Prix net de l''article dans la devise de la société.';
            }
            field("Promotion"; Rec."Promotion")
            {
                ApplicationArea = All;
                ToolTip = 'Prix de l''article dans la devise de la société.';
            }
            field("Dernier PRT (dev soc)"; Rec."Dernier PRT (dev soc)")
            {
                ApplicationArea = All;
                ToolTip = 'Prix de revient de l''article dans la devise de la société.';
            }
            field("Dernier PRT"; Rec."Dernier PRT")
            {
                ApplicationArea = All;
                ToolTip = 'Dernier Prix de revient theorique de l''article calculée.';
            }
            field("Coef. Multi"; Rec."Coef. Multi")
            {
                ApplicationArea = All;
                ToolTip = 'Coefficient multiplicateur de l''article.';
            }
            field("Prix Unitaire Simulé"; Rec."Prix Unitaire Simulé")
            {
                ApplicationArea = All;
                ToolTip = 'Prix unitaire de l''article dans la devise de la société.';
            }
            field("Export Web"; Rec."Export Web")
            {
                ApplicationArea = All;
                ToolTip = 'Export Web de l''article.';
            }
        }
    }
}
