/*********************************************
 * OPL 22.1.1.0 Model
 * Author: ayman
 * Creation Date: 29 nov. 2024 at 10:53:26
 *********************************************/
 
int N = 100; //taille echiquier (lu dans fichier .dat)
range I = 1..N;

// poids de chaque case de l'echiquier initialise aleatoirement entre 0 et 99
int poids[i in I][j in I] = rand(100);
dvar boolean X[I][I]; //x[i][j] = vrai si on a une reine en (i,j)

//----------------------------MODELE--------------------------------
maximize
 sum(i in I) sum(j in I) poids[i][j] * X[i][j];
 
subject to
{
  
//une reine par ligne
forall(i in I)
sum(j in I) X[i][j] == 1;

//une reine par colonne
forall(j in I)
sum(i in I) X[i][j] == 1;

//une reine max par diagonale ascendante gauche droite, triangle superieur
forall (i in 2..N)
 sum (j in 0..i-1) X[i-j][j+1] <= 1;
 
//une reine max par diagonale ascendante gauche droite, triangle inferieur
forall (j in 2..N-1)
 sum (i in j..N) X[i][j+N-i] <= 1;
 
//une reine max par diagonale descendante, triangle superieur
forall (j in 1..N-1)
 sum (i in 1..N-j+1) X[i][j+i-1] <= 1;
 
//une reine max par diagonale descendante, triangle inferieur
forall (i in 2..N-1)
 sum (j in 0..N-i) X[i+j][j+1] <= 1;
}

//----------------------------POST TRAITEMENT--------------------------------
execute Display{
	  for(var i in I){
	    for(var j in I){
	      
	      	if(X[i][j] == 1)
	      	  write("| R");

	      	else
	      	  write("| ");	
	    }
	    write("|\n");
	  }  
  
}