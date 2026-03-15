use <MCAD/boxes.scad>
$fs = 0.5;
$fa=1;

module mounting_point (
    translation_vector = [0,0,0],
    rotation_vector = [0,0,0],
    board_length,
    board_width,
    edge_to_holes,
    hole_outer_radius,
    hole_inner_radius,
    distance_between_holes_length,
) {
    
    
    
    hole_position_x = board_width/2 - edge_to_holes;
    hole_position_y = board_length/2 - edge_to_holes;

    hole_position_1 = [hole_position_x, hole_position_y, 0];
    hole_position_2 = [-hole_position_x, hole_position_y, 0];
    hole_position_3 = [hole_position_x, hole_position_y - distance_between_holes_length, 0];
    hole_position_4 = [-hole_position_x, hole_position_y - distance_between_holes_length, 0];
    
    difference() {
        union() {
            children();
            
            translate(translation_vector)
            rotate(rotation_vector)
            union() {
                translate([0,0,1])
                roundedBox(size=[board_width, board_length,2],
                    radius=3, sidesonly=true);

                translate(hole_position_1)
                cylinder(r=hole_outer_radius, h=5);

                translate(hole_position_2)
                cylinder(r=hole_outer_radius, h=5); 

                translate(hole_position_3)
                cylinder(r=hole_outer_radius, h=5); 

                translate(hole_position_4)
                cylinder(r=hole_outer_radius, h=5); 
            }
        }
    
        translate(translation_vector)
        rotate(rotation_vector)
        translate([0,0,-5])
        scale([1,1,3]){
            translate(hole_position_1)
            cylinder(r=hole_inner_radius, h=5); 

            translate(hole_position_2)
            cylinder(r=hole_inner_radius, h=5); 

            translate(hole_position_3)
            cylinder(r=hole_inner_radius, h=5); 

            translate(hole_position_4)
            cylinder(r=hole_inner_radius, h=5); 
        }
    }
}


module pi_mount (translation_vector  = [0,0,0], rotation_vector = [0,0,0]) {
    mounting_point(
        translation_vector,
        rotation_vector,
        85,
        56,
        3.5,
        3,
        2.75/2,
        58
    ){
        children();
    };
}

module pi_camera_mount_no_supports(translation_vector = [0,0,0], rotation_vector = [0,0,0]) {
    difference() {
        mounting_point(
            translation_vector,
            rotation_vector,
            23.862,
            25,
            2,
            2,
            1.1,
            12.5
        ){
            children();
        }
        translate(translation_vector)
        rotate(rotation_vector)
        translate([0,-14.5+23.8662/2,-5])
        cylinder(r=4.3,h=15);
    }
}


module pi_camera_mount (translation_vector = [0,0,0], rotation_vector = [0,0,0]) { 
    difference() {
    mounting_point(
        translation_vector,
        rotation_vector,
        23.862,
        25,
        2,
        2,
        1.1,
        12.5
    ){
        children();
        
        hole_position_x = 25/2 - 2;
        hole_position_y = 23.862/2 - 2;

        hole_position_1 = [hole_position_x, hole_position_y, 0];
        hole_position_2 = [-hole_position_x, hole_position_y, 0];
        hole_position_3 = [hole_position_x, hole_position_y - 12.5, 0];
        hole_position_4 = [-hole_position_x, hole_position_y - 12.5, 0];
                
        translate(translation_vector)
        rotate(rotation_vector){
            hull() {
                translate(hole_position_1)
                cylinder(r=2, h=5);
                translate([0,3,0])
                translate(hole_position_1)
                cylinder(r=2, h=2);
            }

            hull() {
                translate(hole_position_2)
                cylinder(r=2, h=5);
                translate([0,3,0])
                translate(hole_position_2)
                cylinder(r=2, h=2);
            } 

            hull() {
                translate(hole_position_3)
                cylinder(r=2, h=5);
                translate([0,3,0])
                translate(hole_position_3)
                cylinder(r=2, h=2);
            }

            hull() {
                translate(hole_position_4)
                cylinder(r=2, h=5);
                translate([0,3,0])
                translate(hole_position_4)
                cylinder(r=2, h=2);
            }
        }
    };
    translate(translation_vector)
    rotate(rotation_vector)
    translate([0,-14.5+23.8662/2,-5])
    cylinder(r=4.3,h=15);
}
}

pi_camera_mount();