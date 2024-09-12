tableextension 50241 PurchaseLineCustom extends "Purchase Line" // Line sans s est la table
{
    fields
    {
        field(50000; "N° dossier"; Code[10])
        {
            DataClassification = EndUserIdentifiableInformation;
            Caption = 'N° dossier';
            Description = 'DOSSIER_ARRIVAGE LN 12/09/24 REV24';
            Editable = false;
        }
        field(50001; "Date d'embarquement prévue"; Date)
        {
            DataClassification = SystemMetadata;
            Caption = 'Date d''embarquement prévue';
        }
        field(50002; "Coût unitaire (Pièce)"; Decimal)
        {
            DataClassification = AccountData;
            Caption = 'Coût unitaire (Pièce)';
        }
        field(50003; "Date de relance"; Date)
        {
            DataClassification = SystemMetadata;
            Caption = 'Date de relance';
        }
        field(50004; "Qté à embarquer"; Decimal)
        {
            DataClassification = AccountData;
            Caption = 'Quantité à embarquer';
        }
        field(50005; "Qté à embarquer (Pièce)"; Decimal)
        {
            DataClassification = AccountData;
            Caption = 'Quantité à embarquer (Pièce)';
        }
        field(50006; "Qté embarquée"; Decimal)
        {
            DataClassification = AccountData;
            Caption = 'Quantité embarquée';
        }
        field(50007; "Qté embarquée (Pièce)"; Decimal)
        {
            DataClassification = AccountData;
            Caption = 'Quantité embarquée (Pièce)';
        }
        field(50008; "Volume (unitaire)"; Decimal)
        {
            DataClassification = AccountData;
            Caption = 'Volume unitaire';
        }
        field(50009; "Volume"; Decimal)
        {
            DataClassification = AccountData;
            Caption = 'Volume total';
        }
        field(50010; "Poids (unitaire)"; Decimal)
        {
            DataClassification = AccountData;
            Caption = 'Poids unitaire';
        }
        field(50011; "Poids"; Decimal)
        {
            DataClassification = AccountData;
            Caption = 'Poids total';
        }
        field(50012; "TEC"; Decimal)
        {
            DataClassification = AccountData;
            Caption = 'TEC';
        }
        field(50013; "Incoterm"; Option)
        {
            OptionMembers = EXW,FOB,CNI,CFR,CIF;
            DataClassification = SystemMetadata;
            Caption = 'Incoterm';
        }
        field(50014; "Quantité/Conditionnement"; Integer)
        {
            DataClassification = SystemMetadata;
            Caption = 'Quantité/Conditionnement';
        }
        field(50016; "N° conteneur"; Text[30])
        {
            DataClassification = EndUserIdentifiableInformation;
            Caption = 'N° conteneur';
        }
        field(50017; "Taxe anti-dumping"; Decimal)
        {
            DataClassification = AccountData;
            Caption = 'Taxe anti-dumping';
        }

    }

    //TODO: Add triggers ( 3800 lignes à Refactoriser )

    // Procedure MajQte ( a créer ?!) Biensur que non c'est dans le C/AL Editor, +3800 lignes de la table Purchase Line depuis NAV, Bonne CHANCE !
    procedure MajQte(var LigAch: Record "Purchase Line")
    begin
        Rec.Copy(LigAch);           // Copy the record into Rec (current instance)
        CustomInitQtyToReceive();         // Recalculate the quantity to receive
        InitQteAEmbarquer();        // Recalculate the quantity to ship
        Modify();                   // Save the changes to the database
    end;

    procedure InitQteAEmbarquer()
    begin
        // Calculate fields "Qté embarquée" and "Qté embarquée (Pièce)"
        CalcFields("Qté embarquée", "Qté embarquée (Pièce)");

        // Update the quantity to ship
        "Qté à embarquer" := "Outstanding Quantity" - "Qté embarquée";
        "Qté à embarquer (Pièce)" := "Outstanding Qty. (Base)" - "Qté embarquée (Pièce)";
    end;

    procedure CustomInitQtyToReceive()// Procedure NAtive est InitQtyToReceive
    begin
        // Calculate fields "Qté embarquée" and "Qté embarquée (Pièce)"
        CalcFields("Qté embarquée", "Qté embarquée (Pièce)");

        // Update the quantity to receive
        "Qty. to Receive" := "Outstanding Quantity" - "Qté embarquée";
        "Qty. to Receive (Base)" := "Outstanding Qty. (Base)" - "Qté embarquée (Pièce)";

        InitQtyToInvoice();  // Assuming this function handles the quantities to invoice natively.
    end;




}
