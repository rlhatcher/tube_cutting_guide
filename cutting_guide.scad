$fn = 100;

tube_od = 57; // bt-80 = 66, bt-70 = 56.3
thickness = 20;
width=10;
wall=2.5;
slots=5;

difference() {
    union() {
        cylinder(h=width, d=thickness+tube_od);
        translate([0,0,width])
            difference() {
                cylinder(h=width*2, d1=tube_od+wall*3, d2=tube_od+wall);
                for (n = [1 : slots]) {
                    rotate((360/slots)*n)
                    cube([(tube_od+wall*3)/2,5,width*2+1]);
                }
            }
    } 
    translate([0,0,-.5])
        cylinder(h=width*3+1, d=tube_od);
}


translate([90, 0, 0]) {
    difference() {
        union() {
            cylinder(h=width, d=thickness+tube_od);
            translate([0,0,width])
                cylinder(h=width*2, d=tube_od+wall*3);
        }
        union() {
        translate([0,0,-.5])
            cylinder(h=width+1, d=tube_od);
            translate([0,0,width])
                cylinder(h=width*2+1, d1=tube_od, d2=tube_od+wall*2);
        }
    }
}
