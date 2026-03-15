use <../non-printable-components/9g_servo.scad>
use <../modules/pi-mount.scad>
use <MCAD/boxes.scad>
use <../non-printable-components/circular-bearing.scad>
$fs = 0.5;
$fa=1;
module in_eye_joint_inner() {
    difference(){
        union(){
            //translate([0,0,-11])
            //cylinder(r=17,h=11);
            translate([-4,1,-5.5])
            roundedBox([30,29,11], radius=3, sidesonly=true);
            rotate([90,0,0])
            translate([0,0,12])
            cylinder(r=11, h=6);
            
        }
        translate([-5.5,3,0])
        cube([23.4,22.4,12.5], center=true);
        rotate([90,0,0])
        cylinder(r=6.2,h=26);
        
        translate([-5.5,-2,0]) cube([32.4,2.4,12], center=true);
    
        translate([-5.5,2.8,0])
     rotate([90,0,0])
        translate([-0.5,0,2.75]) cylinder(r=1.2, h=25.75, $fn=20, center=true);
       
        translate([-6.5,0,0])
        cube([5.4,24.5,5.6], center=true);
        rotate([90,0,0])
        translate([0,0,13])
        cylinder(r=9.6, h=12);
        
        rotate([-90,0,0])
        translate([0,0,15.8])
        cylinder(r=14, h=12);
    }
    
    rotate([-90,0,0])
    translate([0,0,14.2])
    cylinder(r=5,h=6);

}

module in_eye_joint_outer_l() {
    intersection(){
        union(){
    difference(){
        hull(){
    rotate([-90,0,0])
    translate([0,0,16])
    cylinder(r=11, h=5.5);
            rotate([-90,0,0])
    translate([-20,0,16])
    cylinder(r=11, h=5.5);
        }
        
        
        
        rotate([-90,0,0])
    translate([0,0,15.99])
    cylinder(r=9.5, h=5.1);
        
    }
    }
    sphere(25);
}
}

module in_eye_joint_outer_r() {
    intersection(){
        union(){
    difference(){
        hull(){
    rotate([90,0,0])
    translate([0,0,16])
    cylinder(r=11, h=5.5);
            rotate([90,0,0])
    translate([-20,0,16])
    cylinder(r=11, h=5.5);
        }
        
        
        
        rotate([90,0,0])
    translate([0,0,15.99])
    cylinder(r=11.2, h=3);
        
    }
    
    rotate([90,0,0])
    translate([0,0,13])
    cylinder(r=5, h=6);
}
    sphere(25);
}
}

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

module eyeball(camera_mount_x,camera_mount_z) {
    pi_camera_mount_no_supports([camera_mount_x,0,camera_mount_z],[90,0,-90])
difference(){
    hull(){
        sphere(25);
        translate([camera_mount_x,11,camera_mount_z + 10])
        rotate([0,-90,0])
        cylinder(r=3,h=2);
        translate([camera_mount_x,-11,camera_mount_z + 10])
        rotate([0,-90,0])
        cylinder(r=3,h=2);
        translate([camera_mount_x,11,camera_mount_z-10])
        rotate([0,-90,0])
        cylinder(r=3,h=2);
        translate([camera_mount_x,-11,camera_mount_z-10])
        rotate([0,-90,0])
        cylinder(r=3,h=2);
    }
    hull(){
    translate([10,0,0])
    rotate([0,-90,0])
    cylinder(r=17.5,h=40);
    translate([0,0,-40])
    cylinder(h=30,r=17.5);
    }
    hull() {
        translate([camera_mount_x-2,11,camera_mount_z + 10])
        rotate([0,-90,0])
        cylinder(r=3,h=90);
        translate([camera_mount_x-2,-11,camera_mount_z + 10])
        rotate([0,-90,0])
        cylinder(r=3,h=90);
        translate([camera_mount_x-2,11,camera_mount_z - 10])
        rotate([0,-90,0])
        cylinder(r=3,h=90);
        translate([camera_mount_x-2,-11,camera_mount_z - 10])
        rotate([0,-90,0])
        cylinder(r=3,h=90);
    }
    
    translate([25 + camera_mount_x,0,0])
    cube([50,50,50],center=true);
    
    hull() {
        rotate([-90,0,0])
    translate([0,0,16])
    cylinder(r=11.2, h=5.6);
            rotate([-90,0,0])
    translate([-20,0,16])
    cylinder(r=11.2, h=5.6);
        
         rotate([90,0,0])
    translate([0,0,16])
    cylinder(r=11.2, h=5.6);
            rotate([90,0,0])
    translate([-20,0,16])
    cylinder(r=11.2, h=5.6);
        }
        
}
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