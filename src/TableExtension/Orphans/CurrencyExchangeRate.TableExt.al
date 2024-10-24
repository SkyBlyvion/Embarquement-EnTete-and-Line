tableextension 50303 "CurrencyExchangeRate" extends "Currency Exchange Rate"
{
    fields
    {
        // Add changes to table fields here
    }

    keys
    {
        // Add changes to keys here
    }

    fieldgroups
    {
        // Add changes to field groups here
    }

    var



    procedure MntChangeDevVersDev2(Date: Date; DeCodeDevise: Code[10]; VersCodeDevise: Code[10]; Montant: Decimal; TypeMnt: Integer): Decimal
    var
        Devises: Record "Currency";
        ParamCompta: Record "General Ledger Setup";
        Mnt: Decimal;
        Text000: Text;
        TextCONVERSION01: Text;
        TextCONVERSION02: Text;
    begin

        Text000 := 'Les codes devise des champs %1 et %2 ne peuvent pas être identiques.';
        TextCONVERSION01 := 'Le type du montant à convertir doit être supérieur à %1 et inférieur à %2.';
        TextCONVERSION02 := 'La devise % 1 n''existe pas.';
        //CONVERSION PC 18/02/00 NSC2.15
        //*Si la variable TypeMnt = 1 c'est le champ "Précis. arrondi montant unité" qui est pris en compte pour faire l'arrondi.
        //*Si la variable TypeMnt = 2 c'est le champ "Précision arrondi montant" qui est pris en compte pour faire l'arrondi.

        IF (TypeMnt < 1) OR (TypeMnt > 2) THEN
            ERROR(TextCONVERSION01, 1, 2);

        Mnt := ExchangeAmtFCYToFCY(Date, DeCodeDevise, VersCodeDevise, Montant);

        IF Devises.GET(VersCodeDevise) THEN BEGIN

            IF TypeMnt = 1 THEN
                Mnt := ROUND(Mnt, Devises."Unit-Amount Rounding Precision");
            IF TypeMnt = 2 THEN
                Mnt := ROUND(Mnt, Devises."Amount Rounding Precision");

        END ELSE
            IF VersCodeDevise = '' THEN BEGIN

                ParamCompta.GET();

                IF TypeMnt = 1 THEN
                    Mnt := ROUND(Mnt, ParamCompta."Unit-Amount Rounding Precision");

                IF TypeMnt = 2 THEN
                    Mnt := ROUND(Mnt, ParamCompta."Amount Rounding Precision");

            END ELSE
                ERROR(TextCONVERSION02, VersCodeDevise);

        EXIT(Mnt);
        //Fin CONVERSION PC 18/02/00 NSC2.15

    end;


}