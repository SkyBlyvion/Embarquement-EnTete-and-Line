pageextension 50278 ReservationEntryPage extends "Reservation Entries"
{
    Caption = 'Reservation Entry Custom';

    layout
    {
        addafter("Transferred from Entry No.")
        {

            field("NouveauNLigne"; Rec."NouveauNLigne")
            {
                ApplicationArea = All;
                ToolTip = 'Indique le numéro de la nouvelle ligne dans la réservation.';
            }
            field("Sélection transfert"; Rec."Sélection transfert")
            {
                ApplicationArea = All;
                ToolTip = 'Sélectionne cette option pour marquer la ligne pour le transfert.';
            }
            field("No. embarquement"; Rec."No. embarquement")
            {
                ApplicationArea = All;
                ToolTip = 'Affiche le numéro d''embarquement associé à cette réservation.';
            }
            field("No. ligne embarquement"; Rec."No. ligne embarquement")
            {
                ApplicationArea = All;
                ToolTip = 'Affiche le numéro de la ligne d''embarquement associé à cette réservation.';
            }
            field("Ecriture bloquée"; Rec."Ecriture bloquée")
            {
                ApplicationArea = All;
                ToolTip = 'Indique si l''écriture de cette réservation est bloquée.';
            }
        }
    }
}

