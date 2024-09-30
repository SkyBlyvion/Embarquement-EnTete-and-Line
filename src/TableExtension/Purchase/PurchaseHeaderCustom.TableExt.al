tableextension 50240 "PurchaseHeaderCustom" extends "Purchase Header"
{
    fields
    {
        field(50000; "No. Dossier"; Code[10])
        {
            DataClassification = AccountData;
            Caption = 'N° Dossier';
            Description = 'DOSSIER_ARRIVAGE LN 12/09/24 REV24';
            Editable = true;
            TableRelation = "DossierArrivage"."No. Dossier" where("No. Fournisseur" = field("Buy-from Vendor No."));
            trigger OnValidate()
            begin
                // DOSSIER_ARRIVAGE PC NSC1.04 Gestion Dossier d'arrivage
                if ("Document Type" = "Document Type"::Invoice) and (xRec."No. Dossier" <> "No. Dossier") then begin
                    PurchLine.SetRange("Document Type", "Document Type");
                    PurchLine.SetRange("Document No.", "No.");
                    PurchLine.SetFilter("No. Dossier", '<>%1', "No. Dossier");
                    if PurchLine.FindFirst() then
                        Error(TextDOSSIER_ARRIVAGE01, "No. Dossier");
                end;
                // End DOSSIER_ARRIVAGE PC NSC1.04 Gestion Dossier d'arrivage
            end;
        }
        field(50001; "Date disponibilité Perpignan"; Date)
        {
            DataClassification = AccountData;
            Caption = 'Date disponibilité Perpignan';
            Description = 'ENTETE_ACHAT LN  12/09/24 REV24';
            Editable = true;
            BlankNumbers = DontBlank;
        }
        field(50002; "Date d'embarquement prévue"; Date)
        {
            DataClassification = AccountData;
            Caption = 'Date d''embarquement prévue';
            Description = 'EMBARQUEMENT LN  12/09/24 REV24';
            Editable = true;
            BlankNumbers = DontBlank;
            trigger OnValidate()
            begin
                //EMBARQUEMENT PC 16/08/99 NSC1.07 Gestion embarquement
                PurchLine.SETRANGE("Document Type", "Document Type");
                PurchLine.SETRANGE("Document No.", "No.");
                IF PurchLine.FIND('-') THEN BEGIN
                    PurchLine.MODIFYALL("Date d'embarquement prévue", "Date d'embarquement prévue", TRUE);
                    MODIFY();
                END;
                //Fin EMBARQUEMENT PC 16/08/99 NSC1.07 Gestion embarquement
            end;
        }
        field(50004; "Incoterm"; Option)
        {
            DataClassification = AccountData;
            OptionMembers = EXW,FOB,CNI,CNF,CFR,CIF;
            Caption = 'Incoterm';
            Description = 'GENDCODE_INCOTERM LN  12/09/24 REV24';
            Editable = true;
            BlankNumbers = DontBlank;
        }
        field(50005; "Gencodage"; Boolean)
        {
            DataClassification = AccountData;
            Caption = 'Gencodage';
            Description = 'GENDCODE_INCOTERM LN  12/09/24 REV24';
            Editable = true;
            BlankNumbers = DontBlank;
        }
        field(50006; "Volume"; Decimal)
        {
            Caption = 'Volume';
            Description = 'VOLUME_POIDS LN  12/09/24 REV24';
            FieldClass = FlowField;
            CalcFormula = Sum("Purchase Line"."Volume" WHERE("Document Type" = FIELD("Document Type"),
                            "Buy-from Vendor No." = FIELD("Buy-from Vendor No."),
                            "Document No." = FIELD("No.")));
            Editable = false;
            BlankNumbers = DontBlank;
            DecimalPlaces = 3 : 3;
        }
        field(50007; "Poids"; Decimal)
        {
            Caption = 'Poids';
            Description = 'VOLUME_POIDS LN  12/09/24 REV24';
            FieldClass = FlowField;
            CalcFormula = Sum("Purchase Line"."Poids" WHERE("Document Type" = FIELD("Document Type"),
                            "Buy-from Vendor No." = FIELD("Buy-from Vendor No."),
                            "Document No." = FIELD("No.")));
            Editable = false;
            BlankNumbers = DontBlank;
            DecimalPlaces = 3 : 3;
        }
        field(50010; "Code transport routier"; Code[10])
        {
            DataClassification = AccountData;
            Caption = 'Code transport routier';
            Description = 'ENTETE_ACHAT LN  12/09/24 REV24';
            TableRelation = "Transport Method"."Code";
            Editable = true;
        }
        field(50011; "Montant transport routier"; Decimal)
        {
            DataClassification = AccountData;
            Caption = 'Montant transport routier';
            Description = 'ENTETE_ACHAT LN  12/09/24 REV24';
            Editable = true;
            BlankNumbers = DontBlank;
            AutoFormatType = 1;
        }
        field(50012; "Code devise transport routier"; Code[10])
        {
            DataClassification = AccountData;
            Caption = 'Code devise transport routier';
            Description = 'ENTETE_ACHAT LN  12/09/24 REV24';
            Editable = true;
            TableRelation = "Currency"."Code";

            trigger OnValidate()
            begin
                //ENTETE_ACHAT PC 16/08/99 NSC1.07 : Gestion devise transport routier
                // IF CurrFieldNo <> FIELDNO("Code devise transport routier") THEN
                //     MajFacteurDeviseTranspRout
                // ELSE BEGIN
                //     IF "Code devise transport routier" <> xRec."Code devise transport routier" THEN BEGIN
                //         MajFacteurDeviseTranspRout;
                //     END ELSE
                //         IF "Code devise transport routier" <> '' THEN BEGIN
                //             MajFacteurDeviseTranspRout;
                //             IF "Facteur devise transp. routier" <> xRec."Facteur devise transp. routier" THEN
                //                 ConfMajFacteurDevTranspRout;
                //         END;
                // END;
                //Fin ENTETE_ACHAT PC 16/08/99 NSC1.07 : Gestion devise transport routier
            end;
        }
        field(50013; "Facteur devise transp. routier"; Decimal)
        {
            DataClassification = AccountData;
            Caption = 'Facteur devise transp. routier';
            Description = 'ENTETE_ACHAT LN  12/09/24 REV24';
            Editable = false;
            BlankNumbers = DontBlank;
            DecimalPlaces = 0 : 15;
        }
        field(50014; "Code transport maritime"; Code[10])
        {
            DataClassification = AccountData;
            Caption = 'Code transport maritime';
            Description = 'ENTETE_ACHAT LN  12/09/24 REV24';
            Editable = true;
            TableRelation = "Transport Method"."Code";
        }
        field(50015; "Montant transport maritime"; Decimal)
        {
            DataClassification = AccountData;
            Caption = 'Montant transport maritime';
            Description = 'ENTETE_ACHAT LN  12/09/24 REV24';
            Editable = true;
            BlankNumbers = DontBlank;
            AutoFormatType = 1;
        }
        field(50016; "Code devise transport maritime"; Code[10])
        {
            DataClassification = AccountData;
            Caption = 'Code devise transport maritime';
            Description = 'ENTETE_ACHAT LN  12/09/24 REV24';
            Editable = true;
            TableRelation = "Currency"."Code";
            trigger OnValidate()
            begin

                //ENTETE_ACHAT PC 16/08/99 NSC1.07 : Gestion transport maritime
                // IF CurrFieldNo <> FIELDNO("Code devise transport maritime") THEN
                //     MajFacteurDeviseTranspMarit
                // ELSE BEGIN
                //     IF "Code devise transport maritime" <> xRec."Code devise transport maritime" THEN BEGIN
                //         MajFacteurDeviseTranspMarit;
                //     END ELSE
                //         IF "Code devise transport maritime" <> '' THEN BEGIN
                //             MajFacteurDeviseTranspMarit;
                //             IF "Code devise transport maritime" <> xRec."Code devise transport maritime" THEN
                //                 ConfMajFacteurDevTranspMarit;
                //         END;
                // END;
                //Fin ENTETE_ACHAT PC 16/08/99 NSC1.07 : Gestion transport maritime
            end;
        }
        field(50017; "Facteur devise transp. maritim"; Decimal)
        {
            DataClassification = AccountData;
            Caption = 'Facteur devise transp. maritime';
            Description = 'ENTETE_ACHAT LN  12/09/24 REV24';
            Editable = false;
            BlankNumbers = DontBlank;
            DecimalPlaces = 0 : 15;
        }
        field(50018; "% de frais financier"; Decimal)
        {
            DataClassification = AccountData;
            Caption = '% de frais financier';
            Description = 'ENTETE_ACHAT LN  12/09/24 REV24';
            MinValue = 0; // Pour les champs en % il faut set le Min Max Value( afin d'éviter les négatifs et les infinis )
            MaxValue = 100;
            Editable = true;
            BlankNumbers = DontBlank;
        }
        field(50019; "% Assurances"; Decimal)
        {
            DataClassification = AccountData;
            Caption = '% Assurances';
            Description = 'ENTETE_ACHAT LN  12/09/24 REV24';
            MinValue = 0;
            MaxValue = 100;
            Editable = true;
            BlankNumbers = DontBlank;
        }
        field(50020; "% Commissions"; Decimal)
        {
            DataClassification = AccountData;
            Caption = '% Commissions';
            Description = 'ENTETE_ACHAT LN  12/09/24 REV24';
            MinValue = 0;
            MaxValue = 100;
            Editable = true;
            BlankNumbers = DontBlank;
        }
        field(50021; "% Transit"; Decimal)
        {
            DataClassification = AccountData;
            Caption = '% Transit';
            Description = 'ENTETE_ACHAT LN  12/09/24 REV24';
            MinValue = 0;
            MaxValue = 100;
            Editable = true;
            BlankNumbers = DontBlank;
        }
        field(50023; "Date de relance"; Date)
        {
            DataClassification = AccountData;
            Caption = 'Date de relance';
            Description = 'ENTETE_ACHAT LN  12/09/24 REV24';
            Editable = true;
            trigger OnValidate()
            begin
                //ENTETE_ACHAT PC 16/08/99 NSC1.07 Modification date de relance
                PurchLine.SETRANGE("Document Type", "Document Type");
                PurchLine.SETRANGE("Document No.", "No.");
                IF PurchLine.FIND('-') THEN BEGIN
                    PurchLine.MODIFYALL("Date de relance", "Date de relance", TRUE);
                    MODIFY();
                END;
                //Fin ENTETE_ACHAT PC 16/08/99 NSC1.07 Modification date de relance
            end;
        }
        field(50024; "PRT Calculé"; Boolean)
        {
            Caption = 'PRT Calculé';
            Description = 'ENTETE_ACHAT LN  12/09/24 REV24';
            Editable = false;
            FieldClass = FlowField;
            CalcFormula = Exist("HistoriquePRTTable" WHERE("No. commande" = FIELD("No.")));
            BlankNumbers = DontBlank;
        }
        field(50025; "Maj Réservation Vente"; Boolean)
        {
            DataClassification = AccountData;
            Caption = 'Maj Réservation Vente';
            Description = 'ENTETE_ACHAT LN  12/09/24 REV24';
            Editable = false;
            BlankNumbers = DontBlank;
        }
        field(50026; "No. commande portable"; Code[20])
        {
            DataClassification = AccountData;
            Caption = 'N° commande portable';
            Description = 'ENTETE_ACHAT LN  12/09/24 REV24';
            Editable = true;
        }
        field(50027; "Date calcul PRT"; Date)
        {
            DataClassification = AccountData;
            Caption = 'Date calcul PRT';
            Description = 'ENTETE_ACHAT LN  12/09/24 REV24';
            Editable = true;
            BlankNumbers = DontBlank;
        }
        field(50028; "Heure calcul PRT"; Time)
        {
            DataClassification = AccountData;
            Caption = 'Heure calcul PRT';
            Description = 'ENTETE_ACHAT LN  12/09/24 REV24';
            Editable = true;
            BlankNumbers = DontBlank;
        }
        field(50029; "Commande REV'GARDEN"; Boolean)
        {
            DataClassification = AccountData;
            Caption = 'Commande REV''GARDEN';
            Description = 'ENTETE_ACHAT LN  12/09/24 REV24';
            Editable = true;
            BlankNumbers = DontBlank;
        }
        field(50060; "Total Outstanding Quantity"; Decimal)
        {
            Caption = 'Quantité totale en attente';
            Description = 'ENTETE_ACHAT LN  12/09/24 REV24';
            FieldClass = FlowField;
            CalcFormula = Sum("Purchase Line"."Outstanding Quantity" WHERE("Document Type" = FIELD("Document Type"), "Document No." = FIELD("No.")));
            Editable = false;
            BlankNumbers = DontBlank;
            DecimalPlaces = 0 : 5;
        }
    }

    keys
    {
        key(Key10; "Document Type", "Buy-from Vendor No.", "No.")
        {
            Enabled = true;
        }
        key(Key11; "Buy-from Vendor No.", "Vendor Authorization No.")
        {
            Enabled = true;
        }
    }

    fieldgroups
    {
        // Add changes to field groups here
    }

    var
        Text000Lbl: Label 'Souhaitez-vous imprimer le B.R. %1?', Comment = '%1 = Document Number';
        Text001Lbl: Label 'Souhaitez-vous imprimer la Facture %1?', Comment = '%1 = Document Number';
        Text002Lbl: Label 'Souhaitez-vous imprimer l''avoir %1?', Comment = '%1 = Document Number';
        Text003: Label 'You cannot rename a %1.';
        Text004Lbl: Label 'Souhaitez-vous modifier la valeur du champ %1?', Comment = '%1 = Document Number';
        Text006Lbl: Label 'Vous ne pouvez pas modifier %1 car la commande est associée à une ou plusieurs commande(s) vente.', Comment = '%1 = Document Number';
        Text010Lbl: Label 'Une réception vide %1 va être créée pour éviter une discontinuité dans les numéros.\\', Comment = '%1 = Document Number';
        Text011Lbl: Label 'Souhaitez-vous continuer ?';
        Text013Lbl: Label 'Une facture enregistrée vide %1 va être créée pour éviter une discontinuité dans les numéros.\\', Comment = '%1 = Document Number';
        Text015Lbl: Label 'Un avoir enregistré vide %1 va être créé pour éviter une discontinuité dans les numéros.\\', Comment = '%1 = Document Number';
        Text016Lbl: Label 'Si vous modifiez l''enregistrement %1, les lignes achat existantes seront supprimées et de nouvelles lignes achat seront créées.\\', Comment = '%1 = Document Number';
        Text018Lbl: Label 'Vous devez supprimer les lignes achat existantes avant de modifier %1.', Comment = '%1 = Document Number';
        Text019Lbl: Label 'Vous avez modifié le champ %1 dans l''en-tête achat, mais cela n''a pas été modifié dans les lignes achat existantes.\', Comment = '%1 = Document Number';
        Text021Lbl: Label 'Cette modification risque d''affecter le taux de change utilisé pour le calcul des prix des lignes achat.', Comment = '%1 = Document Number';
        Text023: Label 'You cannot delete this document. Your identification is set up to process from %1 %2 only.';
        Text024Lbl: Label 'Souhaitez-vous imprimer le document expédition retour %1?', Comment = '%1 = Document Number';
        Text030Lbl: Label 'Une expédition retour vide %1 va être créée pour éviter une discontinuité dans la souche de numéros.\\', Comment = '%1 = Document Number';
        Text033Lbl: Label 'Souhaitez-vous mettre les lignes à jour ?', Comment = '%1 = Document Number';
        TextDOSSIER_ARRIVAGE01: Label 'Vous devez supprimer les lignes dont le N° de dossier est différent de %1.', Comment = '%1 = Document Number';
        TextENTETE_ACHAT02: Label 'Voulez-vous mettre à jour le taux de change ?', Comment = '%1 = Document Number';
        TextENTETE_ACHAT03: Label 'Voulez-vous annuler toutes les réservations \associées à la commande courante ?', Comment = '%1 = Document Number';
        PurchSetup: Record "Purchases & Payables Setup";
        GLSetup: Record "General Ledger Setup";
        GLAcc: Record "G/L Account";
        PurchLine: Record "Purchase Line";
        xPurchLine: Record "Purchase Line";
        VendLedgEntry: Record "Vendor Ledger Entry";
        Vend: Record Vendor;
        PaymentTerms: Record "Payment Terms";
        PaymentMethod: Record "Payment Method";
        CurrExchRate: Record "Currency Exchange Rate";
        PurchHeader: Record "Purchase Header";
        PurchCommentLine: Record "Purch. Comment Line";
        ShipToAddr: Record "Ship-to Address";
        Cust: Record "Customer";
        CompanyInfo: Record "Company Information";
        PostCode: Record "Post Code";
        OrderAddr: Record "Order Address";
        BankAcc: Record "Bank Account";
        PurchRcptHeader: Record "Purch. Rcpt. Header";
        PurchInvHeader: Record "Purch. Inv. Header";
        PurchCrMemoHeader: Record "Purch. Cr. Memo Hdr.";
        ReturnShptHeader: Record "Return Shipment Header";
        GenBusPostingGrp: Record "Gen. Business Posting Group";
        GenJnILine: Record "Gen. Journal Line";
        RespCenter: Record "Responsibility Center";
        Location: Record "Location";
        WhseRequest: Record "Warehouse Request";
        InvtSetup: Record "Inventory Setup";
        // WebSite: Record "Web Site";
        // DocDim: Record "Document Dimension";
        NoSeriesMgt: Codeunit "NoSeriesManagement";
        TransferExtendedText: Codeunit "Transfer Extended Text";
        GenJnlApply: Codeunit "Gen. Jnl.-Apply";
        PurchPost: Codeunit "Purch.-Post";
        VendEntrySetApplID: Codeunit "Vend. Entry-SetAppl.ID";
        DimMgt: Codeunit "DimensionManagement";
        UserMgt: Codeunit "User Setup Management";
        // SynchMgt: Codeunit "Synchronization Management";
        ArchiveManagement: Codeunit "ArchiveManagement";
        ReservePurchLine: Codeunit "Purch. Line-Reserve";
        // ApplyVendEntries: Form "Apply Vendor Entries";
        CurrencyDate: Date;
        HideValidationDialog: Boolean;
        Confirmed: Boolean;
        SkipBuyFromContact: Boolean;
        SkipPayToContact: Boolean;



}
