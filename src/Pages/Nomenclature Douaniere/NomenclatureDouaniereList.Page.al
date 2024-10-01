page 50294 "NomenclatureDouaniereList"
{
    PageType = List;
    ApplicationArea = All;
    SourceTable = "NomenclatureDouaniere";
    Caption = 'Historique des Nomenclatures Douanières';

    layout
    {
        area(Content)
        {
            repeater(Group)
            {
                field("N° nomenclature douanière"; Rec."No. nomenclature douanière")
                {
                    ApplicationArea = All;
                    ToolTip = 'Numéro de nomenclature douanière pour cet enregistrement.';
                }

                field("Code pays origine"; Rec."Code pays origine")
                {
                    ApplicationArea = All;
                    ToolTip = 'Code du pays d''origine pour cet enregistrement.';
                }

                field("Taux réduit douane"; Rec."Taux réduit douane")
                {
                    ApplicationArea = All;
                    ToolTip = 'Taux réduit de douane appliqué pour cet enregistrement.';
                }

                field("Licence"; Rec."Licence")
                {
                    ApplicationArea = All;
                    ToolTip = 'Indique si une licence est requise pour cet enregistrement.';
                }

                field("Document surveillance"; Rec."Document surveillance")
                {
                    ApplicationArea = All;
                    ToolTip = 'Indique si un document de surveillance est requis pour cet enregistrement.';
                }

            }
        }
    }

    trigger OnOpenPage()
    var

    begin


    end;




}
