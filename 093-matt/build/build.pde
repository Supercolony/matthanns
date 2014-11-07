import processing.pdf.*;
boolean record = false;

HShape d, e;
HColorPool colors;
HDrawablePool pool, pool2, pool3, pool4, pool5, pool6, pool7;

void setup(){
	size(1000,1000);
	H.init(this).background(#000000);
	smooth();
	colors = new HColorPool(#fbcdad,#f9682a,#f7ca44,#fce84f,#93bd55);


	pool = new HDrawablePool(30);
	pool.autoAddToStage()
	
		.add(new HShape("vectors-2.svg"))

		.layout(
			new HGridLayout()
			.startX(0)
			.startY(500)
			.spacing(50,30)
			.cols(10)
		)

		.onCreate(
			new HCallback() {
				public void run(Object obj) {	
					HShape d = (HShape) obj;
					d
						.enableStyle(true)
						.noStroke()
						.noFill()
						.anchorAt(H.CENTER)
						.size((int)random(100,800))
					;
					//d.randomColors(colors.strokeOnly());
				}
			}
		)
		.requestAll()
	;
	pool6 = new HDrawablePool(30);
	pool6.autoAddToStage()
	
		.add(new HShape("vectors-1.svg"))

		.layout(
			new HGridLayout()
			.startX(0)
			.startY(200)
			.spacing(300,10)
			.cols(20)
		)

		.onCreate(
			new HCallback() {
				public void run(Object obj) {	
					HShape d = (HShape) obj;
					d
						.enableStyle(true)
						.noStroke()
						.noFill()
						.anchorAt(H.CENTER)
						.size((int)random(600,1500))
					;
					//d.randomColors(colors.strokeOnly());
				}
			}
		)
		.requestAll()
	;
	pool7 = new HDrawablePool(30);
	pool7.autoAddToStage()
	
		.add(new HShape("vectors-1.svg"))

		.layout(
			new HGridLayout()
			.startX(0)
			.startY(800)
			.spacing(300,10)
			.cols(20)
		)

		.onCreate(
			new HCallback() {
				public void run(Object obj) {	
					HShape d = (HShape) obj;
					d
						.enableStyle(true)
						.noStroke()
						.noFill()
						.anchorAt(H.CENTER)
						.size((int)random(600,1500))
					;
					//d.randomColors(colors.strokeOnly());
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
			.spacing(50,30)
			.cols(10)
		)

		.onCreate(
			new HCallback() {
				public void run(Object obj) {	
					HShape d = (HShape) obj;
					d
						.enableStyle(true)
						.noStroke()
						.noFill()
						.anchorAt(H.CENTER)
						.size((int)random(100,800))
					;
					//d.randomColors(colors.strokeOnly());
				}
			}
		)
		.requestAll()
	;
	pool4 = new HDrawablePool(30);
	pool4.autoAddToStage()
	
		.add(new HShape("vectors-3.svg"))

		.layout(
			new HGridLayout()
			.startX(0)
			.startY(600)
			.spacing(50,30)
			.cols(20)
		)

		.onCreate(
			new HCallback() {
				public void run(Object obj) {	
					HShape d = (HShape) obj;
					d
						.enableStyle(true)
						.noStroke()
						.noFill()
						.anchorAt(H.CENTER)
						.size((int)random(100,800))
					;
					//d.randomColors(colors.strokeOnly());
				}
			}
		)
		.requestAll()
	;
	pool2 = new HDrawablePool(20);
	pool2.autoAddToStage()
	
		.add(new HShape("vectors-2.svg"))

		.layout(
			new HGridLayout()
			.startX(500)
			.startY(500)
			.spacing(100,30)
			.cols(20)
		)

		.onCreate(
			new HCallback() {
				public void run(Object obj) {	
					HShape d = (HShape) obj;
					d
						.enableStyle(true)
						.noStroke()
						.noFill()
						.anchorAt(H.CENTER)
						.size((int)random(100,800))
					;
					//d.randomColors(colors.strokeOnly());
				}
			}
		)
		.requestAll()
	;
	pool5 = new HDrawablePool(20);
	pool5.autoAddToStage()
	
		.add(new HShape("vectors-2.svg"))

		.layout(
			new HGridLayout()
			.startX(500)
			.startY(300)
			.spacing(50,30)
			.cols(20)
		)

		.onCreate(
			new HCallback() {
				public void run(Object obj) {	
					HShape d = (HShape) obj;
					d
						.enableStyle(true)
						.noStroke()
						.noFill()
						.anchorAt(H.CENTER)
						.size((int)random(100,800))
					;
					//d.randomColors(colors.strokeOnly());
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
