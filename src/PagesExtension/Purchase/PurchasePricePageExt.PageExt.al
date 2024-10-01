pageextension 50290 "PurchasePricePageExt" extends "Purchase Prices"
{
    layout
    {
        addlast(Control1)
        {
            field("Incoterm"; Rec."Incoterm")
            {
                ApplicationArea = All;
                Caption = 'Incoterm';
                ToolTip = 'Incoterm';
            }
            field("Dernière Remise Fournisseur"; Rec."Dernière Remise Fournisseur")
            {
                ApplicationArea = All;
                Caption = 'Dernière Remise Fournisseur';
                ToolTip = 'Dernière Remise Fournisseur';
            }
            field(PRT; Rec.PRT)
            {
                ApplicationArea = All;
                Caption = 'PRT';
                ToolTip = 'PRT';
            }
            field(PRR; Rec.PRR)
            {
                ApplicationArea = All;
                Caption = 'PRR';
                ToolTip = 'PRR';
            }
            field(Remise; Rec.Remise)
            {
                ApplicationArea = All;
                Caption = 'Remise';
                ToolTip = 'Remise';
            }
            field("Date dernière Commande"; Rec."Date dernière Commande")
            {
                ApplicationArea = All;
                Caption = 'Date dernière Commande';
                ToolTip = 'Date dernière Commande';
            }
            field("No. dernière Commande"; Rec."No. dernière Commande")
            {
                ApplicationArea = All;
                Caption = 'N° dernière Commande';
                ToolTip = 'N° dernière Commande';
            }
            field("Qté dernière Commande (Pcs)"; Rec."Qté dernière Commande (Pcs)")
            {
                ApplicationArea = All;
                Caption = 'Qté dernière Commande (Pcs)';
                ToolTip = 'Qté dernière Commande (Pcs)';
            }
            field("Taux devise PRT"; Rec."Taux devise PRT")
            {
                ApplicationArea = All;
                Caption = 'Taux devise PRT';
                ToolTip = 'Taux devise PRT';
            }
            field("PRT Date"; Rec."PRT Date")
            {
                ApplicationArea = All;
                Caption = 'Date PRT';
                ToolTip = 'Date PRT';
            }
            field("Taux devise PRR"; Rec."Taux devise PRR")
            {
                ApplicationArea = All;
                Caption = 'Taux devise PRR';
                ToolTip = 'Taux devise PRR';
            }
            field("PRR Date"; Rec."PRR Date")
            {
                ApplicationArea = All;
                Caption = 'Date PRR';
                ToolTip = 'Date PRR';
            }
            field("Vendor Item No."; Rec."Vendor Item No.")
            {
                ApplicationArea = All;
                Caption = 'Vendor Item No.';
                ToolTip = 'Vendor Item No.';
            }
        }
    }
}
