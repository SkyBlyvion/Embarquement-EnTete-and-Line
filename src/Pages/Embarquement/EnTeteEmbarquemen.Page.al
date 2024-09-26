page 50262 EnTeteEmbarquemen
{
    PageType = List;
    SourceTable = EnTeteEmbarquement;
    ApplicationArea = All;
    Caption = 'Embarquements';
    Editable = false;
    RefreshOnActivate = true;

    layout
    {
        area(Content)
        {
            repeater(General)
            {
                ShowCaption = false;
                field("No. embarquement"; Rec."No. embarquement")
                {
                    ToolTip = 'Indique le numéro unique associé à l''embarquement.';
                }
                field("No. preneur d'ordre"; Rec."No. preneur d'ordre")
                {
                    ToolTip = 'Indique le numéro du preneur d''ordre (fournisseur).';
                }
                field("Date embarquement"; Rec."Date embarquement")
                {
                    ToolTip = 'Indique la date de l''embarquement des marchandises.';
                }
                field("Date réception prévue"; Rec."Date réception prévue")
                {
                    ToolTip = 'Indique la date estimée de réception des marchandises.';
                }
                field("Souches de No."; Rec."Souches de No.")
                {
                    ToolTip = 'Indique la souche de numéro utilisée pour l''embarquement.';
                }
            }
        }
    }
    actions
    {
        area(Creation)
        {
            // Ajoutez des actions ici si besoin
            action("NewEmbarquement")
            {
                Caption = 'Nouvel embarquement';
                ApplicationArea = All;
                ToolTip = 'Nouvel embarquement';
                trigger OnAction()
                begin
                    PAGE.RUN(PAGE::"EmbarquementDoc", Rec);
                end;
            }
        }
    }
}
