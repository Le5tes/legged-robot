$fs=0.5;

module servo_connection_rod() {
    difference() {
        union() {
            hull(){
                    translate([0,0,7])
                    cube([5,15,4],center=true);
                    translate([0,0,5])
                    cylinder(r=5, h=4);
                }
            
            difference() {
                
                 hull(){
                    translate([0,0,-6.5])
                    cube([10,5,7],center=true);
                    translate([0,0,-10])
                    cylinder(r=3, h=7);
                }
                
                translate([0,0,-11])
                difference() {
                    cylinder(r=10, h=10);
                    cylinder(r=5, h=10);
                }
            }
            translate([0,0,-3.9])
            cylinder(r=5, h=9);
        }
        
        //servo horn
        translate([0,0,6])
        hull(){
            cylinder(d=8, h=9);
            translate([17.1,0,0])
            cylinder(d=5,h=9);
        }
    } 
}

//rotate([0,-90,0])
servo_connection_rod();