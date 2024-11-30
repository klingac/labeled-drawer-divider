// Parameters for the trapezoidal plate
short_side = 50.188; // Length of the shorter side
long_side = 51.5;  // Length of the longer side
height = 30.0;     // Height of the trapezoid
thickness = 1.8;   // Thickness of the plate
corner_radius = 2.7; // Radius of the rounded corners

module symetrical_trapezoid_2d(short, long, h, corner_radius) {
    hull() {
        // Sharp bottom corners
        polygon(points=[
            [-(short / 2), corner_radius],
            [(short / 2), corner_radius],
            [(long / 2), h],
            [-(long / 2), h]
        ]);
        
        // Rounded bottom left corner
        translate([-(short / 2) + corner_radius, corner_radius])
            circle(r = corner_radius);
        
        // Rounded bottom right corner
        translate([(short / 2) - corner_radius, corner_radius])
            circle(r = corner_radius);
    }
}

// Example usage
linear_extrude(height=thickness)
        symetrical_trapezoid_2d(
                short_side, // = 50, 
                long_side, // = 100, 
                height, // = 40, 
                corner_radius// = 5
        );