import processing.pdf.*;

HDrawablePool pool1, pool2, pool3, pool4, pool5;
HColorPool colors;
HShape d;
boolean record = false;

void setup(){
	size(1000,1000);
	H.init(this).background(#ffffff);
	smooth();

	colors = new HColorPool(#070505,#96A4A4,#D0D5D6,#FEFFFE,#F45851,#EDB8BD,#07B5B3,#8AEAE8,#D0FBFA);
	pool3 = new HDrawablePool(300);
	pool3.autoAddToStage()
		.add(new HShape("vectors-3.svg"))

		.layout(
			new HHexLayout()
			.spacing(40)
			.offsetX(100)
			.offsetY(0)
		)

		.onCreate(
			new HCallback() {
				public void run(Object obj) {	
					HShape d = (HShape) obj;
					d
						.enableStyle(false)
						.noStroke()
						.anchorAt(H.CENTER)
						.size(200)
						.rotate((int)random(360))
					;
					d.randomColors(colors.fillOnly());
				}
			}
		)
		.requestAll()
	;
	pool1 = new HDrawablePool(100);
	pool1.autoAddToStage()
		.add(new HShape("vectors-1.svg"))

		.layout(
			new HHexLayout()
			.spacing(100)
			.offsetX(0)
			.offsetY(0)
		)

		.onCreate(
			new HCallback() {
				public void run(Object obj) {	
					HShape d = (HShape) obj;
					d
						.enableStyle(false)
						.noStroke()
						.anchorAt(H.CENTER)
						.size(200)
						.rotate((int)random(360))
					;
					d.randomColors(colors.fillOnly());
				}
			}
		)
		.requestAll()
	;

	pool2 = new HDrawablePool(100);
	pool2.autoAddToStage()
		.add(new HShape("vectors-2.svg"))

		.layout(
			new HHexLayout()
			.spacing(100)
			.offsetX(50)
			.offsetY(0)
		)

		.onCreate(
			new HCallback() {
				public void run(Object obj) {	
					HShape d = (HShape) obj;
					d
						.enableStyle(false)
						.noStroke()
						.anchorAt(H.CENTER)
						.size(200)
						.rotate((int)random(360))
					;
					d.randomColors(colors.fillOnly());
				}
			}
		)
		.requestAll()
	;

	

	pool4 = new HDrawablePool(100);
	pool4.autoAddToStage()
		.add(new HShape("vectors-5.svg"))

		.layout(
			new HHexLayout()
			.spacing(150)
			.offsetX(0)
			.offsetY(0)
		)

		.onCreate(
			new HCallback() {
				public void run(Object obj) {	
					HShape d = (HShape) obj;
					d
						.enableStyle(false)
						.noStroke()
						.anchorAt(H.CENTER)
						.size(200)
						.rotate((int)random(360))
					;
					d.randomColors(colors.fillOnly());
				}
			}
		)
		.requestAll()
	;

	pool5 = new HDrawablePool(100);
	pool5.autoAddToStage()
		.add(new HShape("vectors-4.svg"))

		.layout(
			new HHexLayout()
			.spacing(200)
			.offsetX(0)
			.offsetY(0)
		)

		.onCreate(
			new HCallback() {
				public void run(Object obj) {	
					HShape d = (HShape) obj;
					d
						.enableStyle(false)
						.noStroke()
						.anchorAt(H.CENTER)
						.size(200)
						.rotate((int)random(360))
					;
					d.randomColors(colors.fillOnly());
				}
			}
		)
		.requestAll()
	;

	

	H.drawStage();
	noLoop();
}
 
void draw(){ 
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

