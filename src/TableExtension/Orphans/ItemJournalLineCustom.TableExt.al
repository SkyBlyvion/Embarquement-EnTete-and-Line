/* 
    //TODO: Faire correspondre les champs suivants et ajouter les modifications
    //TODO: Ajouter les champs a la page ou les pages concernées
    Modification Name :
    - 5402 "Variant Code" devient "Conditionnement produit"
    - 5413 "Quantité Base" devient "Quantité (Pièce)"
    - 5415 "Quantité facturée (base)" devient "Quantité facturée (Pièce)"
    - 5468 "Quantité réservée (base)" devient "Quantité positive réservée (Pièce)"
    Gestion coût unitaire
*/

tableextension 50299 "ItemJournalLineCustom" extends "Item Journal Line"
{
    fields
    {
        field(50000; "No. dossier"; Code[10])
        {
            DataClassification = AccountData;
            Caption = 'No. dossier';
            Description = 'DOSSIER_ARRIVAGE PRR - LN - 22/10/24 REV24';
            Editable = true;
        }
        field(50001; "Date disponibilité Perpignan"; Date)
        {
            DataClassification = AccountData;
            Caption = 'Date disponibilité Perpignan';
            Description = 'DOSSIER_ARRIVAGE PRR - LN - 22/10/24 REV24';
            Editable = true;
            BlankNumbers = DontBlank;
        }
        field(50004; "Origine"; Code[20])
        {
            DataClassification = CustomerContent;
            Caption = 'Origine';
            Description = 'LIGNE_FEUILLE_ARTICLE PRR - LN - 22/10/24 REV24';
            Editable = true;
        }
        field(50005; "Promo"; Boolean)
        {
            DataClassification = CustomerContent;
            Caption = 'Promo';
            Description = 'LIGNE_FEUILLE_ARTICLE PRR - LN - 22/10/24 REV24';
            Editable = true;
            BlankNumbers = DontBlank;
        }
        field(50008; "No. commande PalmWare"; Code[11])
        {
            DataClassification = AccountData;
            Caption = 'No. commande PalmWare';
            Description = 'PALMWARE - LN - 22/10/24 REV24';
            Editable = true;
        }
        field(50009; "Avoir financier"; Boolean)
        {
            DataClassification = CustomerContent;
            Caption = 'Avoir financier';
            Description = 'LIGNE_FEUILLE_ARTICLE PRR - LN - 22/10/24 REV24';
            Editable = false;
            BlankNumbers = DontBlank;
        }
    }

    keys
    {
        // Add changes to keys here
    }

    fieldgroups
    {
        // Add changes to field groups here
    }

    var
        myInt: Integer;
}