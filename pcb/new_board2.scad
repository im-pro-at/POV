module new_board2(){
	board_thickness = 1.600000;
	eta = 0.1;
	board_size = [137.160000,22.860000,board_thickness];
	fn = 18;
	board_origin = [0.000000,0.000000];
	union(){
		color("green")difference(){
			translate(board_origin)cube(board_size); //Board
			translate([5.080,19.050,-0.1])cylinder(r=1.600000, h=board_thickness+0.2,$fn=fn); //Hole
			translate([5.080,3.810,-0.1])cylinder(r=1.600000, h=board_thickness+0.2,$fn=fn); //Hole
			translate([134.366,8.890,-eta])cylinder(r=0.457200, h=board_thickness+eta*2,$fn=fn); //03P 1
			translate([134.366,11.430,-eta])cylinder(r=0.457200, h=board_thickness+eta*2,$fn=fn); //03P 2
			translate([134.366,13.970,-eta])cylinder(r=0.457200, h=board_thickness+eta*2,$fn=fn); //03P 3
		}
		translate([83.820,11.430,0])rotate([0,0,270])C1206();  //C9 
		translate([88.900,11.430,0])rotate([0,0,270])C1206();  //C10 
		translate([93.980,11.430,0])rotate([0,0,270])C1206();  //C11 
		translate([99.060,11.430,0])rotate([0,0,270])C1206();  //C12 
		translate([104.140,11.430,0])rotate([0,0,270])C1206();  //C13 
		translate([109.220,11.430,0])rotate([0,0,270])C1206();  //C14 
		translate([114.300,11.430,0])rotate([0,0,270])C1206();  //C15 
		translate([119.380,11.430,0])rotate([0,0,270])C1206();  //C16 
		translate([12.700,11.430,0])rotate([0,0,270])C1206();  //C19 
		translate([17.780,11.430,0])rotate([0,0,270])C1206();  //C20 
		translate([22.860,11.430,0])rotate([0,0,270])C1206();  //C21 
		translate([27.940,11.430,0])rotate([0,0,270])C1206();  //C22 
		translate([33.020,11.430,0])rotate([0,0,270])C1206();  //C23 
		translate([38.100,11.430,0])rotate([0,0,270])C1206();  //C24 
		translate([43.180,11.430,0])rotate([0,0,270])C1206();  //C25 
		translate([48.260,11.430,0])rotate([0,0,270])C1206();  //C26 
		translate([53.340,11.430,0])rotate([0,0,270])C1206();  //C27 
		translate([58.420,11.430,0])rotate([0,0,270])C1206();  //C28 
		translate([63.500,11.430,0])rotate([0,0,270])C1206();  //C29 
		translate([78.740,11.430,0])rotate([0,0,270])C1206();  //C30 
		translate([129.540,11.430,0])rotate([0,0,270])APA102();  //LED1 APA102
		translate([124.460,11.430,0])rotate([0,0,270])APA102();  //LED2 APA102
		translate([119.380,11.430,0])rotate([0,0,270])APA102();  //LED3 APA102
		translate([114.300,11.430,0])rotate([0,0,270])APA102();  //LED4 APA102
		translate([109.220,11.430,0])rotate([0,0,270])APA102();  //LED5 APA102
		translate([104.140,11.430,0])rotate([0,0,270])APA102();  //LED6 APA102
		translate([99.060,11.430,0])rotate([0,0,270])APA102();  //LED7 APA102
		translate([93.980,11.430,0])rotate([0,0,270])APA102();  //LED8 APA102
		translate([88.900,11.430,0])rotate([0,0,270])APA102();  //LED9 APA102
		translate([83.820,11.430,0])rotate([0,0,270])APA102();  //LED10 APA102
		translate([78.740,11.430,0])rotate([0,0,270])APA102();  //LED11 APA102
		translate([73.660,11.430,0])rotate([0,0,270])APA102();  //LED12 APA102
		translate([68.580,11.430,0])rotate([0,0,270])APA102();  //LED13 APA102
		translate([63.500,11.430,0])rotate([0,0,270])APA102();  //LED14 APA102
		translate([58.420,11.430,0])rotate([0,0,270])APA102();  //LED15 APA102
		translate([53.340,11.430,0])rotate([0,0,270])APA102();  //LED16 APA102
		translate([48.260,11.430,0])rotate([0,0,270])APA102();  //LED17 APA102
		translate([43.180,11.430,0])rotate([0,0,270])APA102();  //LED18 APA102
		translate([38.100,11.430,0])rotate([0,0,270])APA102();  //LED19 APA102
		translate([33.020,11.430,0])rotate([0,0,270])APA102();  //LED20 APA102
		translate([27.940,11.430,0])rotate([0,0,270])APA102();  //LED21 APA102
		translate([22.860,11.430,0])rotate([0,0,270])APA102();  //LED22 APA102
		translate([17.780,11.430,0])rotate([0,0,270])APA102();  //LED23 APA102
		translate([12.700,11.430,0])rotate([0,0,270])APA102();  //LED24 APA102
		translate([7.620,11.430,0])rotate([0,0,270])APA102();  //LED25 APA102
		translate([2.580,11.430,0])rotate([0,0,270])APA102();  //LED26 APA102
		translate([134.366,11.430,0])rotate([0,0,90])03P();  //SL3 
		translate([127.000,11.430,0])SO014();  //U$9 74HCT125D
		translate([71.120,11.430,0])SO014();  //U$10 74HCT125D
	}
}

new_board2(); //Show module
//Created by generate-scad.ulp version 0.1
