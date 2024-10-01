tableextension 50289 "PurchasePriceCustom" extends "Purchase Price"
{
    fields
    {
        field(50000; "Incoterm"; Option)
        {
            Caption = 'Incoterm';
            OptionCaption = ' ,EXW,FOB,CNI,CFR,CIF';
            OptionMembers = " ","EXW",FOB,CNI,CNF,CFR,CIF;
            DataClassification = ToBeClassified;
        }
        field(50001; "Dernière Remise Fournisseur"; Date)
        {
            Caption = 'Dernière Remise Fournisseur';
            DataClassification = ToBeClassified;
        }
        field(50002; PRT; Decimal)
        {
            Caption = 'PRT';
            DataClassification = ToBeClassified;
        }
        field(50003; PRR; Decimal)
        {
            Caption = 'PRR';
            DataClassification = ToBeClassified;
        }
        field(50004; Remise; Decimal)
        {
            Caption = 'Remise';
            DataClassification = ToBeClassified;
        }
        field(50005; "Date dernière Commande"; Date)
        {
            Caption = 'Date dernière Commande';
            DataClassification = ToBeClassified;
        }
        field(50006; "No. dernière Commande"; Code[20])
        {
            Caption = 'N° dernière Commande';
            DataClassification = ToBeClassified;
        }
        field(50007; "Qté dernière Commande (Pcs)"; Decimal)
        {
            Caption = 'Qté dernière Commande (Pcs)';
            DataClassification = ToBeClassified;
        }
        field(50008; "Taux devise PRT"; Decimal)
        {
            Caption = 'Taux devise PRT';
            DataClassification = ToBeClassified;
        }
        field(50009; "PRT Date"; Date)
        {
            Caption = 'Date PRT';
            DataClassification = ToBeClassified;
        }
        field(50010; "Taux devise PRR"; Decimal)
        {
            Caption = 'Taux devise PRR';
            DataClassification = ToBeClassified;
        }
        field(50011; "PRR Date"; Date)
        {
            Caption = 'Date PRR';
            DataClassification = ToBeClassified;
        }
        field(50012; "Vendor Item No."; Text[30])
        {
            Caption = 'Vendor Item No.';
            DataClassification = ToBeClassified;
        }
    }
}
