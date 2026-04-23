module half_view() {
    difference(){
        children();

        translate([0,100,0])
        cube([500,200,500], center=true);
    }
}