page 50262 EnTeteEmbarquemen
{
    ApplicationArea = All;
    Caption = 'EnTeteEmbrq';
    PageType = List;
    Editable = true;
    SourceTable = EnTeteEmbarquement;

    layout
    {
        area(Content)
        {
            repeater(General)
            {
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
                field("Nom du preneur d'ordre"; Rec."Nom du preneur d'ordre")
                {
                    ToolTip = 'Affiche le nom du preneur d''ordre (fournisseur).';
                }
                field("Adresse preneur d'ordre"; Rec."Adresse preneur d'ordre")
                {
                    ToolTip = 'Affiche la première ligne de l''adresse du preneur d''ordre.';
                }
                field("Adresse preneur d'ordre 2"; Rec."Adresse preneur d'ordre 2")
                {
                    ToolTip = 'Affiche la deuxième ligne de l''adresse du preneur d''ordre.';
                }
                field("Adresse preneur d'ordre 3"; Rec."Adresse preneur d'ordre 3")
                {
                    ToolTip = 'Affiche la troisième ligne de l''adresse du preneur d''ordre.';
                }
                field("Ville preneur d'ordre"; Rec."Ville preneur d'ordre")
                {
                    ToolTip = 'Affiche la ville du preneur d''ordre.';
                }
                field("Contact preneur d'ordre"; Rec."Contact preneur d'ordre")
                {
                    ToolTip = 'Affiche les informations de contact du preneur d''ordre.';
                }
                field("Code postal preneur d'ordre"; Rec."Code postal preneur d'ordre")
                {
                    ToolTip = 'Affiche le code postal du preneur d''ordre.';
                }
                field("Code pays preneur d'ordre"; Rec."Code pays preneur d'ordre")
                {
                    ToolTip = 'Affiche le code pays du preneur d''ordre.';
                }
                field("Souches de No."; Rec."Souches de No.")
                {
                    ToolTip = 'Indique la souche de numéro utilisée pour l''embarquement.';
                }
            }
        }
    }
}
