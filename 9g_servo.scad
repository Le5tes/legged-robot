9g_motor();

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
			color("black") cube([30,16,30], center=true);
			color("black") translate([0,0,5]) cube([42,16,2], center=true);
			color("black") translate([5.5,0,2.75]) cylinder(r=6, h=25.75, $fn=20, center=true);
			color("black") translate([-.5,0,2.75]) cylinder(r=1, h=25.75, $fn=20, center=true);
			color("black") translate([-1,0,2.75]) cube([5,5.6,24.5], center=true);		
			color("gold") translate([5.5,0,3.65]) cylinder(r=2.35, h=29.25, $fn=20, center=true);				
		}
		translate([10,0,-11]) rotate([0,-30,0]) cube([8,13,4], center=true);
		for ( hole = [20,-20] ){
			translate([hole,4,5]) cylinder(r=2.2, h=4, $fn=20, center=true);
            translate([hole,-4,5]) cylinder(r=2.2, h=4, $fn=20, center=true);
		}	
	}
}