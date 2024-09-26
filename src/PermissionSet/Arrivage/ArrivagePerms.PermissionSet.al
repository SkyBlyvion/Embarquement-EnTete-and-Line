permissionset 50252 "ArrivagePerms"
{
    Assignable = true;
    Permissions =
        tabledata "DossierArrivage" = RIMD,
        tabledata "PrestationDossierArrivage" = RIMD,
        tabledata "LigneDossierArrivage" = RIMD,
        tabledata "Credoc" = RIMD,
        tabledata "HistoriqueCredoc" = RIMD,
        tabledata "ReglementCredoc" = RIMD,
        tabledata "FraisAnnexesAchat" = RIMD,
        tabledata "Avis" = RIMD,
        tabledata "AvisLigneDossier" = RIMD,
        tabledata "AvisDossierArrivage" = RIMD;
}