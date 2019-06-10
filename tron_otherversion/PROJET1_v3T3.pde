// Projet TRON

// VARIABLES GLOBALES MAIN
ArrayList<Joueur> ListeJoueur = new ArrayList<Joueur>();
// definit les deux joueurs
Joueur j1 = new Joueur("J1", color(0, 0, 255), 30, 200);
Joueur j2 = new Joueur("J2", color(255, 0, 0), 370, 200);

// INITIALISATION
void setup()
{
  // parametres generaux ecran
  size(400, 400);
  background(255, 255, 255);
  noStroke();
  rectMode(CENTER);

  // remplit la liste de joueurs
  ListeJoueur.add(j1);
  ListeJoueur.add(j2);
}


// EVENEMENTS CLAVIER
void keyPressed() {
  // Saisie clavier J1
  if (key == 'q') { //left J1
    this.j1.posJX--;
  } 
  if (key == 'd') { //right J1
    this.j1.posJX++;
  } 
  if (key == 'z') { //up J1
    this.j1.posJY--;
  } 
  if (key == 's') { //down J1
    this.j1.posJY++;
  }
  
  // Saisie clavier J2
  if (key == CODED) {
    if (keyCode == LEFT) { //left J2
      this.j2.posJX--;
    }
    if (keyCode == RIGHT) { //right J2
      this.j2.posJX++;
    }
    if (keyCode == UP) { //up J2
      this.j2.posJY--;
    }
    if (keyCode == DOWN) { //down J2
      this.j2.posJY++;
    }
  }
}


// AFFICHAGE RECURSIF 
void draw()
{
  // Affiche les deux joueurs a leurs emplacements initiaux
  for (Joueur j : ListeJoueur) {
    j.DessineJoueur();
    keyPressed();
  }
}