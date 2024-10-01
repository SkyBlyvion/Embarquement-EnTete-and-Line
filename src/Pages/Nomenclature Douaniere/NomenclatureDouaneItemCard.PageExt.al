pageextension 50296 "NomenclatureDouaneItemCard" extends "Item Card"
{
    actions
    {
        addafter(Assembly)
        {
            action("ViewNomenclatureDouaniere")
            {
                ApplicationArea = All;
                Caption = 'Afficher Nomenclature Douanière';
                ToolTip = 'Nomenclatures douanières.';
                Image = History;

                trigger OnAction()
                var
                    NomenclatureDouaniereRec: Record "NomenclatureDouaniere";
                    TariffNumberRec: Record "Tariff Number";
                begin
                    // Utilise "Tariff No." depuis la fiche article
                    if Rec."Tariff No." = '' then begin
                        Message('Aucun numéro de nomenclature Produit n''a été assigné à cet article.');
                        exit;
                    end;

                    // Récupère le Tariff Number lié à l'article via le champ "Tariff No."
                    if TariffNumberRec.Get(Rec."Tariff No.") then begin
                        // Applique le filtre sur Nomenclature Douaniere en fonction du Tariff Number
                        NomenclatureDouaniereRec.SetRange("No. nomenclature douanière", TariffNumberRec."No.");

                        // Ouvre la page Nomenclature Douaniere List avec le filtre appliqué
                        PAGE.RunModal(PAGE::"NomenclatureDouaniereList", NomenclatureDouaniereRec);
                    end else
                        Message('Le numéro de nomenclature Produit n''est pas trouvé pour cet article.');

                end;
            }
        }
    }
}
