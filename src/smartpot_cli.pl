

:- consult('inference_engine.pl').

% ========== DÉMARRAGE DU SYSTÈME ==========

demarrer :-
    afficher_banniere,
    menu_principal.

afficher_banniere :-
    writeln(''),
    writeln('╔════════════════════════════════════════════════╗'),
    writeln('║         🌿 SMART-POT EXPERT SYSTEM 🌿         ║'),
    writeln('║    Système expert de gestion des plantes      ║'),
    writeln('║   Par: Balkis Oueslati & Nawres Gammoudi      ║'),
    writeln('╚════════════════════════════════════════════════╝'),
    writeln('').

% ========== MENU PRINCIPAL ==========

menu_principal :-
    writeln(''),
    writeln('=== MENU PRINCIPAL ==='),
    writeln('1. Analyser une plante existante'),
    writeln('2. Identifier une plante inconnue'),
    writeln('3. Diagnostiquer un problème de santé'),
    writeln('4. Lister toutes les plantes'),
    writeln('5. Quitter'),
    writeln(''),
    write('Choisissez une option (1-5): '),
    read(Choix),
    traiter_choix(Choix).

% ========== TRAITEMENT DES CHOIX ==========

traiter_choix(1) :-
    writeln(''),
    writeln('=== ANALYSE DE PLANTE ==='),
    lister_plantes,
    write('Entrez le nom de la plante (ex: aloe_vera): '),
    read(NomPlante),
    (   plante(NomPlante, _) ->
        afficher_analyse(NomPlante),
        menu_principal
    ;   writeln('Plante inconnue! Vérifiez l\'orthographe.'),
        menu_principal
    ).

traiter_choix(2) :-
    writeln(''),
    writeln('=== IDENTIFICATION DE PLANTE ==='),
    writeln('Répondez aux questions suivantes:'),
    writeln(''),
    identifier_plante_interactive,
    menu_principal.

traiter_choix(3) :-
    writeln(''),
    writeln('=== DIAGNOSTIC DE SANTÉ ==='),
    diagnostiquer_interactive,
    menu_principal.

traiter_choix(4) :-
    lister_plantes,
    menu_principal.

traiter_choix(5) :-
    writeln(''),
    writeln('Merci d\'avoir utilisé Smart-Pot! À bientôt! 🌿'),
    writeln(''),
    halt.

traiter_choix(_) :-
    writeln('Choix invalide! Veuillez choisir entre 1 et 5.'),
    menu_principal.

% ========== IDENTIFICATION INTERACTIVE ==========

identifier_plante_interactive :-
    write('Type de feuille (fine/moyenne/epaisse): '),
    read(TypeFeuille),
    assertz(type_feuille(TypeFeuille)),
    
    write('Taille de la plante (petite/moyenne/grande): '),
    read(Taille),
    assertz(taille_plante(Taille)),
    
    write('Besoin en lumière (faible/moyen/fort): '),
    read(Lumiere),
    assertz(besoin_lumiere(Lumiere)),
    
    write('Origine (tropicale/desertique/mediterraneenne/temperee): '),
    read(Origine),
    assertz(origine(Origine)),
    
    write('Type de sol (drainant/argileux/riche/pauvre): '),
    read(Sol),
    assertz(type_sol(Sol)),
    
    write('Humidité de l\'air (faible/moyenne/forte): '),
    read(Humidite),
    assertz(humidite_air(Humidite)),
    
    writeln(''),
    writeln('=== RÉSULTATS DE L\'IDENTIFICATION ==='),
    
    findall(C, classe(C), Classes),
    (   Classes \= [] ->
        write('Classes possibles: '), writeln(Classes)
    ;   writeln('Aucune classe identifiée avec ces caractéristiques.')
    ),
    
    findall(A, arrosage(A), Arrosages),
    (   Arrosages \= [] ->
        write('Fréquences d\'arrosage recommandées: '), writeln(Arrosages)
    ;   writeln('Aucune recommandation d\'arrosage disponible.')
    ),
    
    findall(P, precaution(P), Precautions),
    (   Precautions \= [] ->
        write('Précautions: '), writeln(Precautions)
    ;   writeln('Aucune précaution particulière.')
    ),
    
    % Nettoyer les assertions temporaires
    retractall(type_feuille(_)),
    retractall(taille_plante(_)),
    retractall(besoin_lumiere(_)),
    retractall(origine(_)),
    retractall(type_sol(_)),
    retractall(humidite_air(_)),
    writeln('').

% ========== DIAGNOSTIC INTERACTIF ==========

diagnostiquer_interactive :-
    writeln('Quels symptômes observez-vous? (répondez par oui/non)'),
    writeln(''),
    
    symptomes_collectes([]),
    
diagnostiquer_interactive.

symptomes_collectes(Symptomes) :-
    write('Feuilles molles? (oui/non): '),
    read(Rep1),
    (Rep1 = oui -> append(Symptomes, [etat_feuille(molle)], S1) ; S1 = Symptomes),
    
    write('Feuilles sèches? (oui/non): '),
    read(Rep2),
    (Rep2 = oui -> append(S1, [etat_feuille(seche)], S2) ; S2 = S1),
    
    write('Feuilles tachetées? (oui/non): '),
    read(Rep3),
    (Rep3 = oui -> append(S2, [etat_feuille(tachetee)], S3) ; S3 = S2),
    
    write('Racines apparentes? (oui/non): '),
    read(Rep4),
    (Rep4 = oui -> append(S3, [racines_apparentes(oui)], S4) ; S4 = S3),
    
    write('Tige brune? (oui/non): '),
    read(Rep5),
    (Rep5 = oui -> append(S4, [couleur_tige(brune)], SymptomesFinaux) ; SymptomesFinaux = S4),
    
    writeln(''),
    writeln('=== DIAGNOSTIC ==='),
    diagnostiquer_probleme(SymptomesFinaux, Diagnostic),
    writeln(Diagnostic),
    writeln('').

% ========== LANCEMENT AUTOMATIQUE ==========

:- initialization(demarrer).