/*
house(4,3,2,6,11,1);
house(7,4,3,12,3,1);
house(6,5,5,-7,5,1);
house(4,4,4,3,2,1);
*/

/*Beispiel-Code:
random_vect=rands(5,15,4);
echo( "Random Vector: ",random_vect);
sphere(r=5);
for(i=[0:3]) {
 rotate(360*i/4) {
   translate([10+random_vect[i],0,0])
     sphere(r=random_vect[i]/2);
 }
}*/
//Häuserreihe

Strasse(8);

//Eine Straße mit n Häusern. Die stehen sich gegenüber.
module Strasse(anzahlHaeuser = 10) {
    
    xPos = 0;
    randNum = rands(3,10,4);
    
    for(i=[0:anzahlHaeuser-1]) {
            translate([randNum[0]*i+1*i,0,-randNum[2]/2-5]) {
                house(randNum[0],randNum[1],randNum[2],0,0,1,randNum[3]/2);
            }
        }
        
    mirror([0,0,1]) {
        for(i=[0:anzahlHaeuser-1]) {
            translate([randNum[0]*i+1*i,0,-randNum[2]/2-5]) {
                house(randNum[0],randNum[1],randNum[2],0,0,1,randNum[3]);
            }
        }
    }
}

/*
module house Parameter:
-Breite (X-Achse)
-Höhe (Y-Achse)
-Tiefe (Z-Achse)
-X-Position
-Z-Position
-Ob es Fenster an den Seiten hat (0 oder 1)

*/

//Haus mit den Maßen (lx,ly,lz) 
//lx=[4-9], ly=[4-7], lz=[3-9] aus Gründen der Ästhetik ^.^
//ly = Höhe
//Position px,pz
//s_window: wenn 1 dann haben die Seiten auch Fenster, wenn 0, dann sind nur vorne und hinten Fenster

module house(lx,ly,lz,px,pz,s_window,h_baum)
{
    
    //Haus
    translate([px,(ly/2),pz]){
        color([139/255,119/255,101/255]){
    cube([lx,ly,lz],center = true);
        }
    }

    //Garten
    translate([px,0.5,pz-lz]){
       color("Goldenrod"){
   		  	difference() {
				cube([lx,1,lz],center = true);
				translate([0,0,0.125]) 
					cube([lx-0.25,1.1,lz],center = true);
			}
       }
		 color("LawnGreen"){
			translate([0,-0.5,0])
				cube([lx,0.05,lz],center = true);
		 }
    }
	
	 //BaumImGarten
	 translate([px+lx*0.25,0,pz-lz*1.25]){
	  	 color("SaddleBrown")
		 rotate([-90,0,0])
		 cylinder(h_baum,0.25,0.25,false,$fn=20);
		 color("Green")
		 translate([0,h_baum,0])
		 sphere(1,$fn=10);
 	 }
    
    //Dach 
    //stehen auf jeder Seite um 0.1 über
    translate([px,(ly+ly/6),pz])
    rotate([0,0,90])
    color([51/255,51/255,51/255])
    resize([ly/2,(lx+0.2),(lz+0.2)])    
    cylinder(h=(ly/3), r1=2, r2=2,center=true, $fn=3);
    
    //Schornstein
    //translate([(3/4)*px,ly,lz/2])
    translate([px+(1/4)*lx,ly,pz]) 
        cube([(1/5)*lx,ly/2,(1/5)*lz]);
    
    
    //Fenster v/h und Tür 
    translate([px,(ly/2),pz]){   
        
    color([238/255,221/255,130/255]){
        
    translate([(-lx/5),(-ly/5),0])
    cube([(lx/5), (ly/5), (lz+0.1)], center = true);
    
    translate([(-lx/5),(+ly/5),0])
    cube([(lx/5), (ly/5), (lz+0.1)], center = true);
    
    translate([(+lx/5),(+ly/5),0])
    cube([(lx/5), (ly/5), (lz+0.1)],center = true);
    
    //Tür
    translate([(+lx/5),(-ly/5-ly/10),0])
    cube([(lx/5), (ly*2/5), (lz+0.1)],center = true);
          
    }//Color-Ende
    
    }//translate-Ende
    
     
    
    //Fenster Seitenwände
    if (s_window == 1) {
        
    translate([px,(ly/2),pz]){
        
        
    color([238/255,221/255,130/255]){
        
    translate([0,(ly/5),(lz/5)])
    cube([(lx+0.1), (ly/5), (lz/5)], center = true);
    
    translate([0,(ly/5),(-lz/5)])
    cube([(lx+0.1), (ly/5), (lz/5)], center = true);
    
    translate([0,(-ly/5),(lz/5)])
    cube([(lx+0.1), (ly/5), (lz/5)],center = true);
    
    translate([0,(-ly/5),(-lz/5)])
    cube([(lx+0.1), (ly/5), (lz/5)],center = true);
         
        
    }//color-Ende
    
    }//translate-Ende
    
    } // if (s_window == 1) Ende
    
}//house-Ende
