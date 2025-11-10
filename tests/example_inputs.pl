% Charger le moteur d'inférence (qui charge aussi la base de connaissances)
:- consult('../src/inference_engine.pl').


% ========== CAS DE TEST : PLANTES ==========

% Test 1 : Cactus typique
test_cactus :-
    assertz(forme_feuille(arrondie)),
    assertz(taille_plante(petite)),
    assertz(type_sol(drainant)),
    assertz(besoin_eau(faible)),
    writeln('=== TEST : CACTUS ==='),
    (classe(cactus) -> writeln('✓ Classe détectée : cactus') ; writeln('✗ Échec détection cactus')),
    (arrosage(une_fois_par_mois) -> writeln('✓ Arrosage : 1 fois/mois') ; writeln('✗ Échec arrosage')),
    (precaution(eviter_sur_arrosage) -> writeln('✓ Précaution détectée') ; writeln('✗ Pas de précaution')),
    retractall(forme_feuille(_)),
    retractall(taille_plante(_)),
    retractall(type_sol(_)),
    retractall(besoin_eau(_)),
    writeln('').

% Test 2 : Plante tropicale
test_tropicale :-
    assertz(type_feuille(fine)),
    assertz(humidite_air(forte)),
    assertz(origine(tropicale)),
    writeln('=== TEST : TROPICALE ==='),
    (classe(tropicale) -> writeln('✓ Classe détectée : tropicale') ; writeln('✗ Échec détection tropicale')),
    (arrosage(une_fois_par_semaine) -> writeln('✓ Arrosage : 1 fois/semaine') ; writeln('✗ Échec arrosage')),
    retractall(type_feuille(_)),
    retractall(humidite_air(_)),
    retractall(origine(_)),
    writeln('').

% Test 3 : Succulente
test_succulente :-
    assertz(type_feuille(epaisse)),
    assertz(type_sol(drainant)),
    assertz(besoin_lumiere(fort)),
    assertz(origine(desertique)),
    writeln('=== TEST : SUCCULENTE ==='),
    (classe(succulente) -> writeln('✓ Classe détectée : succulente') ; writeln('✗ Échec détection succulente')),
    (arrosage(deux_fois_par_mois) -> writeln('✓ Arrosage : 2 fois/mois') ; writeln('✗ Échec arrosage')),
    retractall(type_feuille(_)),
    retractall(type_sol(_)),
    retractall(besoin_lumiere(_)),
    retractall(origine(_)),
    writeln('').

% Test 4 : Orchidée
test_orchidee :-
    assertz(presence_fleurs(oui)),
    assertz(besoin_lumiere(faible)),
    assertz(humidite_air(forte)),
    assertz(temperature_minimale(15)),
    writeln('=== TEST : ORCHIDEE ==='),
    (classe(orchidee) -> writeln('✓ Classe détectée : orchidée') ; writeln('✗ Échec détection orchidée')),
    retractall(presence_fleurs(_)),
    retractall(besoin_lumiere(_)),
    retractall(humidite_air(_)),
    retractall(temperature_minimale(_)),
    writeln('').

% Test 5 : Diagnostic sur-arrosage
test_diagnostic_sur_arrosage :-
    writeln('=== TEST : DIAGNOSTIC SUR-ARROSAGE ==='),
    diagnostiquer_probleme([etat_feuille(molle)], Diag),
    writeln(Diag),
    writeln('').

% Test 6 : Diagnostic sous-arrosage
test_diagnostic_sous_arrosage :-
    writeln('=== TEST : DIAGNOSTIC SOUS-ARROSAGE ==='),
    diagnostiquer_probleme([etat_feuille(seche)], Diag),
    writeln(Diag),
    writeln('').

% Lancer tous les tests
lancer_tous_tests :-
    writeln(''),
    writeln('╔════════════════════════════════════════╗'),
    writeln('║     TESTS DU SYSTÈME SMART-POT        ║'),
    writeln('╚════════════════════════════════════════╝'),
    writeln(''),
    test_cactus,
    test_tropicale,
    test_succulente,
    test_orchidee,
    test_diagnostic_sur_arrosage,
    test_diagnostic_sous_arrosage,
    writeln('╔════════════════════════════════════════╗'),
    writeln('║         TESTS TERMINÉS                 ║'),
    writeln('╚════════════════════════════════════════╝'),
    writeln('').