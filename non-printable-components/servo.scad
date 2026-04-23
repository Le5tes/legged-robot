24g_motor();

module 9g_motor(){
	difference(){			
		union(){
			color("blue") cube([23,12.5,22], center=true);
			color("blue") translate([0,0,5]) cube([32,12,2], center=true);
			color("blue") translate([5.5,0,2.75]) cylinder(r=6, h=25.75, $fn=20, center=true);
			color("blue") translate([-.5,0,2.75]) cylinder(r=1, h=25.75, $fn=20, center=true);
			color("blue") translate([-1,0,2.75]) cube([5,5.6,24.5], center=true);		
			color("white") translate([5.5,0,3.65]) cylinder(r=2.35, h=29.25, $fn=20, center=true);				
		}
		translate([10,0,-11]) rotate([0,-30,0]) cube([8,13,4], center=true);
		for ( hole = [14,-14] ){
			translate([hole,0,5]) cylinder(r=2.2, h=4, $fn=20, center=true);
		}	
	}
}

module 24g_motor(){
	difference(){			
		union(){
			color("black") cube([31.4,16.5,28.6], center=true);
			color("black") translate([0,0,8.55]) cube([42,16,2.5], center=true);
            
            color("black")
            hull() {
			 translate([7.6,0,0]) cylinder(r=8.2, h=15.3, $fn=20);
                translate([3.5,0,7.65])
                cube([8.2,16.4,15.3], center=true);

            }
            color("black")
            translate([-7.6,0,7.65])
                cube([10.5,16.4,15.3], center=true);
		
			color("gold") translate([7.6,0,4.15]) cylinder(r=2.9, h=29.25, $fn=20, center=true);				
		}
		for ( hole = [19,-19] ){
			translate([hole,4,8]) cylinder(r=2.2, h=4, $fn=20, center=true);
            translate([hole,-4,8]) cylinder(r=2.2, h=4, $fn=20, center=true);
		}	
	}
    
    translate([15.7,1.2,-5.2])
    rotate([0,90,0])
    cylinder(r=0.6,h=5,$fn=20);
    color("red")
    translate([15.7,0,-5.2])
    rotate([0,90,0])
    cylinder(r=0.6,h=5,$fn=20);
    color("#604030")
    translate([15.7,-1.2,-5.2])
    rotate([0,90,0])
    cylinder(r=0.6,h=5,$fn=20);
}