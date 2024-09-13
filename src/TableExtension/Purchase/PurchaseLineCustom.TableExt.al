tableextension 50241 "PurchaseLineCustom" extends "Purchase Line" // Line sans s est la table
{
    fields
    {
        field(50000; "No. Dossier"; Code[10])
        {
            DataClassification = EndUserIdentifiableInformation;
            Caption = 'No. dossier';
            Description = 'DOSSIER_ARRIVAGE LN 12/09/24 REV24';
            Editable = false;
        }
        field(50001; "Date d'embarquement prévue"; Date)
        {
            DataClassification = SystemMetadata;
            Caption = 'Date d''embarquement prévue';
            Description = 'EMBARQUEMENT LN 12/09/24 REV24';
            Editable = true;
        }
        field(50002; "Coût unitaire (Pièce)"; Decimal)
        {
            DataClassification = AccountData;
            Caption = 'Coût unitaire (Pièce)';
            Description = 'LIGNE_ACHAT LN 12/09/24 REV24';
            Editable = true;
        }
        field(50003; "Date de relance"; Date)
        {
            DataClassification = SystemMetadata;
            Caption = 'Date de relance';
            Description = 'LIGNE_ACHAT LN 12/09/24 REV24';
            Editable = true;
        }
        field(50004; "Qté à embarquer"; Decimal)
        {
            DataClassification = AccountData;
            Caption = 'Quantité à embarquer';
            Description = 'EMBARQUEMENT LN 12/09/24 REV24';
            Editable = true;
        }
        field(50005; "Qté à embarquer (Pièce)"; Decimal)
        {
            DataClassification = AccountData;
            Caption = 'Quantité à embarquer (Pièce)';
            Description = 'EMBARQUEMENT LN 12/09/24 REV24';
            Editable = true;
        }
        field(50006; "Qté embarquée"; Decimal)
        {
            Caption = 'Quantité embarquée';
            Description = 'EMBARQUEMENT LN 12/09/24 REV24';
            FieldClass = FlowField;
            Editable = false;
            CalcFormula = Sum("Ligneembarquement"."Quantité"
                            WHERE("No. preneur d'ordre" = FIELD("Buy-from Vendor No."),
                            "No. commande achat" = FIELD("Document No."),
                            "No. ligne commande achat" = FIELD("Line No."),
                            "No. Article" = FIELD("No.")));
        }
        field(50007; "Qté embarquée (Pièce)"; Decimal)
        {
            Caption = 'Quantité embarquée (Pièce)';
            Description = 'EMBARQUEMENT LN 12/09/24 REV24';
            Editable = false;
            FieldClass = FlowField;
            CalcFormula = Sum("Ligneembarquement"."Quantité (Pièce)"
                            WHERE("No. preneur d'ordre" = FIELD("Buy-from Vendor No."),
                            "No. commande achat" = FIELD("Document No."),
                            "No. ligne commande achat" = FIELD("Line No."),
                            "No. Article" = FIELD("No.")));
        }
        field(50008; "Volume (unitaire)"; Decimal)
        {
            DataClassification = AccountData;
            Caption = 'Volume unitaire';
            Description = 'VOLUME_POIDS LN 12/09/24 REV24';
            Editable = true;
        }
        field(50009; "Volume"; Decimal)
        {
            DataClassification = AccountData;
            Caption = 'Volume total';
            Description = 'VOLUME_POIDS LN 12/09/24 REV24';
            Editable = true;
        }
        field(50010; "Poids (unitaire)"; Decimal)
        {
            DataClassification = AccountData;
            Caption = 'Poids unitaire';
            Description = 'VOLUME_POIDS LN 12/09/24 REV24';
            Editable = true;
        }
        field(50011; "Poids"; Decimal)
        {
            DataClassification = AccountData;
            Caption = 'Poids total';
            Description = 'VOLUME_POIDS LN 12/09/24 REV24';
            Editable = true;
        }
        field(50012; "TEC"; Decimal)
        {
            DataClassification = AccountData;
            Caption = 'TEC';
            Description = 'LIGNE_ACHAT LN 12/09/24 REV24';
            Editable = true;
        }
        field(50013; "Incoterm"; Option)
        {
            OptionMembers = EXW,FOB,CNI,CFR,CIF;
            DataClassification = SystemMetadata;
            Caption = 'Incoterm';
            Description = 'INCOTERM LN 12/09/24 REV24';
            Editable = true;
        }
        field(50014; "Quantité/Conditionnement"; Integer)
        {
            DataClassification = SystemMetadata;
            Caption = 'Quantité/Conditionnement';
            Description = 'LIGNE_ACHAT LN 12/09/24 REV24';
            Editable = true;
        }
        field(50015; "Qté réserv sur embarq (pièce)"; Decimal)
        {
            Caption = 'Quantité réserv sur embarq (pièce)';
            Description = 'EMBARQUEMENT LN 12/09/24 REV24';
            Editable = false;
            FieldClass = FlowField;
            CalcFormula = Sum("Ligneembarquement"."Quantité réservée (Pièce)"
                            WHERE("No. preneur d'ordre" = FIELD("Buy-from Vendor No."),
                            "No. commande achat" = FIELD("Document No."),
                            "No. ligne commande achat" = FIELD("Line No.")));


        }
        field(50016; "No. conteneur"; Text[30])
        {
            DataClassification = EndUserIdentifiableInformation;
            Caption = 'No. conteneur';
            Description = 'EMBARQUEMENT LN 12/09/24 REV24';
            Editable = true;
        }
        field(50017; "Taxe anti-dumping"; Decimal)
        {
            DataClassification = AccountData;
            Caption = 'Taxe anti-dumping';
            Description = ' LN 12/09/24 REV24';
            Editable = true;
        }

    }

    // A trier et a modifier
    /*Enabled	Key	SumIndexFields
    Yes	 Document Type,Document No.,Line No.	Amount,Amount Including VAT,Outstanding Quantity,Line Amount
    Yes	 Document Type,Type,No.,Variant Code,Drop Shipment,Location Code,Expected Receipt Date	Outstanding Qty. (Base)
    Yes	 Document Type,Pay-to Vendor No.,Currency Code	Outstanding Amount,Amt. Rcd. Not Invoiced,Outstanding Amount (LCY),Amt. Rcd. Not Invoiced (LCY)
    No	 Document Type,Type,No.,Variant Code,Drop Shipment,Shortcut Dimension 1 Code,Shortcut Dimension 2 Code,Location Code,Expected Receipt Date	Outstanding Qty. (Base)
    No	 Document Type,Pay-to Vendor No.,Shortcut Dimension 1 Code,Shortcut Dimension 2 Code,Currency Code	Outstanding Amount,Amt. Rcd. Not Invoiced,Outstanding Amount (LCY),Amt. Rcd. Not Invoiced (LCY)
    Yes	 Document Type,Blanket Order No.,Blanket Order Line No.	
    Yes	 Document Type,Type,Prod. Order No.,Prod. Order Line No.,Routing No.,Operation No.	
    Yes	 Document Type,Document No.,Location Code	
    Yes	 Document Type,Receipt No.,Receipt Line No.	
    Yes	 Type,No.,Variant Code,Drop Shipment,Location Code,Document Type,Expected Receipt Date	
    Yes	 Document Type,Buy-from Vendor No.,Document No.	Volume,Poids
    Yes	 Document Type,Type,No.,Variant Code,Date d'embarquement prévue	Quantity
    Yes	 Document Type,Type,Outstanding Quantity,Buy-from Vendor No.	
    Yes	 Document Type,Type,No.,Variant Code,Drop Shipment,Location Code,Bin Code,Expected Receipt Date	*/

    //TODO: Add triggers ( 3800 lignes à Refactoriser ? Non, seulements les Customisations)

    // Procedure MajQte 
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
