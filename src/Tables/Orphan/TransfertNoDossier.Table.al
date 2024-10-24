table 50302 TransfertNoDossier
{
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "No. dossier"; Code[10])
        {
            DataClassification = CustomerContent;
            NotBlank = true;
            Numeric = false;
            Editable = true;
            Caption = 'No. dossier';
            Description = 'TRANSFERT_NO_DOSSIER - LN - 24/10/24 REV24';
        }
        field(2; "Date dispo. Perpignan"; Date)
        {
            DataClassification = SystemMetadata;
            BlankNumbers = DontBlank;
            Editable = true;
            Caption = 'Date dispo. Perpignan';
            Description = 'TRANSFERT_NO_DOSSIER - LN - 24/10/24 REV24';
        }
        field(4; "Ancien Magasin"; Code[10])
        {
            DataClassification = CustomerContent;
            Editable = true;
            Caption = 'Ancien Magasin';
            Description = 'TRANSFERT_NO_DOSSIER - LN - 24/10/24 REV24';
        }
        field(5; "Nouveau Magasin"; Code[10])
        {
            DataClassification = CustomerContent;
            Editable = true;
            Caption = 'Nouveau Magasin';
            Description = 'TRANSFERT_NO_DOSSIER - LN - 24/10/24 REV24';
        }
        // Champs désactivés
        // field(6; "Ancien Casier"; Code[10])
        // {
        //     DataClassification = CustomerContent;
        //     Editable = true;
        //     Caption = 'Ancien Casier';
        //     Description = 'TRANSFERT_NO_DOSSIER - LN - 24/10/24 REV24';
        // }
        // field(7; "Nouveau Casier"; Code[10])
        // {
        //     DataClassification = CustomerContent;
        //     Editable = true;
        //     Caption = 'Nouveau Casier';
        //     Description = 'TRANSFERT_NO_DOSSIER - LN - 24/10/24 REV24';
        // }
        field(8; "Date opération"; Date)
        {
            DataClassification = SystemMetadata;
            BlankNumbers = DontBlank;
            Editable = true;
            Caption = 'Date opération';
            Description = 'TRANSFERT_NO_DOSSIER - LN - 24/10/24 REV24';
        }
        field(9; "No. séquence"; Integer)
        {
            DataClassification = CustomerContent;
            Editable = true;
            BlankNumbers = DontBlank;
            Caption = 'No. séquence';
            Description = 'TRANSFERT_NO_DOSSIER - LN - 24/10/24 REV24';
        }
    }

    keys
    {
        key(PK; "No. dossier", "Date opération", "No. séquence")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
        // Add changes to field groups here
    }

    var

        EcrArt: Record "Item Ledger Entry";
        LigFSArticle: Record "Item Journal Line";

    trigger OnInsert()
    begin

    end;

    trigger OnModify()
    begin

    end;

    trigger OnDelete()
    begin

        EcrArt.RESET();

        //MIGRATION_400 SC 03/11/05 NSC4.00 Suppression Code Casier
        //EcrArt.SETCURRENTKEY("N° dossier",Open,"Location Code","Code casier","Variant Code","Item No.");
        EcrArt.SETCURRENTKEY("No. dossier", Open, "Location Code", "Variant Code", "Item No.");
        //Fin MIGRATION_400 SC 03/11/05 NSC4.00 Suppression Code Casier

        EcrArt.SETRANGE("No. dossier", "No. dossier");
        EcrArt.SETRANGE("Location Code", "Nouveau Magasin");

        //MIGRATION_400 SC 03/11/05 NSC4.00 Suppression Code Casier
        //EcrArt.SETRANGE("Code casier","Nouveau Casier");
        //Fin MIGRATION_400 SC 03/11/05 NSC4.00 Suppression Code Casier

        IF EcrArt.FIND('-') THEN
            ERROR('Vous ne pouvez pas supprimer ce transfert car il y a des écritures articles liées.');

        LigFSArticle.RESET();
        LigFSArticle.SETRANGE("Journal Template Name", 'TRANSFERT');
        LigFSArticle.SETRANGE("Journal Batch Name", 'DEFAUT');
        LigFSArticle.SETRANGE("Entry Type", LigFSArticle."Entry Type"::Transfer);
        LigFSArticle.SETRANGE(LigFSArticle."No. dossier");
        IF LigFSArticle.FIND('-') THEN
            ERROR('Vous ne pouvez pas supprimer ce transfert car il y a des transferts en cours.');

    end;

    trigger OnRename()
    begin

    end;

}