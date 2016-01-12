
house(4,3,2,6,11,1);
house(7,4,3,12,3,1);
house(6,5,5,-7,5,1);
house(4,4,4,3,2,1);



//Haus mit den Maßen (lx,ly,lz) 
//lx=[4-9], ly=[4-7], lz=[3-9] aus Gründen der Ästhetik ^.^
//ly = Höhe
//Position px,pz
//s_window: wenn 1 dann haben die Seiten auch Fenster, wenn 0, dann sind nur vorne und hinten Fenster

module house(lx,ly,lz,px,pz,s_window)
{
    
    //Haus
    translate([px,(ly/2),pz]){
        color([139/255,119/255,101/255]){
    cube([lx,ly,lz],center = true);
        }
    }
   
    
    //Dach 
    //stehen auf jeder Seite um 0.1 über
    translate([px,(ly+ly/6),pz])
    rotate([0,0,90])
    color([51/255,51/255,51/255])
    resize([ly/2,(lx+0.2),(lz+0.2)])    
    cylinder(h=(ly/3), r1=2, r2=2,center=true, $fn=3);
    
    
    
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
