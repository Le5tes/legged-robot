module jointUpper() {
    difference() {
        hull() {
            children();
            rotate([90,0,0])
            translate([0,0,-8])
            cylinder(r=4,h=16); 
        }
         hull(){
            rotate([90,0,0]) {
                translate([0,0,-5])
                cylinder(h=10,r=5);
                translate([-5,10,-5])
                cylinder(h=10,r=5);

                translate([-5,-5,-5])
                cylinder(h=10,r=5);

            }
        }
        rotate([90,0,0])
        translate([0,0,-10]){
            cylinder(h=20,r=2.5);
        }
    }
}

module jointLower(x) {
    difference() {
    hull() {
                rotate([90,0,0])
                translate([x,0,-4.9])
                cylinder(h=9.8,r=4);
                
                rotate([90,0,0])
                translate([x-6,0,-4.9])
                cylinder(h=9.8,r=4);
                
                
            }
            rotate([90,0,0])
            translate([x,0,-8])
            cylinder(h=16,r=2.4);
        }
}

//creates a cylinder from [x1,y1,z1] to [x2,y2,z2] with radius r
module pointCylinder(x1,y1,z1,x2,y2,z2,r, extend=false) {
    x= x2-x1;
    y= y2-y1;
    z= z2-z1;
    
    x_vect = [y,-x,0]; // = cross([x,y,z],[0,0,1])

    y_vect = cross([x,y,z],x_vect);

    m = [
    [y/norm(x_vect),y_vect[0]/norm(y_vect),x,x1],
    [-x/norm(x_vect),y_vect[1]/ norm(y_vect),y,y1],
    [0,y_vect[2]/ norm(y_vect),z,z1],
    [0,0,0,1]
    ];

    multmatrix(m)
    if (extend){
        translate([0,0,-1])
        cylinder(r=r,h=3);
        }
    else 
    {cylinder(r=r,h=1);}
}

 module offset_3d(r=1, size=1000) {
     n = $fn==undef ? 12: $fn;
     if(r==0) children();
     else 
         if( r>0 )
             minkowski(convexity=5){
                 children();
                 sphere(r, $fn=n);
             }
         else {
             size2 = size*[1,1,1];// this will form the positv
             size1 = size2*2;    // this will hold a negative inside
             difference(){
                 cube(size2, center=true);// forms the positiv by substracting the negative
                 minkowski(convexity=5){
                     difference(){
                         cube(size1, center=true);
                         children();
                     }
                     sphere(-r, $fn=n);
                 }
             }
         }
 }

module tendonTube (x1,y1,z1,x2,y2,z2,smooth=true) {
    difference() {
        
            hull() {
            pointCylinder(x1,y1,z1,x2,y2,z2,2);
            children();
            
            }
            if (smooth) {
                difference() {
                    pointCylinder(x1,y1,z1,x2,y2,z2,1.5, true);
                    offset_3d(0.5)
                    offset_3d(-0.5)
                    difference(){
                        hull(){
                            pointCylinder(x1,y1,z1,x2,y2,z2,2);
                            children();
                        }
                        pointCylinder(x1,y1,z1,x2,y2,z2,1, true);
                    }    
               }
           }
           else {
               pointCylinder(x1,y1,z1,x2,y2,z2,1, true);
           }
        }
    }
    
module tendonAttachments (x1,z1,x2,z2) {
    difference() {
        hull() {
            children();
            translate([x1,0,z1])
            rotate([90,0,0])
            translate([0,0,-2])
            cylinder(r=2,h=4); 
            translate([x2,0,z2])
            rotate([90,0,0])
            translate([0,0,-2])
            cylinder(r=2,h=4);            
        }
        translate([x1,0,z1])
        rotate([90,0,0])
        translate([0,0,-10])
        cylinder(h=20,r=1);
        
        translate([x2,0,z2])
        rotate([90,0,0])
        translate([0,0,-10])
        cylinder(h=20,r=1);
    }
}
