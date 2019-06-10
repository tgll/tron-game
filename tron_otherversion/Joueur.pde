class Joueur {
  String nom;
  color couleur;
  int posJX;
  int posJY;
  int tailleJ = 7;

  int up;
  int down;
  int left;
  int right;



  // CONSTRUCTEUR
  Joueur(String nom, color couleur, int posJX, int posJY) {
    this.nom = nom;
    this.couleur = couleur;
    this.posJX = posJX;
    this.posJY = posJY;
  }

  // METHODES
  // dessine le joueur avec un rectangle
  void DessineJoueur()
  {
    fill(this.couleur);
    rect(this.posJX, this.posJY, this.tailleJ, this.tailleJ);
  }

  
} // fin classe