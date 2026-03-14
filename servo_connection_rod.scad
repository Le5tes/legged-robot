$fs=0.5;

module servo_connection_rod() {
    difference() {
        hull(){
            cube([5,10,16],center=true);
            translate([0,0,-8])
            cylinder(r=3.5, h=16);
        }
        translate([0,0,-10])
        difference() {
            cylinder(r=10, h=20);
            cylinder(r=5, h=20);
        }
    }
    translate([0,0,-5])
    cylinder(r=5, h=10);
}

rotate([90,0,0])
servo_connection_rod();