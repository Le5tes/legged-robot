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
         hull() {
            cylinder(d=diameter, h=42);
            translate([-15,0,21])
            cube([30, diameter, 42], center=true);
        }
        translate([0,0,-1])
        cylinder(d=bearing_size,h=6);
        translate([0,0,37])
        cylinder(d=bearing_size,h=6);
        translate([-7.6, 0,21])
        24g_motor();
        hull() {
            translate([0,0,6])
            cylinder(r=8.3,h=31.01);
            translate([-21,0,21.505])
            cube([20,16.6,31.01], center=true);
            
        }
        translate([0,0,29.5])
        cube([diameter, 16, 2.6], center=true);
        translate([0,20 * inversion,0])
        cube([65,40,85], center=true);
        
        translate([-16,20,2.5])
        rotate([90,0,0])
        cylinder(d=3,h=40);
        translate([-16,20,39.5])
        rotate([90,0,0])
        cylinder(d=3,h=40);
        
        translate([-10,0,11])
        cube([42,5,11], center=true);
    }
}

module barrel_joint_attachment(diameter, width) {
     translate([0,0,-18]) {
                rotate([90,0,90])
                roundedBox(size=[diameter,4, width], radius=1, sidesonly=true);
            }
            translate([-width/2,0,0])
            rotate([0,90,0]){
            hull() {
                translate([diameter/2,0,2])
                roundedBox(size=[diameter,diameter,4],radius=1, sidesonly=true);
                cylinder(d=diameter, h=4);
            }
            cylinder(h=10,r=5);
        }
            
            translate([width/2,0,0])
            rotate([180,90,0]){
            hull() {
                translate([diameter/2,0,2])
                roundedBox(size=[diameter,diameter,4],radius=1, sidesonly=true);
                cylinder(d = diameter, h=4);
            }
            cylinder(h=10,r=5);
        }
}

//barrel_joint_split_24g(24,19);
//translate([-7.6,0,21])
//24g_motor();
//barrel_joint(22,19);
//translate([-5.5, 0,17])
//9g_motor();

barrel_joint_attachment(22,52);