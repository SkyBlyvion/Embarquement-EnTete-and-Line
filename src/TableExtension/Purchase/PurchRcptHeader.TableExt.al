tableextension 50292 PurchRcptHeader extends "Purch. Rcpt. Header"
{
    fields
    {
        field(50000; "No. dossier"; Code[10])
        {
            Caption = 'No. dossier';
            Description = 'DOSSIER_ARRIVAGE LN 04/10/24 REV24';
            DataClassification = CustomerContent;
        }
        field(50001; "Date disponibilité Perpignan"; Date)
        {
            Caption = 'Date disponibilité Perpignan';
            Description = 'ENTETE_RECEPTION_ACHAT LN 04/10/24 REV24';
            DataClassification = CustomerContent;
            BlankNumbers = DontBlank;
        }
        field(50002; "Date d'embarquement"; Date)
        {
            Caption = 'Date d''embarquement';
            Description = 'EMBARQUEMENT LN 04/10/24 REV24';
            DataClassification = CustomerContent;
            BlankNumbers = DontBlank;
        }
        field(50003; "No. commande fournisseur"; Code[20])
        {
            Caption = 'No. commande fournisseur';
            Description = 'ENTETE_RECEPTION_ACHAT LN 04/10/24 REV24';
            DataClassification = CustomerContent;
        }
        field(50004; "Incoterm"; Option)
        {
            Caption = 'Incoterm';
            Description = 'GENDCODE_INCOTERM LN 04/10/24 REV24';
            DataClassification = CustomerContent;
            OptionMembers = EXW,FOB,CNI,CNF,CFR,CIF;
            BlankNumbers = DontBlank;
        }
        field(50005; "Gencodage"; Boolean)
        {
            Caption = 'Gencodage';
            Description = 'GENDCODE_INCOTERM LN 04/10/24 REV24';
            DataClassification = CustomerContent;
            BlankNumbers = DontBlank;
        }
        field(50006; "Volume"; Decimal)
        {
            Caption = 'Volume';
            Description = 'VOLUME_POIDS LN 04/10/24 REV24';
            FieldClass = FlowField;
            BlankNumbers = DontBlank;
            DecimalPlaces = 3 : 3;
            Editable = false;
            CalcFormula = sum("Purch. Rcpt. Line"."Volume" where("Buy-from Vendor No." = field("Buy-from Vendor No."), "Document No." = field("No.")));
        }
        field(50007; "Poids"; Decimal)
        {
            Caption = 'Poids';
            Description = 'VOLUME_POIDS LN 04/10/24 REV24';
            FieldClass = FlowField;
            BlankNumbers = DontBlank;
            DecimalPlaces = 3 : 3;
            Editable = false;
            CalcFormula = sum("Purch. Rcpt. Line"."Poids" where("Buy-from Vendor No." = field("Buy-from Vendor No."), "Document No." = field("No.")));
        }
        field(50010; "Code transport routier"; Code[10])
        {
            DataClassification = CustomerContent;
            Caption = 'Code transport routier';
            Description = 'ENTETE_RECEPTION_ACHAT LN 04/10/24 REV24';
            TableRelation = "Payment Terms"."Code";
        }
        field(50011; "Montant transport routier"; Decimal)
        {
            DataClassification = CustomerContent;
            Caption = 'Montant transport routier';
            Description = 'ENTETE_RECEPTION_ACHAT LN 04/10/24 REV24';
            BlankNumbers = DontBlank;
            AutoFormatType = 1;
        }
        field(50012; "Code devise transp. rout."; Code[10])
        {
            DataClassification = CustomerContent;
            Caption = 'Code devise transport routier';
            Description = 'ENTETE_RECEPTION_ACHAT LN 04/10/24 REV24';
            TableRelation = Currency."Code";
        }
        field(50013; "Facteur devise transp. rout."; Decimal)
        {
            DataClassification = CustomerContent;
            Caption = 'Facteur devise transport routier';
            Description = 'ENTETE_RECEPTION_ACHAT LN 04/10/24 REV24';
            MinValue = 0;
            BlankNumbers = DontBlank;
            DecimalPlaces = 0 : 15;
            Editable = false;
        }
        field(50014; "Code transport maritime"; Code[10])
        {
            DataClassification = CustomerContent;
            Caption = 'Code transport maritime';
            Description = 'ENTETE_RECEPTION_ACHAT LN 04/10/24 REV24';
            TableRelation = Currency."Code";
        }
        field(50015; "Montant transport maritime"; Decimal)
        {
            DataClassification = CustomerContent;
            Caption = 'Montant transport maritime';
            Description = 'ENTETE_RECEPTION_ACHAT LN 04/10/24 REV24';
            BlankNumbers = DontBlank;
            AutoFormatType = 1;
        }
        field(50016; "Code devise transp. marit."; Code[10])
        {
            DataClassification = CustomerContent;
            Caption = 'Code devise transport maritime';
            Description = 'ENTETE_RECEPTION_ACHAT LN 04/10/24 REV24';
            TableRelation = Currency."Code";
        }
        field(50017; "Facteur devise transp. marit."; Decimal)
        {
            DataClassification = CustomerContent;
            Caption = 'Facteur devise transport maritime';
            Description = 'ENTETE_RECEPTION_ACHAT LN 04/10/24 REV24';
            MinValue = 0;
            BlankNumbers = DontBlank;
            DecimalPlaces = 0 : 15;
            Editable = false;
        }
        field(50018; "% frais financiers"; Decimal)
        {
            DataClassification = CustomerContent;
            Caption = '% frais financiers';
            Description = 'ENTETE_RECEPTION_ACHAT LN 04/10/24 REV24';
            MinValue = 0;
            MaxValue = 100;
            BlankNumbers = DontBlank;
        }
        field(50019; "% assurances"; Decimal)
        {
            DataClassification = CustomerContent;
            Caption = '% assurances';
            Description = 'ENTETE_RECEPTION_ACHAT LN 04/10/24 REV24';
            MinValue = 0;
            MaxValue = 100;
            BlankNumbers = DontBlank;
        }
        field(50020; "% commissions"; Decimal)
        {
            DataClassification = CustomerContent;
            Caption = '% commissions';
            Description = 'ENTETE_RECEPTION_ACHAT LN 04/10/24 REV24';
            MinValue = 0;
            MaxValue = 100;
            BlankNumbers = DontBlank;
        }
        field(50021; "% transit"; Decimal)
        {
            DataClassification = CustomerContent;
            Caption = '% transit';
            Description = 'ENTETE_RECEPTION_ACHAT LN 04/10/24 REV24';
            MinValue = 0;
            MaxValue = 100;
            BlankNumbers = DontBlank;
        }
        field(50022; "Date de relance"; Date)
        {
            DataClassification = CustomerContent;
            Caption = 'Date de relance';
            Description = 'ENTETE_RECEPTION_ACHAT LN 04/10/24 REV24';
            BlankNumbers = DontBlank;
        }

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

}