

% ========== DÉCLARATIONS DYNAMIQUES ==========
:- dynamic type_feuille/1.
:- dynamic forme_feuille/1.
:- dynamic couleur_feuille/1.
:- dynamic taille_plante/1.
:- dynamic besoin_lumiere/1.
:- dynamic exposition_preferree/1.
:- dynamic temperature_minimale/1.
:- dynamic origine/1.
:- dynamic besoin_eau/1.
:- dynamic type_sol/1.
:- dynamic retenue_eau/1.
:- dynamic humidite_air/1.
:- dynamic presence_fleurs/1.
:- dynamic periode_floraison/1.
:- dynamic entretien_facile/1.
:- dynamic toxicite/1.
:- dynamic etat_feuille/1.
:- dynamic racines_apparentes/1.
:- dynamic couleur_tige/1.
:- dynamic croissance_rapide/1.
:- dynamic besoin_humidificateur/1.

% ---------- Caractéristiques Morphologiques ----------
type_feuille(fine).
type_feuille(epaisse).
type_feuille(moyenne).

% ... (le reste du fichier reste identique)

% ---------- Caractéristiques Morphologiques ----------
type_feuille(fine).
type_feuille(epaisse).
type_feuille(moyenne).

forme_feuille(allongee).
forme_feuille(arrondie).

couleur_feuille(verte).
couleur_feuille(rouge).
couleur_feuille(variegee).

taille_plante(petite).       % < 30cm
taille_plante(moyenne).      % 30-100cm
taille_plante(grande).       % > 100cm

% ---------- Exposition & Lumière ----------
besoin_lumiere(faible).
besoin_lumiere(moyen).
besoin_lumiere(fort).

exposition_preferree(soleil_direct).
exposition_preferree(soleil_filtree).
exposition_preferree(ombre).

% ---------- Température & Climat ----------
temperature_minimale(5).
temperature_minimale(10).
temperature_minimale(15).
temperature_minimale(20).

origine(tropicale).
origine(mediterraneenne).
origine(desertique).
origine(temperee).

% ---------- Arrosage & Substrat ----------
besoin_eau(faible).
besoin_eau(moyen).
besoin_eau(eleve).

type_sol(drainant).
type_sol(argileux).
type_sol(riche).
type_sol(pauvre).

retenue_eau(bonne).
retenue_eau(moyenne).
retenue_eau(faible).

% ---------- Humidité & Environnement ----------
humidite_air(faible).
humidite_air(moyenne).
humidite_air(forte).

besoin_humidificateur(oui).
besoin_humidificateur(non).  % Ajouté

% ---------- Floraison & Entretien ----------
presence_fleurs(oui).
presence_fleurs(non).

periode_floraison(hiver).
periode_floraison(ete).

entretien_facile(oui).
entretien_facile(non).

toxicite(oui).
toxicite(non).

% ---------- Observations de Santé ----------
etat_feuille(molle).
etat_feuille(seche).
etat_feuille(tachetee).

racines_apparentes(oui).
racines_apparentes(non).     % Ajouté

couleur_tige(brune).
couleur_tige(verte).         % Ajouté

croissance_rapide(oui).
croissance_rapide(non).      % Ajouté