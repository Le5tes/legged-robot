$fs = 0.5;
use <phalanx2.scad>
use <foot-common-parts.scad>

module phalanx1() {
    difference() {
        union() {
            tendonAttachments(3,7,3,-7) {
                translate([15,0,0])
                rotate([90,0,0])
                translate([0,0,-3])
                cylinder(r=2,h=6);
                
                translate([3,0,0])
                rotate([90,0,0])
                translate([0,0,-3])
                cylinder(r=2,h=6);
                
                translate([8,0,-9])
                cylinder(r=6,h=2);
                
                translate([22,0,-9])
                cylinder(r=6,h=2);
                
                rotate([90,0,0])
                translate([24,0,-2])
                cylinder(h=4,r=4);
                
                translate([6,4,7])
                rotate([0,90,0])
                cylinder(h=14,r=2);
                translate([6,-4,7])
                rotate([0,90,0])
                cylinder(h=15,r=2);
            }
            jointUpper() {
                translate([3,0,0])
                rotate([0,90,0])
                cylinder(r=6,h=16);                    
                
                translate([12,0,-9])
                cylinder(r=6,h=2);
                
                translate([22,0,-9])
                cylinder(r=6,h=2);
                
                rotate([90,0,0])
                translate([22,0,-4.9])
                cylinder(h=9.8,r=4);
                
            }
            jointLower(30);
            
            translate([6,4,7])
            rotate([0,90,0])
            cylinder(h=14,r=2);
            translate([6,-4,7])
            rotate([0,90,0])
            cylinder(h=15,r=2);
        }
        
        hull(){
            rotate([90,0,0]) {
                translate([0,0,-5])
                cylinder(h=10,r=5);
                translate([-8,5,-5])
                cylinder(h=10,r=5);

                translate([-8,-5,-5])
                cylinder(h=10,r=5);
            }
        }
        
        translate([0,4,7])
        rotate([0,90,0])
        cylinder(h=40,r=1);
        translate([0,-4,7])
        rotate([0,90,0])
        cylinder(h=40,r=1);
        
        translate([0,4,-7])
        rotate([0,90,0])
        cylinder(h=40,r=1);
        translate([0,-4,-7])
        rotate([0,90,0])
        cylinder(h=40,r=1);
    }
}

phalanx1();

//translate([30,0,0])
//phalanx2();
