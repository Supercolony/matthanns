import processing.pdf.*;
boolean record = false;

HShape d, e;
HColorPool colors;
HDrawablePool pool, pool2, pool3, pool4, pool5, pool6;

void setup(){
	size(1000,1000);
	H.init(this).background(#F6F6F6);
	smooth();
	colors = new HColorPool(#50769B,#6797BD,#8CA0BC,#A0AFCA,#C5ACBD,#CCB9CC,#B7C1D2,#E4C5C9,#D1CDD5,#E8D4D6,#D7DAE1,#D4E8F3,#EDE5E1);

	pool6 = new HDrawablePool(15);
	pool6.autoAddToStage()
	
		.add(new HShape("vectors-1.svg"))

		.layout(
			new HGridLayout()
			.startX(300)
			.startY(500)
			.spacing(50,50)
			.cols(10)
		)

		.onCreate(
			new HCallback() {
				public void run(Object obj) {	
					HShape d = (HShape) obj;
					d
						.enableStyle(false)
						//.stroke(#ffffff)
						//.strokeWeight(2)
						.noStroke()
						//.fill(#000000)
						.anchorAt(H.CENTER)
						.size((int)random(500,800))
						.rotate((int)random(360))
					;
					d.randomColors(colors.fillOnly());
				}
			}
		)
		.requestAll()
	;

	pool4 = new HDrawablePool(40);
	pool4.autoAddToStage()
	
		.add(new HShape("vectors-4.svg"))

		.layout(
			new HGridLayout()
			.startX(200)
			.startY(600)
			.spacing(50,5)
			.cols(10)
		)

		.onCreate(
			new HCallback() {
				public void run(Object obj) {	
					HShape d = (HShape) obj;
					d
						.enableStyle(false)
						//.stroke(#ffffff)
						//.strokeWeight(2)
						.noStroke()
						//.fill(#000000)
						.anchorAt(H.CENTER)
						.size((int)random(100,300))
						.rotate((int)random(360))
					;
					d.randomColors(colors.fillOnly());
				}
			}
		)
		.requestAll()
	;

	pool5 = new HDrawablePool(40);
	pool5.autoAddToStage()
	
		.add(new HShape("vectors-4.svg"))

		.layout(
			new HGridLayout()
			.startX(500)
			.startY(300)
			.spacing(50,20)
			.cols(10)
		)

		.onCreate(
			new HCallback() {
				public void run(Object obj) {	
					HShape d = (HShape) obj;
					d
						.enableStyle(false)
						//.stroke(#ffffff)
						//.strokeWeight(2)
						.noStroke()
						//.fill(#000000)
						.anchorAt(H.CENTER)
						.size((int)random(300,500))
						.rotate((int)random(360))
					;
					d.randomColors(colors.fillOnly());
				}
			}
		)
		.requestAll()
	;

	pool3 = new HDrawablePool(40);
	pool3.autoAddToStage()
	
		.add(new HShape("vectors-3.svg"))

		.layout(
			new HGridLayout()
			.startX(500)
			.startY(500)
			.spacing(50,20)
			.cols(10)
		)

		.onCreate(
			new HCallback() {
				public void run(Object obj) {	
					HShape d = (HShape) obj;
					d
						.enableStyle(false)
						//.stroke(#ffffff)
						//.strokeWeight(2)
						.noStroke()
						//.fill(#000000)
						.anchorAt(H.CENTER)
						.size((int)random(100,300))
						.rotate((int)random(180))
					;
					d.randomColors(colors.fillOnly());
				}
			}
		)
		.requestAll()
	;

	pool2 = new HDrawablePool(15);
	pool2.autoAddToStage()
	
		.add(new HShape("vectors-3.svg"))

		.layout(
			new HGridLayout()
			.startX(500)
			.startY(500)
			.spacing(50,20)
			.cols(10)
		)

		.onCreate(
			new HCallback() {
				public void run(Object obj) {	
					HShape d = (HShape) obj;
					d
						.enableStyle(false)
						//.stroke(#ffffff)
						//.strokeWeight(2)
						.noStroke()
						//.fill(#000000)
						.anchorAt(H.CENTER)
						.size((int)random(100,300))
						.rotate((int)random(360))
					;
					d.randomColors(colors.fillOnly());
				}
			}
		)
		.requestAll()
	;
	pool = new HDrawablePool(15);
	pool.autoAddToStage()
	
		.add(new HShape("vectors-1.svg"))

		.layout(
			new HGridLayout()
			.startX(800)
			.startY(500)
			.spacing(50,50)
			.cols(10)
		)

		.onCreate(
			new HCallback() {
				public void run(Object obj) {	
					HShape d = (HShape) obj;
					d
						.enableStyle(false)
						//.stroke(#ffffff)
						//.strokeWeight(2)
						.noStroke()
						//.fill(#000000)
						.anchorAt(H.CENTER)
						.size((int)random(500,800))
						.rotate((int)random(360))
					;
					d.randomColors(colors.fillOnly());
				}
			}
		)
		.requestAll()
	;


	

	

	


}

void draw() {
	//saveFrame(); 
	H.drawStage();
	PGraphics tmp = null;

	if (record) {
		tmp = beginRecord(PDF, "render-######.pdf");
	}

	if (tmp == null) {
		H.drawStage();
	} else {
		PGraphics g = tmp;
		boolean uses3D = false;
		float alpha = 1;
		H.stage().paintAll(g, uses3D, alpha);
	}

	if (record) {
		endRecord();
		record = false;
	}
}

void keyPressed() {
	if (key == 's') {
		record = true;
		draw();
	}
}
