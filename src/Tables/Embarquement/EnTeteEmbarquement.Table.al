table 50236 "EnTeteEmbarquement"
{
    DataClassification = ToBeClassified;

    fields
    {
        // Champ pour le numéro d'embarquement
        field(1; "No. embarquement"; Code[10])
        {
            DataClassification = SystemMetadata;
            Caption = 'N° embarquement';
            Editable = false;
        }
        // Champ pour le numéro du preneur d'ordre
        field(2; "No. preneur d'ordre"; Code[20])
        {
            DataClassification = CustomerContent;
            Caption = 'N° preneur d''ordre';
            TableRelation = Vendor."No.";
            Editable = false;
            // ValidateTableRelation = true; // Déjà activé par défaut

            // Trigger pour valider le numéro du preneur d'ordre
            trigger OnValidate()
            begin
                ValidateNoPreneurOrdre();
            end;
        }
        // Champ pour la date d'embarquement
        field(3; "Date embarquement"; Date)
        {
            DataClassification = SystemMetadata;
            Caption = 'Date embarquement';
            Editable = true;

            // Trigger pour valider la date d'embarquement
            trigger OnValidate()
            begin
                ValidateDateEmbarquement();
            end;
        }
        // Champ pour la date de réception prévue
        field(4; "Date réception prévue"; Date)
        {
            DataClassification = SystemMetadata;
            Caption = 'Date réception prévue';
            Editable = true;

            // Trigger pour valider la date de réception prévue
            trigger OnValidate()
            begin
                ValidateDateReceptionPrevue();
            end;
        }
        // Champs pour les informations du preneur d'ordre
        field(5; "Nom du preneur d'ordre"; Text[30])
        {
            DataClassification = CustomerContent;
            Caption = 'Nom du preneur d''ordre';
            Editable = false;
        }
        field(6; "Adresse preneur d'ordre"; Text[30])
        {
            DataClassification = CustomerContent;
            Caption = 'Adresse preneur d''ordre';
            Editable = false;
        }
        field(7; "Adresse preneur d'ordre 2"; Text[30])
        {
            DataClassification = CustomerContent;
            Caption = 'Adresse preneur d''ordre 2';
            Editable = false;
        }
        field(8; "Adresse preneur d'ordre 3"; Text[30])
        {
            DataClassification = CustomerContent;
            Caption = 'Adresse preneur d''ordre 3';
            Editable = false;
        }
        field(9; "Ville preneur d'ordre"; Text[30])
        {
            DataClassification = CustomerContent;
            Caption = 'Ville preneur d''ordre';
            Editable = false;
        }
        field(10; "Contact preneur d'ordre"; Text[30])
        {
            DataClassification = CustomerContent;
            Caption = 'Contact preneur d''ordre';
            Editable = false;
        }
        field(11; "Code postal preneur d'ordre"; Code[20])
        {
            DataClassification = CustomerContent;
            Caption = 'Code postal preneur d''ordre';
            Editable = false;
        }
        field(12; "Code pays preneur d'ordre"; Code[10])
        {
            DataClassification = CustomerContent;
            Caption = 'Code pays preneur d''ordre';
            TableRelation = "Country/Region";
            Editable = false;
        }
        // Champ pour les souches de numéro
        field(13; "Souches de No."; Code[10])
        {
            DataClassification = SystemMetadata;
            Caption = 'Souches de N°';
            TableRelation = "No. Series";
            Editable = false;
        }
    }

    // Clés pour la table
    keys
    {
        // Clé principale pour le numéro d'embarquement
        key(PK; "No. embarquement")
        {
            Clustered = true;
            // MaintainSqlIndex = true; // Déjà activé par défaut
        }

        // Clé secondaire pour le numéro du preneur d'ordre et la date d'embarquement
        key(SecondaryKey; "No. preneur d'ordre", "Date embarquement")
        {
            Clustered = false;
        }
    }

    // Variables pour la table
    var
        ParamAchat: Record "Purchases & Payables Setup";
        Fns: Record Vendor;
        LigEmbarquement: Record "LigneEmbarquement";
        LigAchat: Record "Purchase Line";
        // GestionNoSouche: Codeunit "NoSeriesManagement";
        NoSeries: Codeunit "No. Series";   // New codeunit for No. Series handling

    // Trigger pour l'insertion d'un en-tête d'embarquement
    trigger OnInsert()
    begin
        if ("No. embarquement" = '') then begin
            // Vérifier que le champ de numéro de série est rempli
            ParamAchat.TESTFIELD("No. embarquement");

            // Initialiser le numéro de série
            NoSeries.GetNextNo(ParamAchat."No. embarquement", 0D, false);

            // Si nécessaire, vérifier si la série est liée
            // NoSeries.AreRelated(ParamAchat."No embarquement", "Souches de No");
        end;

        // Définir la date d'embarquement sur la date du jour
        "Date embarquement" := Today;
    end;


    // Trigger pour la suppression d'un en-tête d'embarquement
    trigger OnDelete()
    begin
        LigEmbarquement.Reset();
        LigEmbarquement.SetRange("No. embarquement", "No. embarquement");
        if LigEmbarquement.FindSet() then begin
            CancelReservEntry(); // Annuler toutes les réservations liées à l'embarquement
            repeat
                if LigAchat.Get(LigAchat."Document Type"::Order, LigEmbarquement."No. commande achat", LigEmbarquement."No. ligne commande achat") then begin
                    LigEmbarquement.Delete(); // Supprimer les lignes d'embarquement
                    LigAchat.InitQteAEmbarquer(); // Recalculer la quantité à embarquer sur la ligne d'achat
                    LigAchat.Modify(); // Enregistrer les modifications
                end else
                    LigEmbarquement.Delete();
            until LigEmbarquement.Next() = 0;
        end;
    end;

    // Trigger à la tentative de renommage d'un en-tête
    trigger OnRename()
    begin
        Error('Vous ne pouvez pas renommer %1.', TableCaption);
    end;

    // Procédure pour annuler les réservations
    procedure CancelReservEntry()
    begin
        // Réinitialiser la table LigEmbarquement
        LigEmbarquement.Reset();

        // Définir la plage de recherche pour le champ "No embarquement"
        LigEmbarquement.SetRange("No. embarquement", "No. embarquement");

        // Rechercher les enregistrements dans la plage définie
        if LigEmbarquement.FindSet() then

            // Boucler sur les enregistrements trouvés
            repeat

                // Supprimer les réservations pour chaque enregistrement
                LigEmbarquement.DeleteReservEntry();
            until LigEmbarquement.Next() = 0;
    end;

    // Procédure pour valider le "No preneur d'ordre"
    procedure ValidateNoPreneurOrdre()
    begin
        // Extraire les informations du preneur d'ordre
        ExtrFns("No. preneur d'ordre");

        // Mettre à jour les champs avec les informations extraites
        "Nom du preneur d'ordre" := Fns.Name;
        "Adresse preneur d'ordre" := Fns.Address;
        "Adresse preneur d'ordre 2" := Fns."Address 2";
        "Ville preneur d'ordre" := Fns.City;
        "Code postal preneur d'ordre" := Fns."Post Code";
        "Adresse preneur d'ordre 3" := Fns.County;
        "Code pays preneur d'ordre" := Fns."Country/Region Code";
        "Contact preneur d'ordre" := Fns.Contact;
    end;

    // Procédure pour valider la "Date embarquement"
    procedure ValidateDateEmbarquement()
    begin
        LigEmbarquement.SETRANGE("No. embarquement", "No. embarquement"); // Définir la plage de recherche pour le champ "No embarquement"
        if LigEmbarquement.FIND('-') then // Rechercher les enregistrements dans la plage définie
            LigEmbarquement.MODIFYALL("Date embarquement", "Date embarquement", true); // Mettre à jour la date d'embarquement pour tous les enregistrements trouvés
    end;

    // Procédure pour valider la "Date réception prévue"
    procedure ValidateDateReceptionPrevue()
    begin
        LigEmbarquement.RESET(); // Réinitialiser la table LigEmbarquement
        LigEmbarquement.SETRANGE("No. embarquement", "No. embarquement"); // Définir la plage de recherche pour le champ "No embarquement"
        if LigEmbarquement.FIND('-') then // Rechercher les enregistrements dans la plage définie
            // Boucler sur les enregistrements trouvés
            repeat
                // VAlider et mettre a jour
                LigEmbarquement.VALIDATE("Date réception prévue", "Date réception prévue");
                LigEmbarquement.MODIFY(true);

                // Mise à jour de la date de réception dans les lignes de commande achat
                LigAchat.RESET();
                LigAchat.SETRANGE("Document No.", LigEmbarquement."No. commande achat");
                LigAchat.SETRANGE("Line No.", LigEmbarquement."No. ligne commande achat");
                if LigAchat.FIND('-') then begin
                    LigAchat."Expected Receipt Date" := "Date réception prévue";
                    LigAchat.MODIFY();
                end;
            until LigEmbarquement.NEXT() = 0;
    end;

    // Procédure pour extraire les informations du preneur d'ordre
    procedure ExtrFns(NumFns: Code[20])
    begin
        // Vérifier si le numéro du preneur d'ordre est différent de celui enregistré
        if NumFns <> Fns."No." then
            // Récupérer les informations du preneur d'ordre
            Fns.GET(NumFns);
    end;

}
