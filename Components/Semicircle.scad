module semicircle(od=3/4, angle=225, center=false, $fn=50) {
  rotate(center ? angle/2 : 0)
  rotate([0,0,-(angle % 90)])
  difference() {
    union() {
      intersection() {

        // Main Body
        circle(r=od/2);

        // 90* Angle cutters
        if (angle < 360)
        for (i=[0: (angle / 90)]) {

          // First angle, angle mod 90
          if (i == 0)
          polygon(points=[[0,0],
                          [od,0],
                          [cos(angle%90) * od, sin(angle%90) * od]]);

          // 90* sections
          if (i>0)
          rotate([0,0,-90*i])
          square([od, od]);
        }

      }
    }
  }
}

module semidonut(major=3/4, minor=1/2, angle=225, center=false, $fn=50) {
  difference() {
    semicircle(od=major, angle=angle, center=center, $fn=$fn);

    circle(r=minor/2);
  }
}

scale([25.4, 25.4, 25.4])
semidonut();
