tableextension 50239 "ReservationEntry" extends "Reservation Entry"
{
    fields
    {
        field(50000; "NouveauNLigne"; Integer)
        {
            Caption = 'NouveauNLigne';
            Description = 'RESERVATION - LN - 11/09/24';
            Editable = true;
            BlankNumbers = DontBlank;
        }
        field(50001; "Sélection transfert"; Boolean)
        {
            Caption = 'Sélection transfert';
            Description = 'RESERVATION - LN - 11/09/24';
            Editable = true;
            BlankNumbers = DontBlank;
        }
        field(50002; "No. embarquement"; Code[10])
        {
            Caption = 'No. embarquement';
            Description = 'EMBARQUEMENT - LN - 10/09/24';
            Editable = false;
        }
        field(50003; "No. ligne embarquement"; Integer)
        {
            Caption = 'No. ligne embarquement';
            Description = 'EMBARQUEMENT - LN - 10/09/24';
            Editable = false;
            BlankNumbers = DontBlank;
        }
        field(50004; "Ecriture bloquée"; Boolean)
        {
            Caption = 'Ecriture bloquée';
            Description = 'RESERVATION - LN - 11/09/24';
            Editable = true;
            BlankNumbers = DontBlank;
        }

    }


}

