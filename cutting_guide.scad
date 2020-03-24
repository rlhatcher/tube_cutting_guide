$fn = 100;

tube_od = 56.3; // bt-80 = 66, bt-70 = 56.3
thickness = 20;
width=10;
wall=2.5;
slots=5;

    union() {
        make_ring(width, thickness, tube_od);
        translate([0,0,width])
            difference() {
                make_ring(width*2, wall, tube_od);
                for (n = [1 : slots]) {
                    rotate((360/slots)*n)
                    cube([(tube_od+wall)/2,5,width*2]);
                }
            }
    }

translate([90, 0, 0]) {
    union() {
        make_ring(width, thickness, tube_od);
        translate([0,0,width]) {
                difference() {
                   make_ring(width*2, wall*2, tube_od);
                   translate([0,0,-width])
                    cylinder(h=width*3+.1, d1=tube_od-wall, d2=tube_od+wall+.1);
                }
            }
        }
}

module make_ring(width, thickness, id) {
    linear_extrude(width, convexity=2)
    difference(){    
        circle(d=id+thickness);
        circle(d=id);
    }
}
