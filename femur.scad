use <barrel_joint.scad>
use <9g_servo.scad>

$fs=0.5;

module fem_1_main(length=150) {
    difference(){
        union() {
            translate([0,0,1.5])
            difference() {
                hull() {
                    translate([0,0,4.5])
                    cylinder(r=10, h=3);
                    translate([30,0,3])
                    cube([5,38,9], center=true);
                }
                difference() {
                    hull(){
                        cube([5.2,10.2,16],center=true);
                        translate([0,0,-8])
                        cylinder(r=3.6, h=16);
                    }
                    translate([0,0,-10])
                    difference() {
                        cylinder(r=10, h=20);
                        cylinder(r=5.2, h=20);
                    }
                }
            }

            translate([length,19,11])
            rotate([90,0,0])
            barrel_joint_split(22,19);
            difference() {
                translate([(length-54)/2 + 30,0,11])
                cube([length-50,38,22], center=true);
                translate([55,0,11])
                rotate([0,90,0])
                cylinder(r=5,h=length-55);
                translate([55,0,11])
                sphere(r=5);
                translate([55,0,11])
                cylinder(r=5,h=50);
            }
        }
        hull(){
            translate([0,0,20.5])
            fem_1_attachment();
            translate([0,0,22])
            fem_1_attachment();
        }
        
        translate([35,7,11])
        cylinder(r=1.5,h=10);
        translate([35,-7,11])
        cylinder(r=1.5,h=10);
    }
}

module fem_1_attachment() {
    difference() {
        hull() {
            translate([0,0,-1.5])
            cylinder(r=10, h=3);
            translate([30,0,0])
            cube([5,38,3], center=true);
            translate([40,0,-1.5])
            cylinder(r=6, h=3);
        }
       difference() {
            hull(){
                cube([5.2,10.2,16],center=true);
                translate([0,0,-8])
                cylinder(r=3.6, h=16);
            }
            translate([0,0,-10])
            difference() {
                cylinder(r=10, h=20);
                cylinder(r=5.2, h=20);
            }
        }
        
        translate([35,7,-5])
        cylinder(r=1.5,h=10);
        translate([35,-7,-5])
        cylinder(r=1.5,h=10);
    }
    
}

module fem_1(length=150) {
    translate([length,19,11])
    rotate([90,0,0])
    barrel_joint_split(22,19,true);
    
    
    translate([length - 5.5,2,11])
    rotate([90,0,0])
    9g_motor();
    
    fem_1_main(length);
    translate([0,0,20.5])
    fem_1_attachment();
}


//fem_1_main();
//fem_1_attachment();
fem_1();