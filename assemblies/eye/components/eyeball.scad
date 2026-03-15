use <../../../modules/pi-mount.scad>

$fs = 0.5;
$fa=1;

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