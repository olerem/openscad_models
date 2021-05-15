$fn=100;


difference() {
	union() {
		translate([0, 0, 0.5])  cube([12, 20, 1], true);
		translate([0, 0, 2]) cube([7, 20, 4], true);
		translate([0, 10.5, 2])  cube([12, 1, 4], true);
	}
	cylinder(h = 10, d = 4, center=true);
}


