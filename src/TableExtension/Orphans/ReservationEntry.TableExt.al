tableextension 50239 "ReservationEntry" extends "Reservation Entry"
{
    fields
    {
        field(50000; "NouveauNLigne"; Integer)
        {
            Caption = 'NouveauNLigne';
            Description = 'RESERVATION - REVIMPORT - 11/09/24';
            Editable = true;
        }
        field(50001; "Sélection transfert"; Boolean)
        {
            Caption = 'Sélection transfert';
            Description = 'RESERVATION - REVIMPORT - 11/09/24';
            Editable = true;
        }
        field(50002; "No embarquement"; Code[10])
        {
            Caption = 'No embarquement';
            Description = 'EMBARQUEMENT - REVIMPORT - 10/09/24';
            Editable = false;
        }
        field(50003; "No ligne embarquement"; Integer)
        {
            Caption = 'No ligne embarquement';
            Description = 'EMBARQUEMENT - REVIMPORT - 10/09/24';
            Editable = false;
        }
        field(50004; "Ecriture bloquée"; Boolean)
        {
            Caption = 'Ecriture bloquée';
            Description = 'RESERVATION - REVIMPORT - 11/09/24';
            Editable = true;
        }

    }


}

