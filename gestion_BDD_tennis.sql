-- Affichage des tables
SELECT * FROM joueur;

SELECT * FROM match_tennis;

SELECT * FROM score_vainqueur;

SELECT * FROM tournoi;

SELECT * FROM epreuve;


SELECT * FROM joueur INNER JOIN match_tennis WHERE joueur.ID = match_tennis.ID_VAINQUEUR;

SELECT * FROM joueur INNER JOIN match_tennis WHERE joueur.ID = match_tennis.ID_VAINQUEUR AND NOM LIKE "Nadal" OR PRENOM LIKE "Rafael";

SELECT * FROM joueur INNER JOIN match_tennis ON joueur.ID = match_tennis.ID_VAINQUEUR WHERE NOM LIKE "Nadal" OR PRENOM LIKE "Rafael";

SELECT NOM, PRENOM, SEXE FROM joueur, match_tennis, epreuve WHERE epreuve.ID = match_tennis.ID_EPREUVE AND epreuve.ANNEE = ? AND epreuve.TYPE_EPREUVE = ? AND (match_tennis.ID_VAINQUEUR = joueur.ID OR match_tennis.ID_FINALISTE = joueur.ID);

SELECT NOM, PRENOM FROM joueur, match_tennis, epreuve WHERE epreuve.ID = match_tennis.ID_EPREUVE AND epreuve.ANNEE = 2019 AND epreuve.TYPE_EPREUVE = "F" AND (match_tennis.ID_VAINQUEUR = joueur.ID OR match_tennis.ID_FINALISTE = joueur.ID);

SELECT NOM, PRENOM FROM joueur INNER JOIN match_tennis ON (match_tennis.ID_VAINQUEUR = joueur.ID OR match_tennis.ID_FINALISTE = joueur.ID) INNER JOIN epreuve WHERE epreuve.ANNEE = 2018 AND epreuve.TYPE_EPREUVE = "H";



SELECT * FROM joueur WHERE NOM LIKE '%a%' OR PRENOM LIKE '%a%';

INSERT INTO joueur (NOM, PRENOM, SEXE) VALUES ('ca', 'cal', 'F');

UPDATE joueur SET ID=1008, NOM="z", PRENOM="z", SEXE="M" WHERE ID=2061;

SELECT MAX(ID) FROM joueur;

UPDATE joueur SET PRENOM="ca", NOM="co", SEXE="M" WHERE ID=20033;

SELECT * FROM joueur WHERE NOM LIKE "H%" OR PRENOM LIKE "J%" AND SEXE="F";

DELETE FROM match_tennis WHERE ID=100;

SELECT * FROM epreuve WHERE TYPE_EPREUVE = "H" AND ANNEE = 2018;


-- Suppression d'un joueur dans une table + suppression match et score
DELETE score_vainqueur FROM score_vainqueur INNER JOIN match_tennis ON match_tennis.ID = score_vainqueur.ID_MATCH WHERE (match_tennis.ID_VAINQUEUR=20045 OR match_tennis.ID_FINALISTE=20045);

DELETE match_tennis FROM match_tennis WHERE (match_tennis.ID_VAINQUEUR=20045 OR match_tennis.ID_FINALISTE=20045);

DELETE FROM joueur WHERE ID=20045;

DELETE FROM joueur WHERE ID=20046;

-- Création d'un échantillon de test joueur, match tennis et score vainqueur

INSERT INTO joueur (ID, NOM, PRENOM, SEXE) VALUES (20045, 'Colnat', 'Corentin', 'H');
INSERT INTO joueur (ID, NOM, PRENOM, SEXE) VALUES (20046, 'Agbulut', 'Erdinc', 'H');

INSERT INTO match_tennis (ID, ID_EPREUVE, ID_VAINQUEUR, ID_FINALISTE) VALUES (73, 72, 20045, 20046);

INSERT INTO score_vainqueur (ID_MATCH, SET_1, SET_2, SET_3) VALUES (73, 4, 2, 4);


-- Remise en place du joueur 43 Söderling Robin H
INSERT INTO joueur (ID, NOM, PRENOM, SEXE) VALUES (43, 'Söderling', 'Robin', 'H');

-- Remise en place du match_tennis ID = 1 ID_EPREUVE = 19 ID_VAINQUEUR = 31 ID_FINALISTE = 43
INSERT INTO match_tennis (ID, ID_EPREUVE, ID_VAINQUEUR, ID_FINALISTE) VALUES (1, 19, 31, 43);

-- Remise en place du score_vainqueur ID = 1 ID_MATCH = 1 SET_1 = 4 SET_2 = 2 SET_3 = 4
 INSERT INTO score_vainqueur (ID, ID_MATCH, SET_1, SET_2, SET_3) VALUES (1, 1, 4, 2, 4);
 
 -- Création d'un échantillon de test tournois 
 
 INSERT INTO tournoi (ID, NOM, CODE) VALUES (80, "Miami", "MI");
 
 INSERT INTO epreuve (ID, ANNEE, TYPE_EPREUVE, ID_TOURNOI) VALUES (80, 2022, "H", 80);
 
