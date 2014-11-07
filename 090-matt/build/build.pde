import processing.pdf.*;
boolean record = false;

HShape d, e;
HColorPool colors;
HDrawablePool pool, pool2, pool3, pool4, pool5, pool6;

void setup(){
	size(1000,1000);
	H.init(this).background(#bfc6bf);
	smooth();
	colors = new HColorPool(#f20f2c,#f0763d,#666666);

	
	pool = new HDrawablePool(20);
	pool.autoAddToStage()
	
		.add(new HShape("vectors-1.svg"))

		.layout(
			new HGridLayout()
			.startX(500)
			.startY(500)
			.spacing(0,30)
			.cols(10)
		)

		.onCreate(
			new HCallback() {
				public void run(Object obj) {	
					HShape d = (HShape) obj;
					d
						.enableStyle(false)
						.noStroke()
						.anchorAt(H.CENTER)
						.size((int)random(500,1000))
						.rotate((int)random(360))
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
			new HGridLayout()
			.startX(500)
			.startY(500)
			.spacing(0,30)
			.cols(10)
		)

		.onCreate(
			new HCallback() {
				public void run(Object obj) {	
					HShape d = (HShape) obj;
					d
						.enableStyle(false)
						.noStroke()
						.anchorAt(H.CENTER)
						.size((int)random(500,800))
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
