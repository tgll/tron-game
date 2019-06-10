class Joueur {
  String nomJ;
  color couleurJ;
  int score=0;
  Joueur adversaire;

  //Variable de position de départ des joueurs (utiles pour le lancement de nouvelle partie)
  int posJXdepart;
  int posJYdepart;

  //Variable de position des joueurs en cours de partie
  int posJX;
  int posJY;
  int tailleJ = 7;

  //Déclaration des touches attribuées à chaque joueur
  char tupJ;
  char tdownJ;
  char tleftJ;
  char trightJ;

  //Booleen servant à modifier la direction du joueur
  boolean upJB;
  boolean downJB;
  boolean leftJB;
  boolean rightJB;


///////////////////////////////////////////////////////////////////////
  // CONSTRUCTEUR
  Joueur(String nomJ, color couleurJ, int posJX, int posJY, char upJ, char downJ, char leftJ, char rightJ) {
    this.nomJ = nomJ;
    this.couleurJ = couleurJ;
    this.posJXdepart = posJX;
    this.posJYdepart = posJY;
    this.posJX=posJX;
    this.posJY=posJY;
    this.tupJ = upJ;
    this.tdownJ = downJ;
    this.tleftJ = leftJ;
    this.trightJ = rightJ;
  }
  
///////////////////////////////////////////////////////////////////////

  // METHODES

  // dessine le joueur avec un rectangle
  void DessineJoueur()
  {
    fill(this.couleurJ);
    rect(this.posJX, this.posJY, this.tailleJ, this.tailleJ);
  }


  //MOUVEMENT JOUEURS
  void  mouvement() {
    if (leftJB) this.posJX--;
    if (rightJB) this.posJX++;
    if (upJB)  this.posJY--;
    if (downJB)  this.posJY++;
  }


  // EVENEMENTS CLAVIER

  void keyPressed() {
    // Saisie clavier J
    if (key == tleftJ) { //left J
      if (this.rightJB==!true) {  //Condition pour interdir le retour sur nos pas
        this.leftJB = true;
        this.downJB =  false;
        this.upJB = false;
        departpartie=true;
      }
    } 
    if (key == trightJ) { //right J
      if (this.leftJB==!true) {  //Condition pour interdir le retour sur nos pas
        this.downJB =  false;
        this.upJB = false;
        this.rightJB = true;
        departpartie=true;
      }
    } 
    if (key == tupJ) { //up J
      if (this.downJB==!true) {  //Condition pour interdir le retour sur nos pas
        this.leftJB = false;
        this.upJB = true;
        this.rightJB = false;
        departpartie=true;
      }
    } 
    if (key == tdownJ) { //down J
      if (this.upJB==!true) {  //Condition pour interdir le retour sur nos pas
        this.leftJB = false;
        this.downJB =  true;
        this.rightJB = false;
        departpartie=true;
      }
    }
  }


  // Fin du jeu

  void JeuPerdu() {
    jeuencours = false;
    this.DessineJoueur();
    background(gameover);
    fill(this.couleurJ);
    textAlign(CENTER);
    text ("Le joueur " + this.nomJ + " a perdu", 400, 50);
    departpartie=false;
  }


  // Remise à zéro de la position des joueurs

  void Raz() {
    this.posJX=this.posJXdepart; 
    this.posJY=this.posJYdepart;
  }


  //Gestion des collisions

  void collision() {
    if ((this.posJX < 0) || (this.posJX >(width - this.tailleJ)) || (this.posJY < 0) || (this.posJY >(height - this.tailleJ))) {
      if (departpartie==true) {
        adversaire.score++;
      }
      this.JeuPerdu();
    }
    if ((this.rightJB)) {
      if ( (get(this.posJX+this.tailleJ, this.posJY)  == color(0, 255, 0)) || (get(this.posJX+this.tailleJ, this.posJY)  == color(255, 0, 0)) ) {
        if (departpartie==true) {
          adversaire.score++;
        }
        this.JeuPerdu();
      }
    }

    if ((this.leftJB)) {
      if ( ((get(this.posJX-this.tailleJ, this.posJY))  == color(0, 255, 0)) || ((get(this.posJX-this.tailleJ, this.posJY))  == color(255, 0, 0)) ) {
        if (departpartie==true) {
          adversaire.score++;
        }
        this.JeuPerdu();
      }
    }

    if ((this.upJB)) {
      if ( ((get(this.posJX, this.posJY-this.tailleJ))  == color(0, 255, 0)) || ((get(this.posJX, this.posJY-this.tailleJ))  == color(255, 0, 0) )) {
        if (departpartie==true) {
          adversaire.score++;
        }
        this.JeuPerdu();
      }
    }
    if ((this.downJB)) {
      if (( (get(this.posJX, this.posJY+this.tailleJ))   == color(0, 255, 0))|| ((get(this.posJX, this.posJY+this.tailleJ))   == color(255, 0, 0) )) {
        if (departpartie==true) {
          adversaire.score++;
        }
        this.JeuPerdu();
      }
    }
  }
} // fin classe