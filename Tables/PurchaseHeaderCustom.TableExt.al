tableextension 50240 PurchaseHeaderCustom extends "Purchase Header"
{
    fields
    {
        field(50000; "No. Dossier"; Code[10])
        {
            DataClassification = AccountData;
            Caption = 'N° Dossier';
        }
        field(50001; "Date disponibilité Perpignan"; Date)
        {
            DataClassification = AccountData;
            Caption = 'Date disponibilité Perpignan';
        }
        field(50002; "Date d'embarquement prévue"; Date)
        {
            DataClassification = AccountData;
            Caption = 'Date d''embarquement prévue';
        }
        field(50004; "Incoterm"; Option)
        {
            DataClassification = AccountData;
            OptionMembers = EXW,FOB,CNI,CNF,CFR,CIF;
            Caption = 'Incoterm';
        }
        field(50005; "Gencodage"; Boolean)
        {
            DataClassification = AccountData;
            Caption = 'Gencodage';
        }
        field(50006; "Volume"; Decimal)
        {
            DataClassification = AccountData;
            Caption = 'Volume';
        }
        field(50007; "Poids"; Decimal)
        {
            DataClassification = AccountData;
            Caption = 'Poids';
        }
        field(50010; "Code transport routier"; Code[10])
        {
            DataClassification = AccountData;
            Caption = 'Code transport routier';
        }
        field(50011; "Montant transport routier"; Decimal)
        {
            DataClassification = AccountData;
            Caption = 'Montant transport routier';
        }
        field(50012; "Code devise transport routier"; Code[10])
        {
            DataClassification = AccountData;
            Caption = 'Code devise transport routier';
        }
        field(50013; "Facteur devise transp. routier"; Decimal)
        {
            DataClassification = AccountData;
            Caption = 'Facteur devise transp. routier';
        }
        field(50014; "Code transport maritime"; Code[10])
        {
            DataClassification = AccountData;
            Caption = 'Code transport maritime';
        }
        field(50015; "Montant transport maritime"; Decimal)
        {
            DataClassification = AccountData;
            Caption = 'Montant transport maritime';
        }
        field(50016; "Code devise transport maritime"; Code[10])
        {
            DataClassification = AccountData;
            Caption = 'Code devise transport maritime';
        }
        field(50017; "Facteur devise transp. maritim"; Decimal)
        {
            DataClassification = AccountData;
            Caption = 'Facteur devise transp. maritime';
        }
        field(50018; "% de frais financier"; Decimal)
        {
            DataClassification = AccountData;
            Caption = '% de frais financier';
        }
        field(50019; "% Assurances"; Decimal)
        {
            DataClassification = AccountData;
            Caption = '% Assurances';
        }
        field(50020; "% Commissions"; Decimal)
        {
            DataClassification = AccountData;
            Caption = '% Commissions';
        }
        field(50021; "% Transit"; Decimal)
        {
            DataClassification = AccountData;
            Caption = '% Transit';
        }
        field(50023; "Date de relance"; Date)
        {
            DataClassification = AccountData;
            Caption = 'Date de relance';
        }
        field(50024; "PRT Calculé"; Boolean)
        {
            DataClassification = AccountData;
            Caption = 'PRT Calculé';
        }
        field(50025; "Maj Réservation Vente"; Boolean)
        {
            DataClassification = AccountData;
            Caption = 'Maj Réservation Vente';
        }
        field(50026; "No. commande portable"; Code[20])
        {
            DataClassification = AccountData;
            Caption = 'N° commande portable';
        }
        field(50027; "Date calcul PRT"; Date)
        {
            DataClassification = AccountData;
            Caption = 'Date calcul PRT';
        }
        field(50028; "Heure calcul PRT"; Time)
        {
            DataClassification = AccountData;
            Caption = 'Heure calcul PRT';
        }
        field(50029; "Commande REV'GARDEN"; Boolean)
        {
            DataClassification = AccountData;
            Caption = 'Commande REV''GARDEN';
        }
        field(50060; "Total Outstanding Quantity"; Decimal)
        {
            DataClassification = AccountData;
            Caption = 'Quantité totale en attente';
        }
    }
}
