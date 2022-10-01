$fn=100;

translate([0, 0, 10])
    front();
back();

module front() {
    width=86;
    lenght=45;
    lenge_width=10;
    lenge_height=3.5;
    difference() {
        union() {
            translate([lenge_width, -5, 0])
                cube([width-lenge_width*2, 5, 2]);
            translate([0, 0, 0])
                cube([width, lenght, 2]);
            translate([lenge_width, lenght, 0])
                cube([width-lenge_width*2, 39, 2]);
        }
        translate([10+9+8/2, 4, -1])
            cylinder(6, 4, 4);
        translate([5, 5, -1]) cylinder(lenge_height+2, 2, 2);
        translate([5, lenght-5, -1]) cylinder(lenge_height+2, 2, 2);
        translate([width - 5, 5, -1]) cylinder(lenge_height+2, 2, 2);
        translate([width - 5, lenght-5, -1]) cylinder(lenge_height+2, 2, 2);
    }
    translate([10, 84, 0])
        rotate([22, 0, 0]) {
            cube([66, 45, 2]);
            translate([33-5, 45, 2])
                rotate([0, 0, -90])
                    mount();
        }
}

module mount() {
    cube([12, 2, 2.6]);
    translate([0, 0, 2.6])
        cube([12, 10, 1.65]);
    translate([3, 0, 0])
        cube([6, 10, 2.6]);
    translate([3, 7.5, 0])
        rotate([90, 0, 270])
            trapeze(3, 2.4, 2.6, 0.2);
    translate([9, 4.5, 0])
        rotate([90, 0, 90])
            trapeze(3, 2.4, 2.6, 0.2);
}

module trapeze(bottom_lenght, top_lenght, width, height) {
    offset=(bottom_lenght-top_lenght)/2;
    polyhedron(
        points=[
            [0, 0, 0],
            [bottom_lenght, 0, 0],
            [bottom_lenght, width, 0],
            [0, width, 0],
            [offset, 0, height],
            [top_lenght+offset, 0, height],
            [top_lenght+offset, width, height],
            [offset, width, height]
        ],
        faces=[
            [0,1,2,3],
            [0,1,5,4],
            [1,2,6,5],
            [2,3,7,6],
            [3,0,4,7],
            [4,5,6,7]
        ]
    );
}

module back() {
    width=86;
    lenght=45;
    height=2;
    lenge_width=10;
    lenge_height=3.5;
    difference() {
        union() {
            color("green") cube([86, lenght, 2]);
            cube([lenge_width, lenght, lenge_height]);
            translate([76, 0, 0]) cube([lenge_width, lenght, lenge_height]);
            translate([10+9+8/2, 4, 0]) cylinder(lenge_height*2, 4, 4);
        }
        translate([5, 5, -1]) cylinder(lenge_height+2, 2, 2);
        translate([5, lenght-5, -1]) cylinder(lenge_height+2, 2, 2);
        translate([width - 5, 5, -1]) cylinder(lenge_height+2, 2, 2);
        translate([width - 5, lenght-5, -1]) cylinder(lenge_height+2, 2, 2);
    }
}

