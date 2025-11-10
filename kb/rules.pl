

:- dynamic type_feuille/1, type_sol/1, besoin_lumiere/1, origine/1.
:- dynamic humidite_air/1, temperature_minimale/1, taille_plante/1.
:- dynamic presence_fleurs/1, besoin_eau/1, exposition_preferree/1.

% ---------- Classification par type de plante ----------

% R1 : Succulente
classe(succulente) :-
    type_feuille(epaisse),
    type_sol(drainant),
    besoin_lumiere(fort),
    origine(desertique).

% R2 : Tropicale
classe(tropicale) :-
    type_feuille(fine),
    humidite_air(forte),
    origine(tropicale).

% R3 : Herbacee
classe(herbacee) :-
    type_feuille(moyenne),
    besoin_lumiere(moyen),
    humidite_air(moyenne),
    temperature_minimale(15).

% R4 : Cactus
classe(cactus) :-
    forme_feuille(arrondie),
    taille_plante(petite),
    type_sol(drainant).

% R5 : Orchidee
classe(orchidee) :-
    presence_fleurs(oui),
    besoin_lumiere(faible),
    humidite_air(forte),
    temperature_minimale(15).

% ---------- Frequence d'arrosage ----------

% R6
arrosage(une_fois_par_mois) :-
    classe(cactus),
    besoin_eau(faible).

% R7
arrosage(deux_fois_par_mois) :-
    classe(succulente).

% R8
arrosage(une_fois_par_semaine) :-
    classe(tropicale),
    humidite_air(forte).

% R9
arrosage(deux_fois_par_semaine) :-
    classe(herbacee),
    taille_plante(moyenne).

% R10
arrosage(trois_fois_par_semaine) :-
    classe(orchidee),
    temperature_minimale(T),
    T < 18.

% ---------- Precautions ----------

% R11
precaution(eviter_sur_arrosage) :-
    classe(cactus).

% R12
precaution(ameliorer_drainage) :-
    classe(succulente),
    \+ type_sol(drainant).

% R13
precaution(utiliser_humidificateur) :-
    classe(tropicale),
    humidite_air(faible).

% R14
precaution(proteger_du_froid) :-
    classe(orchidee),
    temperature_minimale(T),
    T < 15.

% R15
precaution(eviter_exposition_prolongee_directe) :-
    besoin_lumiere(fort),
    exposition_preferree(soleil_direct),
    humidite_air(faible).