$fs=0.5;

use <MCAD/regular_shapes.scad>
use <MCAD/boxes.scad>

include <../joint_points.scad>

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

base_1();