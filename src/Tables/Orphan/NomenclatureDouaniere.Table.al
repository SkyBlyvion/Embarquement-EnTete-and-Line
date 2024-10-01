table 50291 NomenclatureDouaniere
{
    DataClassification = ToBeClassified;
    Caption = 'Nomenclature Douanière';

    fields
    {
        field(1; "No. nomenclature douanière"; Code[10])
        {
            DataClassification = ToBeClassified;
            Caption = 'N° nomenclature douanière';
            TableRelation = "Tariff Number"; // Relation avec la table "Tariff Number"
        }
        field(2; "Code pays origine"; Code[10])
        {
            DataClassification = ToBeClassified;
            Caption = 'Code pays origine';
            TableRelation = "Country/Region"; // Relation avec la table "Country"
        }
        field(10; "Taux réduit douane"; Decimal)
        {
            DataClassification = ToBeClassified;
            Caption = 'Taux réduit douane';
            NotBlank = true;
        }
        field(11; "Licence"; Boolean)
        {
            DataClassification = ToBeClassified;
            Caption = 'Licence';
        }
        field(12; "Document surveillance"; Boolean)
        {
            DataClassification = ToBeClassified;
            Caption = 'Document surveillance';
        }
    }

    keys
    {
        key(PK; "No. nomenclature douanière", "Code pays origine")
        {
            Clustered = true;
        }
    }
}
