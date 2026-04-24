use <../non-printable-components/servo.scad>
use <MCAD/regular_shapes.scad>
use <MCAD/boxes.scad>
$fs = 0.5;
module barrel_joint(diameter, bearing_size) {
        difference() {
                hull() {
                    cylinder(d=diameter, h=38);
                    translate([-diameter/2,0,19])
                    cube([diameter, diameter, 38], center=true);
                }
                translate([0,0,-1])
                cylinder(d=bearing_size,h=6);
                translate([0,0,33])
                cylinder(d=bearing_size,h=6);
                translate([-5.5, 0,17])
                9g_motor();
                hull() {
                    translate([0,0,6])
                    cylinder(r=6,h=27);
                    translate([-20,0,19.6])
                    cube([20,13,28], center=true);
                    
                }
                translate([0,0,22])
                cube([diameter, 12.2, 2.2], center=true);
                translate([-16,0,2])
                rotate([0,-90,0])
                cylinder(d=3,h=8);
                translate([-16,0,36])
                rotate([0,-90,0])
                cylinder(d=3,h=8);
        }
        
}

module barrel_joint_split_9g(diameter, bearing_size, inverse=false) {
    inversion = inverse ? -1 : 1;
    difference() {
         hull() {
            cylinder(d=diameter, h=38);
            translate([-diameter/2,0,19])
            cube([diameter, diameter, 38], center=true);
        }
        translate([0,0,-1])
        cylinder(d=bearing_size,h=6);
        translate([0,0,33])
        cylinder(d=bearing_size,h=6);
        translate([-5.5, 0,17])
        9g_motor();
        hull() {
            translate([0,0,6])
            cylinder(r=6,h=27);
            translate([-20,0,19.6])
            cube([20,13,28], center=true);
            
        }
        translate([0,0,22])
        cube([diameter, 12.2, 2.2], center=true);
        translate([0,20 * inversion,0])
        cube([50,40,80], center=true);
        
        translate([-16,20,2.5])
        rotate([90,0,0])
        cylinder(d=3,h=40);
        translate([-16,20,35.5])
        rotate([90,0,0])
        cylinder(d=3,h=40);
    }
}

module barrel_joint_split_24g(diameter, bearing_size, inverse=false) {
    inversion = inverse ? -1 : 1;
    difference() {
        //main body
         hull() {
            cylinder(d=diameter, h=40);
            translate([-15,0,20])
            cube([30, diameter, 40], center=true);
        }
        // bearings
        translate([0,0,-1])
        cylinder(d=bearing_size,h=6);
        translate([0,0,36])
        cylinder(d=bearing_size,h=6);
        
        //make sure motor fits
        translate([-7.6, 0,20.6])
        24g_motor();
        
        //internal space
        hull() {
            translate([0,0,6])
            cylinder(r=8.3,h=30.01);
            translate([-21,0,21.05])
            cube([20,16.6,30.01], center=true);
            
        }
        //slot
        translate([0,0,29.1])
        cube([diameter, 16, 2.6], center=true);
        
        //for splitting in half
        translate([0,20 * inversion,0])
        cube([65,40,85], center=true);
        
        //bolt holes 
        translate([-16,20,2.5])
        rotate([90,0,0])
        cylinder(d=3,h=40);
        translate([-16,20,37.8])
        rotate([90,0,0])
        cylinder(d=3,h=40);
        
        //for wires
        translate([-10,0,11])
        cube([42,5,11], center=true);
    }
}

module barrel_joint_attachment(diameter, width) {
    //base
     translate([0,0,-22]) {
                rotate([90,0,90])
                roundedBox(size=[diameter,4, width], radius=1, sidesonly=true);
            }
            
            //-ve x side
            translate([-width/2,0,0])
            rotate([0,90,0]){
            hull() {
                translate([diameter/2,0,2])
                roundedBox(size=[diameter,diameter,4],radius=1, sidesonly=true);
                cylinder(d=diameter, h=4);
            }
            cylinder(h=10,r=5);
        }
            //+ve x side
        translate([width/2,0,0])
        rotate([180,90,0]){
        difference(){
            union() {
                hull() {
                    translate([diameter/2,0,2])
                    roundedBox(size=[diameter,diameter,4],radius=1, sidesonly=true);
                    cylinder(d = diameter, h=4);
                }
                cylinder(h=10,r=5);
            }
            
            //for servo horn
            translate([0,0,2])
            hull() {
                cylinder(d=8, h=9);
                translate([17.1,0,0])
                cylinder(d=5,h=9);
            }
        }
    }
}

//barrel_joint_split_24g(24,19);
//translate([-7.6,0,20.6])
//24g_motor_with_horn();
//barrel_joint(22,19);
//translate([-5.5, 0,17])
//9g_motor();

barrel_joint_attachment(22,49);