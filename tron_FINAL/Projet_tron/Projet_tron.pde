// Projet TRON DUT Info AS
// TEAM : GILLIARD Tallulah; MARBAT Vincent; ALICHE Ceddyk

ArrayList<Joueur> Joueurs = new ArrayList<Joueur>();

//Booléen de fin de partie (utile pour mettre fin à une partie et en lancer une nouvelle)
boolean jeuencours = true;

//Booléen de début de jeu (Menu)
boolean lancementjeu = false;

//Booléen de départ de partie pour eviter ajout de score si aucune touche n'est pressée 
boolean departpartie=false;

//Variables de fond d'écran
PImage fond;
PImage partie;
PImage gameover;


// definit les deux joueurs
Joueur j1 = new Joueur("Vert", color(0, 255, 0), 200, 300, 'z', 's', 'q', 'd');
Joueur j2 = new Joueur("Rouge", color(255, 0, 0), 600, 300, 'i', 'k', 'j', 'l');

//////////////////////////////////////////////////////////////////////////////
// INITIALISATION
void setup()
{
  // parametres generaux ecran
  size(800, 600);

  //fond d'écran
  fond = loadImage("/Images/tron.jpg");
  partie = loadImage("Images/encours.jpg");
  gameover = loadImage("Images/gameover.jpg");

  background(fond);
  noStroke();
  rectMode(CENTER);

  //Création des joueurs
  Joueurs.add(j1);
  Joueurs.add(j2);
  j1.adversaire=j2;
  j2.adversaire=j1;

  // demarrage automatique des joueurs 
  j1.rightJB=true;
  j2.leftJB=true;
}


///////////////////////////////////////////////////////////////////////
// Lancement d'une Nouvelle partie après échec d'un joueur
void NouvellePartie() {
  fill(255);
  textAlign(CENTER);
  textSize(30);
  text ("Appuyez sur N pour lancer une nouvelle partie", 400, 590);
  if (key=='n') {
    background(partie);
    jeuencours = true;
    // demarrage automatique des joueurs 
    j1.rightJB=true;
    j2.leftJB=true;
  }
}


///////////////////////////////////////////////////////////////////////
//Affichage score
void score() {

  //Affichage score
  fill(j1.couleurJ);
  textSize(15);
  textAlign(CENTER);
  text(j1.nomJ+"\n"+j1.score, 50, 30);

  fill(j2.couleurJ);
  textSize(15);
  textAlign(CENTER);
  text(j2.nomJ+"\n"+j2.score, 750, 30);
}
//////////////////////////////////////////////////////////////////////

//Initialisation d'une partie (Menu de départ)
void PartieInit() {
  background(fond);
  textAlign(CENTER);
  textSize(30);
  text ("Appuyez sur G pour démarrer le jeu", 400, 400);
  if (key == 'g') {
    background(partie);
    lancementjeu = true;
  }
}
//////////////////////////////////////////////////////////////////////

// AFFICHAGE RECURSIF 
void draw() {

//Si la touche "G" n'est pas pressée, rester sur l'écran d'accueil
  if (lancementjeu == false) {
    PartieInit();
  }
  
// Appel des méthodes de la classe Joueur pour une partie en cours
  for (Joueur j : Joueurs) {
    if ((jeuencours == true)&&(lancementjeu == true)) {

      j.DessineJoueur();
      j.keyPressed();
      j.mouvement();
      j.collision();
      score();
    }
  }

// Appel des méthodes en cas de partie terminée
  if ((jeuencours == false)&&(lancementjeu == true)) {

    //Partie terminée
    for (Joueur j : Joueurs) {
      // Arrêt du mouvement des joueurs
      j.leftJB = false;
      j.downJB =  false;
      j.upJB = false;
      j.rightJB = false;

      //remise à zéro de la position des joueurs
      j.Raz();
      //Appel de la methode pour lancer une nouvelle partie
      NouvellePartie();
    }
  }
}