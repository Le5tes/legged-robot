$fs=0.5;

use <MCAD/regular_shapes.scad>
use <MCAD/boxes.scad>
use <../../../modules/m2-bolt-hole.scad>

include <../joint_points.scad>

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
            import("../../../non-printable-components/XT60male.stl"); 
        }
    }

}

module base_2() {
    difference(){
        union() {
            roundedBox( size=[140,140,3], radius=30, sidesonly=true);

            //raised mounts for servos
            translate([0,30,3.5])
            cube([90,20,4], center=true);
            translate([0,-30,3.5])
            cube([90,20,4], center=true);
        }
        
        //holes for servos
        translate(joint_point_LF)
        translate([-7.6,0,0])
        cube([31.5,16.6,20],center=true);
        
        translate(joint_point_RF)
        translate([-7.6,0,0])
        cube([31.5,16.6,20],center=true);
        
        translate(joint_point_LH)
        translate([7.6,0,0])
        cube([31.5,16.6,20],center=true);
        
        translate(joint_point_RH)
        translate([7.6,0,0])
        cube([31.5,16.6,20],center=true);
        
        //holes for wires
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