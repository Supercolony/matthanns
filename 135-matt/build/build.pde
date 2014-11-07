import processing.pdf.*;

HDrawablePool pool1, pool2, pool3;
HColorPool colors;
HShape d;
boolean record = false;

void setup(){
	size(1000,1000);
	H.init(this).background(#9fc3e8);
	smooth();

	colors = new HColorPool(#ffffff, #ea1d48,#9fc3e8);

	pool1 = new HDrawablePool(30);
	pool1.autoAddToStage()
		.add(new HShape("vectors-1.svg"))

		.layout(
			new HHexLayout()
			.spacing(30)
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
						.size(1500)
						.rotate(90)
					;
					d.randomColors(colors.fillOnly());
				}
			}
		)
		.requestAll()
	;

	pool2 = new HDrawablePool(20);
	pool2.autoAddToStage()
		.add(new HShape("vectors-2.svg"))

		.layout(
			new HHexLayout()
			.spacing(20)
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
						.size(1000)
					;
					d.randomColors(colors.fillOnly());
				}
			}
		)
		.requestAll()
	;

	pool3 = new HDrawablePool(20);
	pool3.autoAddToStage()
		.add(new HShape("vectors-3.svg"))

		.layout(
			new HHexLayout()
			.spacing(10)
			.offsetX(0)
			.offsetY(50)
		)

		.onCreate(
			new HCallback() {
				public void run(Object obj) {	
					HShape d = (HShape) obj;
					d
						.enableStyle(false)
						.noStroke()
						.anchorAt(H.CENTER)
						.size(1000)
						.rotate(90)
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

