import processing.pdf.*;
boolean record = false;

HShape d, e;
HColorPool colors;
HDrawablePool pool, pool2, pool3, pool4, pool5, pool6;


void setup(){
	size(1000,1000);
	H.init(this).background(#063543);
	smooth();
	colors = new HColorPool(#007884,#56b1b0,#e40010,#94d16e,#d57e2a,#f0da6d);


	pool = new HDrawablePool(30);
	pool.autoAddToStage()
	
		.add(new HShape("vectors-2.svg"))

		.layout(
			new HGridLayout()
			.startX(0)
			.startY(500)
			.spacing(200,30)
			.cols(10)
		)

		.onCreate(
			new HCallback() {
				public void run(Object obj) {	
					HShape d = (HShape) obj;
					d
						.enableStyle(false)
						//.noStroke()
						.fill(255)
						.alpha(20)
						.strokeWeight(1)
						.anchorAt(H.CENTER)
						.size((int)random(100,200))
						//.rotate((int)random(360))
					;
					d.randomColors(colors.strokeOnly());
				}
			}
		)
		.requestAll()
	;
	pool3 = new HDrawablePool(30);
	pool3.autoAddToStage()
	
		.add(new HShape("vectors-1.svg"))

		.layout(
			new HGridLayout()
			.startX(0)
			.startY(400)
			.spacing(150,30)
			.cols(10)
		)

		.onCreate(
			new HCallback() {
				public void run(Object obj) {	
					HShape d = (HShape) obj;
					d
						.enableStyle(false)
						//.noStroke()
						.fill(255)
						.alpha(20)
						.strokeWeight(1)
						.anchorAt(H.CENTER)
						.size((int)random(100,200))
						.rotate((int)random(360))
					;
					d.randomColors(colors.strokeOnly());
				}
			}
		)
		.requestAll()
	;

	pool2 = new HDrawablePool(40);
	pool2.autoAddToStage()
	
		.add(new HShape("vectors-2.svg"))

		.layout(
			new HGridLayout()
			.startX(500)
			.startY(500)
			.spacing(50,30)
			.cols(20)
		)

		.onCreate(
			new HCallback() {
				public void run(Object obj) {	
					HShape d = (HShape) obj;
					d
						.enableStyle(false)
						//.noStroke()
						.fill(255)
						.alpha(20)
						.strokeWeight(1)
						.anchorAt(H.CENTER)
						.size((int)random(100,200))
						.rotate((int)random(360))
					;
					d.randomColors(colors.strokeOnly());
				}
			}
		)
		.requestAll()
	;
	pool5 = new HDrawablePool(40);
	pool5.autoAddToStage()
	
		.add(new HShape("vectors-2.svg"))

		.layout(
			new HGridLayout()
			.startX(0)
			.startY(300)
			.spacing(50,30)
			.cols(20)
		)

		.onCreate(
			new HCallback() {
				public void run(Object obj) {	
					HShape d = (HShape) obj;
					d
						.enableStyle(false)
						//.noStroke()
						.fill(255)
						.alpha(20)
						.strokeWeight(1)
						.anchorAt(H.CENTER)
						.size((int)random(100,800))
						.rotate((int)random(360))
					;
					d.randomColors(colors.strokeOnly());
				}
			}
		)
		.requestAll()
	;
	pool5 = new HDrawablePool(40);
	pool5.autoAddToStage()
	
		.add(new HShape("vectors-2.svg"))

		.layout(
			new HGridLayout()
			.startX(0)
			.startY(700)
			.spacing(150,30)
			.cols(20)
		)

		.onCreate(
			new HCallback() {
				public void run(Object obj) {	
					HShape d = (HShape) obj;
					d
						.enableStyle(false)
						//.noStroke()
						.fill(255)
						.alpha(20)
						.strokeWeight(1)
						.anchorAt(H.CENTER)
						.size((int)random(100,800))
						.rotate((int)random(360))
					;
					d.randomColors(colors.strokeOnly());
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
