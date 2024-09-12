pageextension 50242 "PurchaseHeaderPageExt" extends "Purchase List"
{
    layout
    {
        addafter("Assigned User ID")
        {

            field("No. Dossier"; Rec."No. Dossier")
            {
                ApplicationArea = All;
                ToolTip = 'Entrez le numéro de dossier associé à cette commande.';
            }
            field("Date disponibilité Perpignan"; Rec."Date disponibilité Perpignan")
            {
                ApplicationArea = All;
                ToolTip = 'Indiquez la date à laquelle les articles seront disponibles à Perpignan.';
            }
            field("Date d'embarquement prévue"; Rec."Date d'embarquement prévue")
            {
                ApplicationArea = All;
                ToolTip = 'Indiquez la date prévue pour l''embarquement des articles.';
            }
            field("Incoterm"; Rec."Incoterm")
            {
                ApplicationArea = All;
                ToolTip = 'Sélectionnez l''Incoterm applicable pour cette transaction.';
            }
            field("Gencodage"; Rec."Gencodage")
            {
                ApplicationArea = All;
                ToolTip = 'Indiquez si le gencodage est applicable.';
            }
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
            field("Facteur devise transp. routier"; Rec."Facteur devise transp. routier")
            {
                ApplicationArea = All;
                ToolTip = 'Indiquez le facteur de conversion de la devise pour le transport routier.';
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
            field("Facteur devise transp. maritim"; Rec."Facteur devise transp. maritim")
            {
                ApplicationArea = All;
                ToolTip = 'Indiquez le facteur de conversion de la devise pour le transport maritime.';
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
            field("Date de relance"; Rec."Date de relance")
            {
                ApplicationArea = All;
                ToolTip = 'Définissez la date de relance pour cette commande.';
            }
            field("PRT Calculé"; Rec."PRT Calculé")
            {
                ApplicationArea = All;
                ToolTip = 'Indiquez si le PRT a été calculé pour cette commande.';
            }
            field("Maj Réservation Vente"; Rec."Maj Réservation Vente")
            {
                ApplicationArea = All;
                ToolTip = 'Indiquez si la réservation de la vente a été mise à jour.';
            }
            field("No. commande portable"; Rec."No. commande portable")
            {
                ApplicationArea = All;
                ToolTip = 'Entrez le numéro de commande portable associé.';
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
            field("Commande REV'GARDEN"; Rec."Commande REV'GARDEN")
            {
                ApplicationArea = All;
                ToolTip = 'Indiquez si cette commande est une commande REV''GARDEN.';
            }
            field("Total Outstanding Quantity"; Rec."Total Outstanding Quantity")
            {
                ApplicationArea = All;
                ToolTip = 'Saisissez la quantité totale en attente pour cette commande.';
            }

        }
    }
}
