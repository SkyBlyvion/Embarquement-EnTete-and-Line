tableextension 50241 PurchaseLineCustom extends "Purchase Line" // Line sans s est la table
{
    fields
    {
        field(50000; "N° dossier"; Code[10])
        {
            DataClassification = EndUserIdentifiableInformation;
            Caption = 'N° dossier';
        }
        field(50001; "Date d'embarquement prévue"; Date)
        {
            DataClassification = SystemMetadata;
            Caption = 'Date d''embarquement prévue';
        }
        field(50002; "Coût unitaire (Pièce)"; Decimal)
        {
            DataClassification = AccountData;
            Caption = 'Coût unitaire (Pièce)';
        }
        field(50003; "Date de relance"; Date)
        {
            DataClassification = SystemMetadata;
            Caption = 'Date de relance';
        }
        field(50004; "Qté à embarquer"; Decimal)
        {
            DataClassification = AccountData;
            Caption = 'Quantité à embarquer';
        }
        field(50005; "Qté à embarquer (Pièce)"; Decimal)
        {
            DataClassification = AccountData;
            Caption = 'Quantité à embarquer (Pièce)';
        }
        field(50006; "Qté embarquée"; Decimal)
        {
            DataClassification = AccountData;
            Caption = 'Quantité embarquée';
        }
        field(50007; "Qté embarquée (Pièce)"; Decimal)
        {
            DataClassification = AccountData;
            Caption = 'Quantité embarquée (Pièce)';
        }
        field(50008; "Volume (unitaire)"; Decimal)
        {
            DataClassification = AccountData;
            Caption = 'Volume unitaire';
        }
        field(50009; "Volume"; Decimal)
        {
            DataClassification = AccountData;
            Caption = 'Volume total';
        }
        field(50010; "Poids (unitaire)"; Decimal)
        {
            DataClassification = AccountData;
            Caption = 'Poids unitaire';
        }
        field(50011; "Poids"; Decimal)
        {
            DataClassification = AccountData;
            Caption = 'Poids total';
        }
        field(50012; "TEC"; Decimal)
        {
            DataClassification = AccountData;
            Caption = 'TEC';
        }
        field(50013; "Incoterm"; Option)
        {
            OptionMembers = EXW,FOB,CNI,CFR,CIF;
            DataClassification = SystemMetadata;
            Caption = 'Incoterm';
        }
        field(50014; "Quantité/Conditionnement"; Integer)
        {
            DataClassification = SystemMetadata;
            Caption = 'Quantité/Conditionnement';
        }
        field(50016; "N° conteneur"; Text[30])
        {
            DataClassification = EndUserIdentifiableInformation;
            Caption = 'N° conteneur';
        }
        field(50017; "Taxe anti-dumping"; Decimal)
        {
            DataClassification = AccountData;
            Caption = 'Taxe anti-dumping';
        }

    }

    //TODO: Add triggers ( 3800 lignes à Refactoriser )
}
