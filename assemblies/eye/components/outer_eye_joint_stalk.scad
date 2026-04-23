use <MCAD/boxes.scad>
$fs = 0.5;
$fa=1;

module outer_eye_joint_stalk() {
    difference(){
        union(){
            translate([-5,0,-13])
            roundedBox([20,26,4], radius=2, sidesonly=true);
            translate([-5,0,-11])
            cube([20,22,4], center=true);
        }
        translate([0,0,-1])
        cube([50,20,24], center=true);
    }
    translate([0,0,-47])
    cylinder(r=5,h=32);

}

outer_eye_joint_stalk();