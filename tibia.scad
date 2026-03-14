use <barrel_joint.scad>

$fs=0.5;

module bolt_hole(width) {
    rotate([90,0,0]){
            translate([0,0,width/2-2])
            cylinder(r=3,h=50);
            translate([0,0,-width/2+2])
            rotate([180,0,0])
            cylinder(r=3,h=50);
        
            translate([0,0,-25])
            cylinder(r=1.5,h=50);
        }
    }

module tib_1_main(length=150, inverse = false) {
    inversion = inverse ? -1 : 1;
    difference(){
        union() {
            rotate([90,0,-90])
            barrel_joint_attachment(22);
            
            hull(){
                translate([20,0,0])
                cube([4,48,22],center=true);
                
                translate([length,0,-5])
                sphere(6);
            
            }
        }
        
        translate([20,0,0])
        bolt_hole(48);
        
        translate([length - 40,0,-4])
        bolt_hole(24);
        
        translate([length/2,20 * inversion,0])
        cube([length + 50,40,80], center=true);
        
    }
};

module tib_1(){
    tib_1_main();
    tib_1_main(inverse=true);
}

tib_1_main();
