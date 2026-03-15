$fs=0.5;

use <MCAD/regular_shapes.scad>
use <MCAD/boxes.scad>

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