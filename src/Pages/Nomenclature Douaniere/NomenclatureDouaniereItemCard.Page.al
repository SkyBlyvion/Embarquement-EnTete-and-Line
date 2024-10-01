page 50295 "NomenclatureDouaniereItemCard"
{
    PageType = Card;
    ApplicationArea = All;
    SourceTable = "NomenclatureDouaniere";
    Caption = 'Fiche Nomenclature Douanière';

    layout
    {
        area(Content)
        {
            group(General)
            {
                Caption = 'Général';

                field("N° nomenclature douanière"; Rec."No. nomenclature douanière")
                {
                    ApplicationArea = All;
                    ToolTip = 'Entrez le numéro de nomenclature douanière.';
                }

                field("Code pays origine"; Rec."Code pays origine")
                {
                    ApplicationArea = All;
                    ToolTip = 'Sélectionnez le code du pays d\''origine.';
                }

                field("Taux réduit douane"; Rec."Taux réduit douane")
                {
                    ApplicationArea = All;
                    ToolTip = 'Entrez le taux réduit de douane applicable.';
                }

                field("Licence"; Rec."Licence")
                {
                    ApplicationArea = All;
                    ToolTip = 'Indiquez si une licence est requise.';
                }

                field("Document surveillance"; Rec."Document surveillance")
                {
                    ApplicationArea = All;
                    ToolTip = 'Indiquez si un document de surveillance est requis.';
                }
            }
        }
    }

    actions
    {
        area(Processing)
        {
            action(SaveRecord)
            {
                Caption = 'Enregistrer';
                ToolTip = 'Enregistrer les informations de la nomenclature douanière.';
                ApplicationArea = All;

                trigger OnAction()
                begin
                    // Code pour sauvegarder l'enregistrement
                    Rec.Modify(true);
                    Message('Enregistrement sauvegardé avec succès.');
                end;
            }
        }
    }


}
