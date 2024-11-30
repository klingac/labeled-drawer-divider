// Customizable Triangle with Two Rounded Corners
// Parameters you can adjust
side_length = 100;  // Length of each side of the triangle
corner_radius = 10; // Radius of rounded corners
thickness = 500;      // Thickness of the triangle

module custom_triangle() {
    // Create a triangle with two rounded corners and one sharp corner
    difference() {
        // Base triangle hull with rounded corners
        hull() {
            // Calculate points of an equilateral triangle
            angle = 60;
            p1 = [0, 0];  // Sharp corner
            p2 = [side_length, 0];  // Rounded corner
            p3 = [side_length/2, side_length * sin(angle)];  // Rounded corner
            
            // Create circles at two corners with specified radius
            translate(p2) circle(r=corner_radius);
            translate(p3) circle(r=corner_radius);
        }
        
        // Remove a small circle at the sharp corner to ensure it stays sharp
        translate([0, 0]) circle(r=0.1);
    }
}

module right_triangle(side1,side2,corner_radius){
        hull(){  
            circle(0.1);
            translate([side1 - corner_radius * 2, corner_radius,0])
                circle(corner_radius);
            translate([0,side2 - corner_radius * 2,0])
                circle(0.1);  
        }
}

rotate([0,-90,0]){
    linear_extrude(height = thickness) {  
        right_triangle(side_length,side_length,corner_radius);
    }
}
