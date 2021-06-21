/*********************************************
 * OPL 12.10.0.0 Model
 * Author: HP
 * Creation Date: 21 juin 2021 at 00:10:19
 *********************************************/
int n = 20; 
range teams=1..n ;
range weeks=1..n-1;
range periods = 1..n div 2 ;

dvar boolean x[teams][teams][weeks][periods];



minimize 0 ; 


subject to {
  
// une équipe joue exactement  une fois par semaine 

forall ( k in weeks , i in teams ) 
    sum (p in periods ,j in teams : i != j ) ( x[i][j][k][p] + x[j][i][k][p] )  == 1 ; 
    

// chaque équipe joue un seul match avec l autre equipe 



forall(i in teams , j in teams  : i!=j)
  sum(p in periods , k in weeks ) (x[i][j][k][p] + x[j][i][k][p]) == 1 ;
  
 
 
// pas de match i i ou bien  j *  j

forall (i in teams )
   sum(p in periods , k in weeks ) x[i][i][k][p] == 0;

forall (i in teams )
   sum( k in weeks , p in periods ) x[i][i][k][p] == 0;
   
// une équipe ne joue pas plus de deux fois par période
  

forall ( p in periods , j in teams  )
sum (i in teams , k in weeks  )( x[i][j][k][p] + x[i][j][k][p] ) <= 2 ;




}