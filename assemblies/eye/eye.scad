use <../non-printable-components/9g_servo.scad>
use <../../non-printable-components/circular-bearing.scad>
use <components/in_eye_joint_inner.scad>
use <components/in_eye_joint_outer.scad>
use <components/eyeball.scad>
$fs = 0.5;
$fa=1;

module in_eye_joint() {
    in_eye_joint_inner();
    in_eye_joint_outer_l();
    
    in_eye_joint_outer_r();
    rotate([90,0,0])
    translate([0,0,13])
    circular_bearing(19,10,5);
    
    rotate([-90,0,0])
    translate([0,0,16])
    circular_bearing(19,10,5);
}





module eye(pitch = 0, yaw = 0) {
    rotate([0,0,90])
    translate([-5.5,0,-63])
    9g_motor();


    camera_mount_x = 20;
    camera_mount_z = 2;

    rotate([0,0,yaw]){
        translate([0,3,0])
        rotate([90,0,0])
        translate([-5.5,0,0])
        9g_motor();
        in_eye_joint();
        
        rotate([0,-pitch,0])
        eyeball(camera_mount_x,camera_mount_z);
    }
}
eye();