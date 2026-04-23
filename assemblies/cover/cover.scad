$fs=0.5;
module rounded_square_corners(x,y,r){
    x_offset = x/2-r;
    y_offset = y/2-r;
    translate([x_offset,y_offset,0])
    cylinder(r=r,h=0.2);
    translate([-x_offset,y_offset,0])
    cylinder(r=r,h=0.2);
    translate([x_offset,-y_offset,0])
    cylinder(r=r,h=0.2);
    translate([-x_offset,-y_offset,0])
    cylinder(r=r,h=0.2);
}

module cover() {
    difference() {
        hull(){
            rounded_square_corners(140,140,30);
            translate([0,0,31.5])
            rounded_square_corners(140,126,30); 
           
            translate([10,0,92])
            rounded_square_corners(80,90,25); 
            
        }

        hull(){
            translate([0,0,-0.001])
            rounded_square_corners(134,134,30);
            translate([0,0,31.501])
            rounded_square_corners(134,120,30); 
           
            translate([10,0,90])
            rounded_square_corners(74,84,25);  
        }
        translate([-64,24,13.5])
            cube([12.1,12.1,30.1], center=true);
        
        translate([55,0,74])
        sphere(r=26);
    }
}

cover();