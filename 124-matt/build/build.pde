import processing.pdf.*;
boolean record = false;

HShape d, e;
HColorPool colors;
HDrawablePool pool, pool2, pool3;

void setup(){
	size(1000,1000);
	H.init(this).background(#5fee88);
	smooth();
	colors = new HColorPool(#62cdf1,#5fee88,#0da685, #ffffff);

	pool = new HDrawablePool(400);
	pool.autoAddToStage()
	
		.add(new HShape("vectors-1.svg"))
		.add(new HShape("vectors-2.svg"))

		.layout(
			new HGridLayout()
			.startX(450)
			.startY(500)
			//.spacing(random(5)*5,random(5)*50)
			.spacing(20,1)
			.cols(5)
		)

		.onCreate(
			new HCallback() {
				public void run(Object obj) {	
					HShape d = (HShape) obj;
					d
						.enableStyle(false)
						.stroke(#62cdf1)
						//.noStroke()
						//.fill(#000000)
						.anchorAt(H.CENTER)
						.size((int)random(500,1000))
						.rotate(45)
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
