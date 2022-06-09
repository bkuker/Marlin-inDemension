$fn=40;
*
#import(file="C:/Users/bkuker/drawing.svg", center=true);


difference(){
    hull(){
        translate([0,0,5]){ 
            cube([28,15,10],true);
            translate([-7,0,0])
                cube([15,40,10],true);
        }
    }

    translate([0,0,-5]){ 
        translate([2,0,0]){
            cylinder(h=20,r=2);
            translate([8,0,0]){
                cylinder(h=20,r=2);
            }
        }

        translate([-11,31/2,0]){
            cylinder(h=20,r=2);
        }

        translate([-11,-31/2,0]){
            cylinder(h=20,r=2);
        }

        translate([-25,0,0]){
            cylinder(h=20,r=18);
        }
    }
}
