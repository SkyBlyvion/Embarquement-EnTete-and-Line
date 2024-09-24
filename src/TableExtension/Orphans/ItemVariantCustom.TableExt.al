tableextension 50256 "ItemVariantCustom" extends "Item Variant"
{
    fields
    {
        // Add changes to table fields here
        field(50000; "Quantité Conditionnement"; Integer)
        {
            DataClassification = CustomerContent;
            Caption = 'Quantité Conditionnement';
            Description = 'CONDITINNEMENT_PRODUIT LN 23/09/24 REV24';
            Editable = true;
            BlankNumbers = DontBlank;
        }
        field(50001; "Sous Colisage"; Integer)
        {
            DataClassification = CustomerContent;
            Caption = 'Sous Colisage';
            Description = 'CONDITINNEMENT_PRODUIT LN 23/09/24 REV24';
            Editable = true;
            BlankNumbers = DontBlank;
        }
        field(50002; "Longeur"; Decimal)
        {
            DataClassification = CustomerContent;
            Caption = 'Longeur';
            Description = 'CONDITINNEMENT_PRODUIT LN 23/09/24 REV24';
            Editable = true;
            BlankNumbers = DontBlank;
        }
        field(50003; "Largeur"; Decimal)
        {
            DataClassification = CustomerContent;
            Caption = 'Largeur';
            Description = 'CONDITINNEMENT_PRODUIT LN 23/09/24 REV24';
            Editable = true;
            BlankNumbers = DontBlank;
        }
        field(50004; "Hauteur"; Decimal)
        {
            DataClassification = CustomerContent;
            Caption = 'Hauteur';
            Description = 'CONDITINNEMENT_PRODUIT LN 23/09/24 REV24';
            Editable = true;
            BlankNumbers = DontBlank;
        }
        field(50005; "Volume"; Decimal)
        {
            DataClassification = CustomerContent;
            Caption = 'Volume';
            Description = 'VOLUME_POIDS LN 23/09/24 REV24';
            Editable = true;
            BlankNumbers = DontBlank;
        }
        field(50006; "Poids"; Decimal)
        {
            DataClassification = CustomerContent;
            Caption = 'Poids';
            Description = 'VOLUME_POIDS LN 23/09/24 REV24';
            Editable = true;
            BlankNumbers = DontBlank;
        }
        field(50007; "Prioritaire Achat"; Boolean)
        {
            DataClassification = CustomerContent;
            Caption = 'Prioritaire Achat';
            Description = 'CONDITINNEMENT_PRODUIT LN 23/09/24 REV24';
            Editable = true;
            BlankNumbers = DontBlank;
        }
        field(50008; "Choix"; Option)
        {
            DataClassification = CustomerContent;
            Caption = 'Choix';
            Description = 'CONDITINNEMENT_PRODUIT LN 23/09/24 REV24';
            Editable = true;
            BlankNumbers = DontBlank;
            OptionMembers = "Achat","Vente","Achats/Ventes";
        }
        field(50009; "Présentation"; Option)
        {
            DataClassification = CustomerContent;
            Caption = 'Présentation';
            Description = 'CONDITINNEMENT_PRODUIT LN 23/09/24 REV24';
            Editable = true;
            BlankNumbers = DontBlank;
            OptionMembers = " ","Boîte Normale","Boîte Cadeau","Blister","Boîte Fenêtre","Sachet","Carte","Filmé","Etui","Boîte Blanche","Sachet+Carte cavalier","Boîte PVC","Boîte Présentoir","Coque","Polyform","Boîte Normale Photo","Boîte Blanche Photo","Caisse Bois","Palette";
        }
        field(50010; "Prioritaire Vente"; Boolean)
        {
            DataClassification = CustomerContent;
            Caption = 'Prioritaire Vente';
            Description = 'CONDITINNEMENT_PRODUIT LN 23/09/24 REV24';
            Editable = true;
            BlankNumbers = DontBlank;
        }
        field(50011; "Qté minimum vente"; Integer)
        {
            DataClassification = CustomerContent;
            Caption = 'Qté minimum vente';
            Description = 'CONDITINNEMENT_PRODUIT LN 23/09/24 REV24';
            Editable = true;
            BlankNumbers = DontBlank;
        }
    }

    keys
    {
        key(Key5; "Choix")
        {
            Enabled = true;
        }
    }

    fieldgroups
    {
        // Add changes to field groups here
    }
}