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
                cylinder(r=9.5, h=5.1) 
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