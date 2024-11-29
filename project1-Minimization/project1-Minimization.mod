/*********************************************
 * OPL 22.1.1.0 Model
 * Author: ayman
 * Creation Date: 29 nov. 2024 at 10:01:00
 *********************************************/
 
// Minimization
dvar float x;
dvar float y;
minimize 
				3*x + 2*y;
				subject to{
					x - y >= 5;
					3*x + 2*y >= 10;  
				}