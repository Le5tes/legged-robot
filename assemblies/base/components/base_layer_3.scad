$fs=0.5;

use <MCAD/regular_shapes.scad>
use <MCAD/boxes.scad>
use <../../../modules/pi-mount.scad>

module base_3() {
    pi_mount(rotation_vector=[0,0,90]) {
        difference() {
            union() {
                roundedBox( size=[134,120,3], radius=30, sidesonly=true);
                translate([55,0,-1])
                cylinder(r=10.5,h=5);
            }
            translate([0,-45,0])
            cube([80,8,20],center=true);
            translate([0,45,0])
            cube([80,8,20],center=true);
            translate([55,0,-1])
            cylinder(r=9.6,h=6);
            translate([55,0,-3])
            cylinder(r=5.1,h=6);
        }
    }
}