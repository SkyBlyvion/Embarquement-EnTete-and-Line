page 50244 "HistoriquePRRPage"
{
    PageType = List;
    ApplicationArea = All;
    SourceTable = "HistoriquePRRTable";
    Editable = true;
    Caption = 'Historique PRR';

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("No. calcul"; Rec."No. calcul")
                {
                    ApplicationArea = All;
                    ToolTip = 'Numéro de calcul associé au PRR.';
                }
                field("No. article"; Rec."No. article")
                {
                    ApplicationArea = All;
                    ToolTip = 'Numéro de l''article associé au PRR.';
                }
                field("Date"; Rec."Date")
                {
                    ApplicationArea = All;
                    ToolTip = 'Date du calcul du PRR.';
                }
                field("Heure"; Rec."Heure")
                {
                    ApplicationArea = All;
                    ToolTip = 'Heure du calcul du PRR.';
                }
                field("Définitif"; Rec."Définitif")
                {
                    ApplicationArea = All;
                    ToolTip = 'Indique si le calcul est définitif.';
                }
                field("No. fournisseur"; Rec."No. fournisseur")
                {
                    ApplicationArea = All;
                    ToolTip = 'Numéro du fournisseur associé.';
                }
                field("No. réception"; Rec."No. réception")
                {
                    ApplicationArea = All;
                    ToolTip = 'Numéro de la réception.';
                }
                field("Incoterm"; Rec."Incoterm")
                {
                    ApplicationArea = All;
                    ToolTip = 'Indique l''incoterm utilisé pour cet article.';
                }
                field("Mnt affecté total / avis"; Rec."Mnt affecté total / avis")
                {
                    ApplicationArea = All;
                    ToolTip = 'Montant affecté total selon l''avis.';
                }
                field("Mnt affecté total / prest"; Rec."Mnt affecté total / prest")
                {
                    ApplicationArea = All;
                    ToolTip = 'Montant affecté total selon le prestataire.';
                }
                field("Eléments estimés"; Rec."Eléments estimés")
                {
                    ApplicationArea = All;
                    ToolTip = 'Eléments estimés pour cet article.';
                }
                field("Mnt affecté total déduction"; Rec."Mnt affecté total déduction")
                {
                    ApplicationArea = All;
                    ToolTip = 'Montant affecté après déduction.';
                }
                field("Volume dossier"; Rec."Volume dossier")
                {
                    ApplicationArea = All;
                    ToolTip = 'Volume total du dossier.';
                }
                field("No. dossier"; Rec."No. dossier")
                {
                    ApplicationArea = All;
                    ToolTip = 'Numéro du dossier associé.';
                }
                field("No. ligne dossier"; Rec."No. ligne dossier")
                {
                    ApplicationArea = All;
                    ToolTip = 'Numéro de la ligne du dossier associé.';
                }
                field("Quantité"; Rec."Quantité")
                {
                    ApplicationArea = All;
                    ToolTip = 'Quantité achetée.';
                }
                field("Prix achat (dev soc)"; Rec."Prix achat (dev soc)")
                {
                    ApplicationArea = All;
                    ToolTip = 'Prix d''achat dans la devise de la société.';
                }
                field("Montant (dev soc)"; Rec."Montant (dev soc)")
                {
                    ApplicationArea = All;
                    ToolTip = 'Montant total dans la devise de la société.';
                }
                field("Volume"; Rec."Volume")
                {
                    ApplicationArea = All;
                    ToolTip = 'Volume total de l''article.';
                }
                field("% remise moyen"; Rec."% remise moyen")
                {
                    ApplicationArea = All;
                    ToolTip = 'Pourcentage moyen de remise.';
                }
                field("% avoir qualité"; Rec."% avoir qualité")
                {
                    ApplicationArea = All;
                    ToolTip = 'Pourcentage d''avoir de qualité.';
                }
                field("% escompte"; Rec."% escompte")
                {
                    ApplicationArea = All;
                    ToolTip = 'Pourcentage d''escompte appliqué.';
                }
                field("PRR"; Rec."PRR")
                {
                    ApplicationArea = All;
                    ToolTip = 'Prix de revient réel (PRR).';
                }
                field("Code devise"; Rec."Code devise")
                {
                    ApplicationArea = All;
                    ToolTip = 'Code de la devise utilisée.';
                }
                field("Facteur devise"; Rec."Facteur devise")
                {
                    ApplicationArea = All;
                    ToolTip = 'Facteur de conversion de la devise.';
                }
                field("Montant"; Rec."Montant")
                {
                    ApplicationArea = All;
                    ToolTip = 'Montant total après calcul.';
                }
                field("Code credoc Avis source"; Rec."Code credoc Avis source")
                {
                    ApplicationArea = All;
                    ToolTip = 'Code credoc provenant de l''avis source.';
                }
                field("No. ligne Avis source"; Rec."No. ligne Avis source")
                {
                    ApplicationArea = All;
                    ToolTip = 'Numéro de ligne dans l''avis source.';
                }
                field("Date création Dossier"; Rec."Date creation Dossier")
                {
                    ApplicationArea = All;
                    ToolTip = 'Date de création du dossier.';
                }
                field("Cout unitaire direct"; Rec."Cout unitaire direct")
                {
                    ApplicationArea = All;
                    ToolTip = 'Coût unitaire direct.';
                }
            }
        }
    }


}
