/*********************************************
 * OPL 22.1.1.0 Model
 * Author: ayman
 * Creation Date: 29 nov. 2024 at 09:16:55
 *********************************************/

	// Formulation du problème
int nbObjet = ...;
int poidsMax = ...;
range objects = 1..nbObjet;
int poids[objects]= ...;
int valeur[objects]= ...;
dvar boolean x[objects];
maximize 
	 sum(i in objects) valeur[i] * x[i];
	subject to {
	 sum(i in objects)
	 poids[i] * x[i] <= poidsMax;  
	}
				
					
					
					