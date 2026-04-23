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
        translate([0,0,5.25])
        roundedBox( size=[100,100,7.5], radius=20, sidesonly=true);
        
        translate([50,50,-1])
        cylinder(h=20, d=80);
        translate([50,-50,-1])
        cylinder(h=20, d=80);
        translate([-50,50,-1])
        cylinder(h=20, d=80);
        translate([-50,-50,-1])
        cylinder(h=20, d=80);
        
        translate(joint_point_LF)
        translate([-7.6,0,13])
        cube([42,16.6,10],center=true);
        
        translate(joint_point_RF)
        translate([-7.6,0,13])
        cube([42,16.6,10],center=true);
        
        translate(joint_point_LH)
        translate([7.6,0,13])
        cube([42,16.6,10],center=true);
        
        translate(joint_point_RH)
        translate([7.6,0,13])
        cube([42,16.6,10],center=true);
    }
}

base_1();