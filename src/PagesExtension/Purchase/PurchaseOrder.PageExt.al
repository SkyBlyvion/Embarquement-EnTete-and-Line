pageextension 50286 "PurchaseOrder" extends "Purchase Order"
{
    layout
    {
        addbefore("Invoice Details") // Adds layout at the end of the Processing group
        {
            group("Frais liés au calcul du PRT")
            {
                // Add your layout here
                field("Code transport routier"; Rec."Code transport routier")
                {
                    ApplicationArea = All;
                    ToolTip = 'Saisissez le code du transporteur routier.';
                }
                field("Montant transport routier"; Rec."Montant transport routier")
                {
                    ApplicationArea = All;
                    ToolTip = 'Indiquez le montant total du transport routier.';
                }
                field("Code devise transport routier"; Rec."Code devise transport routier")
                {
                    ApplicationArea = All;
                    ToolTip = 'Saisissez le code de la devise utilisée pour le transport routier.';
                }
                field("Code transport maritime"; Rec."Code transport maritime")
                {
                    ApplicationArea = All;
                    ToolTip = 'Saisissez le code du transporteur maritime.';
                }
                field("Montant transport maritime"; Rec."Montant transport maritime")
                {
                    ApplicationArea = All;
                    ToolTip = 'Indiquez le montant total du transport maritime.';
                }
                field("Code devise transport maritime"; Rec."Code devise transport maritime")
                {
                    ApplicationArea = All;
                    ToolTip = 'Saisissez le code de la devise utilisée pour le transport maritime.';
                }
                field("Date d'embarquement prévue"; Rec."Date d'embarquement prévue")
                {
                    ApplicationArea = All;
                    ToolTip = 'Indiquez la date prévue pour l''embarquement des articles.';
                }
                field("Date disponibilité Perpignan"; Rec."Date disponibilité Perpignan") // Date de rangement
                {
                    ApplicationArea = All;
                    ToolTip = 'Indiquez la date à laquelle les articles seront disponibles à Perpignan.';
                }
                field("Date de relance"; Rec."Date de relance")
                {
                    ApplicationArea = All;
                    ToolTip = 'Définissez la date de relance pour cette commande.';
                }
                field("% de frais financier"; Rec."% de frais financier")
                {
                    ApplicationArea = All;
                    ToolTip = 'Indiquez le pourcentage des frais financiers appliqués.';
                }
                field("% Assurances"; Rec."% Assurances")
                {
                    ApplicationArea = All;
                    ToolTip = 'Indiquez le pourcentage des assurances appliquées.';
                }
                field("% Commissions"; Rec."% Commissions")
                {
                    ApplicationArea = All;
                    ToolTip = 'Indiquez le pourcentage des commissions appliquées.';
                }
                field("% Transit"; Rec."% Transit")
                {
                    ApplicationArea = All;
                    ToolTip = 'Indiquez le pourcentage des frais de transit appliqués.';
                }
                field("PRT Calculé"; Rec."PRT Calculé")
                {
                    ApplicationArea = All;
                    ToolTip = 'Indiquez si le PRT a été calculé pour cette commande.';
                }
                field("Date calcul PRT"; Rec."Date calcul PRT")
                {
                    ApplicationArea = All;
                    ToolTip = 'Indiquez la date à laquelle le PRT a été calculé.';
                }
                field("Heure calcul PRT"; Rec."Heure calcul PRT")
                {
                    ApplicationArea = All;
                    ToolTip = 'Indiquez l''heure à laquelle le PRT a été calculé.';
                }
                // field("Currency code"; Rec."Currency code") // Already defined in PurchaseHeader
                // {
                //     ApplicationArea = All;
                //     ToolTip = 'Saisissez le code de la devise de la commande.';
                // }
                field("Volume"; Rec."Volume")
                {
                    ApplicationArea = All;
                    ToolTip = 'Indiquez le volume total des articles.';
                }
                field("Poids"; Rec."Poids")
                {
                    ApplicationArea = All;
                    ToolTip = 'Indiquez le poids total des articles.';
                }

            }
        }
    }
    actions
    {
        addlast(processing) // Adds actions at the end of the Processing group
        {
            action("Calculer PRT")
            {
                Caption = 'Calculer PRT';
                ToolTip = 'Calcule le Prix de Revient Théorique.';
                ApplicationArea = All;
                Image = Calculate;

                trigger OnAction()
                var
                    CalculerPR: Codeunit "CalculerPR"; // Declare the codeunit instance
                begin
                    // Directly call the procedure from CalculerPR codeunit
                    CalculerPR.CalculerPRTDocVente(Rec."No.");
                end;
            }
            action("Reviser TG/PRT")
            {
                Caption = 'Reviser TG/PRT';
                ToolTip = 'Réviser le Tarif Global ou le PRT.';
                ApplicationArea = All;
                Image = Calculate;

                trigger OnAction()
                var
                    ReviserPR: Codeunit "CalculerPR"; // Declare the codeunit instance
                begin
                    // Directly call the procedure from CalculerPR codeunit
                    //ReviserPR.MAJFicheTarif();
                end;
            }
        }
    }
}
