use <../modules/barrel_joint.scad>
use <../non-printable-components/servo.scad>

$fs=0.5;

module fem_1_main(length=150) {
    difference(){
        union() {
            translate([0,0,1.5])
            difference() {
                hull() {
                    translate([0,0,5.5])
                    cylinder(r=10, h=3);
                    translate([30,0,3])
                    cube([5,42,11], center=true);
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

            translate([length,21,11])
            rotate([90,0,0])
            barrel_joint_split_24g(24,19);
            difference() {
                translate([(length-60)/2 + 30,0,11])
                cube([length-60,42,24], center=true);
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
            translate([0,0,21.5])
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
            cube([5,42,3], center=true);
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
    translate([length,21,11])
    rotate([90,0,0])
    barrel_joint_split_24g(24,19,true);
    
    
    translate([length - 7.6,0,11])
    rotate([90,0,0])
    24g_motor();
    
    fem_1_main(length);
    translate([0,0,21.5])
    fem_1_attachment();
}


//fem_1_main();
//fem_1_attachment();
fem_1();