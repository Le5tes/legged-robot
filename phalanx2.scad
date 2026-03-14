$fs = 0.5;
use <foot-common-parts.scad>

module phalanx2() {
    difference() {
        union() {
            tendonAttachments(5,6,3,-7){
                translate([20,0,-9])
                cylinder(r=3,h=2);
                translate([10,0,-9])
                cylinder(r1=5,r2=5.5,h=4);  
            }
            jointUpper() {
                translate([20,0,-9])
                cylinder(r=3,h=2); 
            }
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
        
    }
}

phalanx2();