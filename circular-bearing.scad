$fs = 0.5;
module circular_bearing(diameter, internal_diameter, length) {
    color("grey")
    difference() {
        cylinder( h=length,d=diameter);
        translate([0,0,-0.5])
        cylinder(h=length + 1, d= internal_diameter); 
    }
}

circular_bearing(19,10,5);