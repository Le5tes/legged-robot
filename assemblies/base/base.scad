$fs=0.5;
//$fa=1;

use <MCAD/regular_shapes.scad>
use <MCAD/boxes.scad>
use <../../non-printable-components/servo.scad>
use <../../non-printable-components/circular-bearing.scad>
use <../../modules/barrel_joint.scad>
use <../../modules/servo_connection_rod.scad>
use <../../non-printable-components/m2-bolt-hole.scad>
use <../../non-printable-components/pi-mount.scad>
use <components/base_layer_1.scad>
use <components/base_layer_2.scad>
use <components/base_layer_3.scad>

module base() {
    base_1();
    translate([0,0,10.5])
    base_2();
    translate([0,0,42])
    base_3();
    
    //translate([0,0,47])
    //rotate([0,0,0])
    //color("green")
    //import("../non-printable-components/raspberry_pi_3_b_plus.stl");
}

base();
    