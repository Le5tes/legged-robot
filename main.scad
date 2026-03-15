$fs=0.5;
//$fa=1;

use <MCAD/regular_shapes.scad>
use <MCAD/boxes.scad>
use <non-printable-components/9g_servo.scad>
use <non-printable-components/circular-bearing.scad>
use <modules/m2-bolt-hole.scad>
use <modules/pi-mount.scad>
use <modules/barrel_joint.scad>
use <modules/servo_connection_rod.scad>
use <assemblies/femur.scad>
use <assemblies/tibia.scad>
use <assemblies/cover/cover.scad>
use <assemblies/eye/eye.scad>
use <assemblies/base/base.scad>

include <assemblies/base/components/joint_points.scad>

module rotational_joint() {
    difference(){
            union(){
                translate([0,0,24.5])
                hull() {
                    translate([0,0,13.25])
                    roundedBox(size=[46,20,26.5],radius=1,sidesonly=true);
                    cylinder(r=15,h=26.5);
                }
                cylinder(r=12,h=25);
            }
            translate([0,0,-0.5])
            cylinder(d=19,h=26);
            translate([-5.5,0, 41])
            rotate([180,0,0])
            9g_motor();
            translate([-5.5,0, 45])
            roundedBox(size=[42,13,20],radius=1,sidesonly=true);
        }
}


module hip_attachment() {
    circular_bearing(19,10,5);
    translate([-5.5,0,24])
    rotate([180,0,0])
    9g_motor();

}


module leg_2_joint(inverse = false) {
    inversion = inverse ? -1 : 1;
    hip_attachment();
    
    rotate([0,0,45 * inversion]){
        servo_connection_rod();
        translate([0,0,-14])
        fem_1();
        
        translate([150,0,-3])
        rotate([0,45,0])
        tib_1();
    }
}

module leg_5_joint_dep() {

    // joint 1 moving parts
    circular_bearing(19,10,5);
    translate([-5.5,0,21])
    rotate([180,0,0])
    9g_motor();
    
    
    translate([0,0,-5])
    cylinder(r=5, h=10);
    
    translate([0,0,-14])
    rotate([0,90,0])
    difference(){
        hull() {
            translate([-6,0,0])
            cylinder(h=30, r=5, center=true);
            translate([0,25,0])
            cylinder(h=38, r=10.5, center=true);
        }
        translate([0,25,0])
        cylinder(h=39, r=9.5, center=true);
    }
    
    //roundedBox(size=[20,44,38],radius=9, sidesonly=true);

    // joint 2 moving parts

    translate(joint_point_2){
        translate([2,-5.5,0])
        rotate([-90,0,90])
        9g_motor();
    
        translate([2.5,0,0]) rotate([-90,0,90]) {
            translate([0,0,16.5])
            circular_bearing(19,10,5);
            translate([0,0,-16.5])
            circular_bearing(19,10,5);
        }
        
        barrel_joint_attachment(20);

        translate([-5.5,0, -30])
        rotate([180,0,0])
        9g_motor();
        
        translate([0,0,-71])
        rotational_joint();
        
        // joint 3 moving parts
        translate([0,0,-51]) {
            circular_bearing(19,10,5);
            
            translate([0,0,-20])
            circular_bearing(19,10,5);
            translate([0,0,-21])
            cylinder(r=5, h=27);
            translate([0,0,-26])
            cylinder(r=15,h=5);
            translate([0,0,-23])
            difference(){
                cylinder(r=15,h=27);
                translate([0,0,-0.5])
                cylinder(d=25,h=28);
            }
            
            translate([-19,0,-100])
            rotate([0,90,0])
            barrel_joint(21,19);
            translate([-2,0, -94.5])
            rotate([0,90,0])
            9g_motor();
            
            translate([-19,0,-100])
            rotate([0,90,0])
            circular_bearing(19,10,5);
            translate([14,0,-100])
            rotate([0,90,0])
            circular_bearing(19,10,5);
            
            // joint 4 moving parts
            translate([0,0,-100]){
                barrel_joint_attachment(20);
                
                translate([-5.5,0, -30])
                rotate([180,0,0])
                9g_motor();
                
                translate([0,0,-71])
                rotational_joint();
            
                // joint 5 moving parts
                translate([0,0,-51]) {
                    circular_bearing(19,10,5);
                    
                    translate([0,0,-20])
                    circular_bearing(19,10,5);
                    translate([0,0,-21])
                    cylinder(r=5, h=27);
                    translate([0,0,-26])
                    cylinder(r=15,h=5);
                    translate([0,0,-23])
                    difference(){
                        cylinder(r=15,h=27);
                        translate([0,0,-0.5])
                        cylinder(d=25,h=28);
                    }
                    
                    translate([-19,0,-100])
                    rotate([0,90,0])
                    barrel_joint(21,19);
                    translate([-2,0, -94.5])
                    rotate([0,90,0])
                    9g_motor();
                    
                    translate([-19,0,-100])
                    rotate([0,90,0])
                    circular_bearing(19,10,5);
                    translate([14,0,-100])
                    rotate([0,90,0])
                    circular_bearing(19,10,5);
                    
                    translate([0,0,-100]){
                    barrel_joint_attachment(20);
                    }
                }
            }
        }
    }
}



base();
// translate([0,0,100])
//color([0,1,1],0.3) // blue transparent
translate([0,0,16])
cover();

translate(joint_point_LF)
leg_2_joint();

translate(joint_point_RF)
leg_2_joint(inverse=true);

translate(joint_point_LH)
rotate([0,0,180])
leg_2_joint(inverse=true);

translate(joint_point_RH)
rotate([0,0,180])
leg_2_joint();

translate([60,0,90])
eye(yaw=0,pitch=0);