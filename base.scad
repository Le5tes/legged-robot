$fs=0.5;
//$fa=1;

use <components/9g_servo.scad>
use <components/circular-bearing.scad>
use <barrel_joint.scad>
use <servo_connection_rod.scad>
use <femur.scad>
use <tibia.scad>
use <Cover.scad>
use <MCAD/regular_shapes.scad>
use <MCAD/boxes.scad>
use<../robot-chassis/m2-bolt-hole.scad>
use <../robot-chassis/pi-mount.scad>
use <eye.scad>

joint_point_LF= [30,30,-2];
joint_point_RF= [30,-30,-2];

joint_point_LH= [-30,30,-2];
joint_point_RH= [-30,-30,-2];
joint_point_2 = [0,25,-14];

module battery_box() {
    difference() {
        union() {
            translate([0,5,15.3])
            cube([42,110, 29], center=true);
            translate([4.5,-53,15.3])
            cube([51,20, 29], center=true);
            translate([-24,-64,15])
            cube([12,12,30], center=true);   
        }
        translate([0,5,15])
        cube([36,101, 30], center=true);
        translate([0,-5,16])
        cube([36,101, 28], center=true);
        translate([4.5,-58,16])
        cube([45,24, 28], center=true);
        
        translate([-24,-57.5,23.5])
        rotate([90,0,0])
        m2_bolt_hole();
        
        translate([-24,-57.5,8.5])
        rotate([90,0,0])
        m2_bolt_hole();
        
        translate([-24,-57.5,16])
        cube([5,30,10.5], center=true);
    
        translate([30,-55,0])
        rotate([0,0,-90])
        translate([-138,-135, 5]) // To put it at 0,0
        hull(){
             import("/media/tim/C4B21AEAB21AE12A/3D printer designs/Robotics/XT60+connector/files/XT60male.stl");
        }
    }

}

module base_1(){
    difference(){
        translate([0,0,-1])  
        roundedBox( size=[100,100,5], radius=20, sidesonly=true);
        
        translate(joint_point_LF)
        translate([0,0,1])
        cylinder(h=6, d=20);
        translate(joint_point_RF)
        translate([0,0,1])
        cylinder(h=6, d=20);
        translate(joint_point_LH)
        translate([0,0,1])
        cylinder(h=6, d=20);
        translate(joint_point_RH)
        translate([0,0,1])
        cylinder(h=6, d=20);
        
        translate(joint_point_LF)
        translate([0,0,-3])
        cylinder(h=6, d=16);
        translate(joint_point_RF)
        translate([0,0,-3])
        cylinder(h=6, d=16);
        translate(joint_point_LH)
        translate([0,0,-3])
        cylinder(h=6, d=16);
        translate(joint_point_RH)
        translate([0,0,-3])
        cylinder(h=6, d=16);
    }
    
    difference(){
        translate([0,0,7.25])
        roundedBox( size=[100,100,11.5], radius=20, sidesonly=true);
        
        translate([50,50,-1])
        cylinder(h=20, d=80);
        translate([50,-50,-1])
        cylinder(h=20, d=80);
        translate([-50,50,-1])
        cylinder(h=20, d=80);
        translate([-50,-50,-1])
        cylinder(h=20, d=80);
        
        translate(joint_point_LF)
        translate([-5.5,0,17])
        cube([24,13,10],center=true);
        
        translate(joint_point_RF)
        translate([-5.5,0,17])
        cube([24,13,10],center=true);
        
        translate(joint_point_LH)
        translate([5.5,0,17])
        cube([24,13,10],center=true);
        
        translate(joint_point_RH)
        translate([5.5,0,17])
        cube([24,13,10],center=true);
    }
}

module base_2() {
    difference(){
        roundedBox( size=[140,140,3], radius=30, sidesonly=true);
        
        translate(joint_point_LF)
        translate([-5.5,0,0])
        cube([24,13,10],center=true);
        
        translate(joint_point_RF)
        translate([-5.5,0,0])
        cube([24,13,10],center=true);
        
        translate(joint_point_LH)
        translate([5.5,0,0])
        cube([24,13,10],center=true);
        
        translate(joint_point_RH)
        translate([5.5,0,0])
        cube([24,13,10],center=true);
        
        translate([50,50,-5])
        cylinder(r=5,h=10);
        translate([50,-50,-5])
        cylinder(r=5,h=10);
        translate([-50,50,-5])
        cylinder(r=5,h=10);
        translate([-50,-50,-5])
        cylinder(r=5,h=10);
    }
    rotate([0,0,-90])
    battery_box();
}


module base_3() {
    pi_mount(rotation_vector=[0,0,90]) {
        difference() {
            roundedBox( size=[134,120,3], radius=30, sidesonly=true);
            translate([0,-45,0])
            cube([80,8,20],center=true);
            translate([0,45,0])
            cube([80,8,20],center=true);
        }
    }
}


module base() {
    base_1();
    translate([0,0,14.5])
    base_2();
    translate([0,0,46])
    base_3();
    
    //translate([0,0,51])
    //rotate([0,0,0])
    //color("green")
    //import("../robot-chassis/other-parts/raspberry_pi_3_b_plus.stl");
}

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
//translate([0,0,100])
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
    