/* MEttre a jour avec la nouvelle version de la table Sales Price avant 2027*/
tableextension 50297 "SalesPriceExtension" extends "Sales Price"
{
    fields
    {
        // Ajout du champ "Prix net"
        field(50000; "Prix net"; Decimal)
        {
            DataClassification = ToBeClassified;
        }

        // Ajout du champ "Promotion"
        field(50001; "Promotion"; Boolean)
        {
            DataClassification = ToBeClassified;
        }

        // Ajout du champ "Remise prix net"
        field(50002; "Remise prix net"; Boolean)
        {
            DataClassification = ToBeClassified;
        }

        // Ajout du champ "Dernier PRT (dev soc)"
        field(50003; "Dernier PRT (dev soc)"; Decimal)
        {
            DataClassification = ToBeClassified;
        }

        // Ajout du champ "Dernier PRT"
        field(50004; "Dernier PRT"; Decimal)
        {
            DataClassification = ToBeClassified;
        }

        // Ajout du champ "Coef. Multi"
        field(50005; "Coef. Multi"; Decimal)
        {
            DataClassification = ToBeClassified;
        }

        // Ajout du champ "Prix Unitaire Simulé"
        field(50006; "Prix Unitaire Simulé"; Decimal)
        {
            DataClassification = ToBeClassified;
        }

        // Ajout du champ "Export Web"
        field(50007; "Export Web"; Boolean)
        {
            DataClassification = ToBeClassified;
        }

        // Ajout du champ "Prix Net simulé"
        field(50008; "Prix Net simulé"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
    }
}