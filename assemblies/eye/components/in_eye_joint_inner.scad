use <MCAD/boxes.scad>
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

in_eye_joint_inner();