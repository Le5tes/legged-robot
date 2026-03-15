$fs=0.5;
//$fa=1;

use <MCAD/regular_shapes.scad>
use <MCAD/boxes.scad>
use <../non-printable-components/9g_servo.scad>
use <../non-printable-components/circular-bearing.scad>
use <../modules/barrel_joint.scad>
use <../modules/servo_connection_rod.scad>
use <../non-printable-components/m2-bolt-hole.scad>
use <../non-printable-components/pi-mount.scad>

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
            // TODO include this file in this repo
            import("../non-printable-components/XT60male.stl"); 
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
    // TODO - include this file in this repo - also move where it's rendered to main
    //import("../non-printable-components/raspberry_pi_3_b_plus.stl");
}

base();
    