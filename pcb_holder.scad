$fn=100;

radius = 4;
radius_hole = 2;


main_size_x = 120;
main_size_y = 75;
main_size_z = 2;
holder_r = 4;
holder_high = 10;

bein_y = 18;
bein_bottom = 2;

module main_box(start_x, start_y, start_z)
{
	translate([start_x, start_y - 1, start_z])
		cube([main_size_x, main_size_y + 1, main_size_z]);

        translate([start_x + holder_r,
		   start_y + holder_r,
		   main_size_z])
		   	cylinder(h = holder_high, r = holder_r);
        translate([start_x + holder_r,
		   start_y  + main_size_y - holder_r,
		   main_size_z])
			cylinder(h = holder_high, r = holder_r);
        translate([start_x + main_size_x - holder_r,
		   start_y + holder_r,
		   main_size_z])
			cylinder(h = holder_high, r = holder_r);
        translate([start_x + main_size_x - holder_r,
		   start_y + main_size_y - holder_r,
		   main_size_z])
			cylinder(h = holder_high, r = holder_r);
}

module main_box_holes(start_x, start_y, start_z)
{
	translate([start_x + holder_r * 2, start_y + holder_r * 2, start_z - 2])
		cube([main_size_x - holder_r * 2 * 2, main_size_y - holder_r * 2 * 2, main_size_z + 6]);

        translate([start_x + holder_r,
		   start_y + holder_r,
		   start_z - 2])
		   	cylinder(h = holder_high + 6, r = radius_hole);
        translate([start_x + holder_r,
		   start_y  + main_size_y - holder_r,
		   start_z - 2])
		   	cylinder(h = holder_high + 6, r = radius_hole);
        translate([start_x + main_size_x - holder_r,
		   start_y + holder_r,
		   start_z - 2])
		   	cylinder(h = holder_high + 6, r = radius_hole);
        translate([start_x + main_size_x - holder_r,
		   start_y + main_size_y - holder_r,
		   start_z - 2])
		   	cylinder(h = holder_high + 6, r = radius_hole);
}

module main_bein(start_x, start_y, start_z)
{
	translate([start_x, start_y + bein_y, start_z + main_size_z])
	rotate([150, 0, 0])
		cube([main_size_x, bein_y + 1, main_size_z]);

}

module main_bein_holes(start_x, start_y, start_z)
{
	translate([start_x + holder_r * 2, start_y, start_z - 2])
		cube([main_size_x - holder_r * 2 * 2, bein_y - 3, main_size_z + 15]);

}

difference() {
	union() {
		cube([main_size_x, bein_bottom, 30]);
		main_box(0, bein_y, 0);
		main_bein(0, 0, 0);
	}
        
	main_box_holes(0, bein_y, 0);
	main_bein_holes(0, 2, 0);
}
