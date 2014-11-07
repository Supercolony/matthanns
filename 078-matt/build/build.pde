import processing.pdf.*;
boolean record = false;

HShape d, e;
HColorPool colors;
HDrawablePool pool, pool2, pool3, pool4;

void setup(){
	size(1000,1000);
	H.init(this).background(#e7f1dd);
	smooth();
	colors = new HColorPool(#4cb2c2,#81dadf,#e4c353,#94edd1,#8cb6a5,#367f50,#1c3d34);

	pool4 = new HDrawablePool(40);
	pool4.autoAddToStage()
	
		.add(new HShape("vectors-4.svg"))

		.layout(
			new HGridLayout()
			.startX(200)
			.startY(300)
			.spacing(50,200)
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
	
		.add(new HShape("vectors-1.svg"))

		.layout(
			new HGridLayout()
			.startX(500)
			.startY(300)
			.spacing(50,200)
			.cols(5)
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
						.size((int)random(500,900))
						.rotate((int)random(180))
					;
					d.randomColors(colors.fillOnly());
				}
			}
		)
		.requestAll()
	;

	pool3 = new HDrawablePool(15);
	pool3.autoAddToStage()
	
		.add(new HShape("vectors-3.svg"))

		.layout(
			new HGridLayout()
			.startX(500)
			.startY(300)
			.spacing(50,200)
			.cols(5)
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
						.size((int)random(500,900))
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
	
		.add(new HShape("vectors-2.svg"))

		.layout(
			new HGridLayout()
			.startX(500)
			.startY(300)
			.spacing(50,200)
			.cols(5)
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
						.size((int)random(500,900))
						.rotate((int)random(180))
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
			.startX(500)
			.startY(300)
			.spacing(50,200)
			.cols(5)
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
						.size((int)random(500,900))
						.rotate((int)random(180))
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
