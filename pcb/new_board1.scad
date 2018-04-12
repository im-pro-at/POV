module new_board1(){
	board_thickness = 1.600000;
	eta = 0.1;
	board_size = [66.040000,71.120000,board_thickness];
	fn = 18;
	board_origin = [0.000000,0.000000];
	union(){
		color("green")difference(){
			translate(board_origin)cube(board_size); //Board
			translate([25.400,43.180,-0.1])cylinder(r=1.600000, h=board_thickness+0.2,$fn=fn); //Hole
			translate([40.640,43.180,-0.1])cylinder(r=1.600000, h=board_thickness+0.2,$fn=fn); //Hole
			translate([40.640,27.940,-0.1])cylinder(r=1.600000, h=board_thickness+0.2,$fn=fn); //Hole
			translate([25.400,27.940,-0.1])cylinder(r=1.600000, h=board_thickness+0.2,$fn=fn); //Hole
			translate([60.960,43.180,-0.1])cylinder(r=1.600000, h=board_thickness+0.2,$fn=fn); //Hole
			translate([60.960,27.940,-0.1])cylinder(r=1.600000, h=board_thickness+0.2,$fn=fn); //Hole
			translate([5.080,43.180,-0.1])cylinder(r=1.600000, h=board_thickness+0.2,$fn=fn); //Hole
			translate([5.080,27.940,-0.1])cylinder(r=1.600000, h=board_thickness+0.2,$fn=fn); //Hole
			translate([25.400,5.080,-0.1])cylinder(r=1.600000, h=board_thickness+0.2,$fn=fn); //Hole
			translate([40.640,5.080,-0.1])cylinder(r=1.600000, h=board_thickness+0.2,$fn=fn); //Hole
			translate([25.400,66.040,-0.1])cylinder(r=1.600000, h=board_thickness+0.2,$fn=fn); //Hole
			translate([40.640,66.040,-0.1])cylinder(r=1.600000, h=board_thickness+0.2,$fn=fn); //Hole
			translate([50.800,20.320,-eta])cylinder(r=0.508000, h=board_thickness+eta*2,$fn=fn); //317TS 1
			translate([53.340,20.320,-eta])cylinder(r=0.508000, h=board_thickness+eta*2,$fn=fn); //317TS 2
			translate([55.880,20.320,-eta])cylinder(r=0.508000, h=board_thickness+eta*2,$fn=fn); //317TS 3
			translate([51.435,68.580,-eta])cylinder(r=0.457200, h=board_thickness+eta*2,$fn=fn); //06P 1
			translate([53.975,68.580,-eta])cylinder(r=0.457200, h=board_thickness+eta*2,$fn=fn); //06P 2
			translate([56.515,68.580,-eta])cylinder(r=0.457200, h=board_thickness+eta*2,$fn=fn); //06P 3
			translate([59.055,68.580,-eta])cylinder(r=0.457200, h=board_thickness+eta*2,$fn=fn); //06P 4
			translate([61.595,68.580,-eta])cylinder(r=0.457200, h=board_thickness+eta*2,$fn=fn); //06P 5
			translate([64.135,68.580,-eta])cylinder(r=0.457200, h=board_thickness+eta*2,$fn=fn); //06P 6
			translate([45.720,17.780,-eta])cylinder(r=0.457200, h=board_thickness+eta*2,$fn=fn); //02P 1
			translate([45.720,20.320,-eta])cylinder(r=0.457200, h=board_thickness+eta*2,$fn=fn); //02P 2
			translate([45.720,15.240,-eta])cylinder(r=0.406400, h=board_thickness+eta*2,$fn=fn); //DCDC GND1
			translate([45.720,12.700,-eta])cylinder(r=0.406400, h=board_thickness+eta*2,$fn=fn); //DCDC GND2
			translate([64.120,15.240,-eta])cylinder(r=0.406400, h=board_thickness+eta*2,$fn=fn); //DCDC GND3
			translate([64.120,12.700,-eta])cylinder(r=0.406400, h=board_thickness+eta*2,$fn=fn); //DCDC GND4
			translate([45.720,4.640,-eta])cylinder(r=0.406400, h=board_thickness+eta*2,$fn=fn); //DCDC VIN1
			translate([45.720,2.140,-eta])cylinder(r=0.406400, h=board_thickness+eta*2,$fn=fn); //DCDC VIN2
			translate([64.120,4.640,-eta])cylinder(r=0.406400, h=board_thickness+eta*2,$fn=fn); //DCDC VOUT1
			translate([64.120,2.140,-eta])cylinder(r=0.406400, h=board_thickness+eta*2,$fn=fn); //DCDC VOUT2
			translate([20.320,2.540,-eta])cylinder(r=0.406400, h=board_thickness+eta*2,$fn=fn); //DCDC GND1
			translate([20.320,5.080,-eta])cylinder(r=0.406400, h=board_thickness+eta*2,$fn=fn); //DCDC GND2
			translate([1.920,2.540,-eta])cylinder(r=0.406400, h=board_thickness+eta*2,$fn=fn); //DCDC GND3
			translate([1.920,5.080,-eta])cylinder(r=0.406400, h=board_thickness+eta*2,$fn=fn); //DCDC GND4
			translate([20.320,13.140,-eta])cylinder(r=0.406400, h=board_thickness+eta*2,$fn=fn); //DCDC VIN1
			translate([20.320,15.640,-eta])cylinder(r=0.406400, h=board_thickness+eta*2,$fn=fn); //DCDC VIN2
			translate([1.920,13.140,-eta])cylinder(r=0.406400, h=board_thickness+eta*2,$fn=fn); //DCDC VOUT1
			translate([1.920,15.640,-eta])cylinder(r=0.406400, h=board_thickness+eta*2,$fn=fn); //DCDC VOUT2
		}
		translate([6.350,5.080,0])rotate([0,0,270])153CLV_0605();  //C1 
		translate([62.230,17.780,0])C1206();  //C2 
		translate([45.720,53.340,0])C1206();  //C3 
		translate([62.230,12.700,0])rotate([0,0,90])C1206();  //C5 
		translate([13.970,15.240,0])rotate([0,0,90])153CLV_0605();  //C6 
		translate([13.970,5.080,0])rotate([0,0,270])153CLV_0605();  //C7 
		translate([58.420,13.970,0])rotate([0,0,270])153CLV_0405();  //C8 
		translate([59.690,5.080,0])rotate([0,0,90])153CLV_0605();  //C69 
		translate([6.350,15.240,0])rotate([0,0,90])153CLV_0605();  //C71 
		translate([52.070,5.080,0])rotate([0,0,90])153CLV_0605();  //C72 
		translate([53.340,17.780,0])317TS();  //IC1 
		translate([63.460,35.560,0])rotate([0,0,270])APA102();  //LED27 APA102
		translate([58.420,35.560,0])rotate([0,0,270])APA102();  //LED28 APA102
		translate([53.340,35.560,0])rotate([0,0,270])APA102();  //LED29 APA102
		translate([48.260,35.560,0])rotate([0,0,270])APA102();  //LED30 APA102
		translate([43.180,35.560,0])rotate([0,0,270])APA102();  //LED31 APA102
		translate([38.100,35.560,0])rotate([0,0,270])APA102();  //LED32 APA102
		translate([33.020,35.560,0])rotate([0,0,270])APA102();  //LED33 APA102
		translate([33.020,2.580,0])rotate([0,0,180])APA102();  //LED60 APA102
		translate([33.020,7.620,0])rotate([0,0,180])APA102();  //LED61 APA102
		translate([33.020,12.700,0])rotate([0,0,180])APA102();  //LED62 APA102
		translate([33.020,17.780,0])rotate([0,0,180])APA102();  //LED63 APA102
		translate([33.020,22.860,0])rotate([0,0,180])APA102();  //LED64 APA102
		translate([33.020,27.940,0])rotate([0,0,180])APA102();  //LED65 APA102
		translate([2.580,35.560,0])rotate([0,0,90])APA102();  //LED92 APA102
		translate([7.620,35.560,0])rotate([0,0,90])APA102();  //LED93 APA102
		translate([12.700,35.560,0])rotate([0,0,90])APA102();  //LED94 APA102
		translate([17.780,35.560,0])rotate([0,0,90])APA102();  //LED95 APA102
		translate([22.860,35.560,0])rotate([0,0,90])APA102();  //LED96 APA102
		translate([27.940,35.560,0])rotate([0,0,90])APA102();  //LED97 APA102
		translate([33.020,68.540,0])APA102();  //LED124 APA102
		translate([33.020,63.500,0])APA102();  //LED125 APA102
		translate([33.020,58.420,0])APA102();  //LED126 APA102
		translate([33.020,53.340,0])APA102();  //LED127 APA102
		translate([33.020,48.260,0])APA102();  //LED128 APA102
		translate([33.020,43.180,0])APA102();  //LED129 APA102
		translate([45.720,62.230,0])rotate([0,0,180])M1206();  //R49 10k
		translate([45.720,50.800,0])M1206();  //R50 10k
		translate([45.720,55.880,0])rotate([0,0,180])M1206();  //R51 10k
		translate([45.720,59.055,0])rotate([0,0,180])M1206();  //R52 10k
		translate([54.610,13.970,0])rotate([0,0,270])M1206();  //R53 120R
		translate([48.260,13.970,0])rotate([0,0,270])M1206();  //R55 390R
		translate([51.435,13.970,0])rotate([0,0,90])M1206();  //R56 120R
		translate([57.785,68.580,0])06P();  //SL1 
		translate([45.720,19.050,0])rotate([0,0,90])02P();  //SL2 
		translate([58.420,56.515,0])rotate([0,0,270])ESP07_16PIN();  //U$1 ESP07-16PIN
		translate([33.020,54.610,0])rotate([0,0,180])DIL48();  //U$2 CMODS6
		translate([45.720,15.240,0])DCDC();  //U$3 DCDC
		translate([20.320,2.540,0])rotate([0,0,180])DCDC();  //U$4 DCDC
	}
}

new_board1(); //Show module
//Created by generate-scad.ulp version 0.1
