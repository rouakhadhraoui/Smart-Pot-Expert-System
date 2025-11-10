

:- consult('../kb/knowledge_loader.pl').

% ========== CHARGEMENT DYNAMIQUE DES CARACTÉRISTIQUES ==========

% Charger les caractéristiques d'une plante dans la base dynamique
charger_plante(NomPlante) :-
    retractall(type_feuille(_)),
    retractall(forme_feuille(_)),
    retractall(couleur_feuille(_)),
    retractall(taille_plante(_)),
    retractall(besoin_lumiere(_)),
    retractall(exposition_preferree(_)),
    retractall(temperature_minimale(_)),
    retractall(origine(_)),
    retractall(besoin_eau(_)),
    retractall(type_sol(_)),
    retractall(retenue_eau(_)),
    retractall(humidite_air(_)),
    retractall(presence_fleurs(_)),
    retractall(periode_floraison(_)),
    retractall(entretien_facile(_)),
    retractall(toxicite(_)),
    plante(NomPlante, Caracteristiques),
    asserter_caracteristiques(Caracteristiques).

% Asserter chaque caractéristique
asserter_caracteristiques([]).
asserter_caracteristiques([Carac|Reste]) :-
    assertz(Carac),
    asserter_caracteristiques(Reste).

% ========== ANALYSE COMPLÈTE D'UNE PLANTE ==========

analyser_plante(NomPlante, Resultats) :-
    charger_plante(NomPlante),
    findall(C, classe(C), Classes),
    findall(A, arrosage(A), Arrosages),
    findall(P, precaution(P), Precautions),
    Resultats = [
        nom(NomPlante),
        classes(Classes),
        arrosages(Arrosages),
        precautions(Precautions)
    ].

% ========== AFFICHAGE DES RÉSULTATS ==========

afficher_analyse(NomPlante) :-
    writeln(''),
    writeln('========================================'),
    write('ANALYSE DE LA PLANTE : '), writeln(NomPlante),
    writeln('========================================'),
    analyser_plante(NomPlante, Resultats),
    afficher_resultats(Resultats),
    writeln('========================================'),
    writeln('').

afficher_resultats([]).
afficher_resultats([nom(N)|Reste]) :-
    write('Nom : '), writeln(N),
    afficher_resultats(Reste).
afficher_resultats([classes(C)|Reste]) :-
    write('Classes détectées : '), writeln(C),
    afficher_resultats(Reste).
afficher_resultats([arrosages(A)|Reste]) :-
    write('Fréquences d\'arrosage : '), writeln(A),
    afficher_resultats(Reste).
afficher_resultats([precautions(P)|Reste]) :-
    write('Précautions : '), writeln(P),
    afficher_resultats(Reste).

% ========== LISTER TOUTES LES PLANTES ==========

lister_plantes :-
    writeln(''),
    writeln('=== PLANTES DISPONIBLES ==='),
    findall(Nom, plante(Nom, _), Plantes),
    afficher_liste_plantes(Plantes),
    writeln('').

afficher_liste_plantes([]).
afficher_liste_plantes([P|Reste]) :-
    write('  - '), writeln(P),
    afficher_liste_plantes(Reste).

% ========== DIAGNOSTIC DE SANTÉ ==========

diagnostiquer_probleme(Symptomes, Diagnostic) :-
    member(etat_feuille(molle), Symptomes),
    Diagnostic = 'Sur-arrosage détecté : réduire la fréquence d\'arrosage'.

diagnostiquer_probleme(Symptomes, Diagnostic) :-
    member(etat_feuille(seche), Symptomes),
    Diagnostic = 'Sous-arrosage détecté : augmenter la fréquence d\'arrosage'.

diagnostiquer_probleme(Symptomes, Diagnostic) :-
    member(etat_feuille(tachetee), Symptomes),
    Diagnostic = 'Problème fongique possible : vérifier l\'humidité et l\'aération'.

diagnostiquer_probleme(Symptomes, Diagnostic) :-
    member(racines_apparentes(oui), Symptomes),
    Diagnostic = 'Rempotage nécessaire : la plante est à l\'étroit'.

diagnostiquer_probleme(Symptomes, Diagnostic) :-
    member(couleur_tige(brune), Symptomes),
    Diagnostic = 'Pourriture possible : vérifier le drainage et réduire l\'arrosage'.

diagnostiquer_probleme(_, 'Aucun problème majeur détecté').

% ========== AIDE ==========

aide :-
    writeln(''),
    writeln('=== COMMANDES DISPONIBLES ==='),
    writeln('  lister_plantes.              - Liste toutes les plantes disponibles'),
    writeln('  afficher_analyse(NomPlante). - Analyse complète d\'une plante'),
    writeln('  analyser_plante(Nom, R).     - Obtenir les résultats dans R'),
    writeln('  diagnostiquer_probleme([symptome1, ...], D). - Diagnostic de santé'),
    writeln('  aide.                        - Afficher cette aide'),
    writeln('').