import processing.pdf.*;
boolean record = false;

HShape d;
HColorPool colors;
HDrawablePool pool;

void setup(){
	size(1000,1000);
	H.init(this).background(#ededed);
	smooth();
	colors = new HColorPool(#ffcc00,#ff9900,#ffad33,#d9007e,#ffe066, #ffc266, #ffffff);
	pool = new HDrawablePool(1000);
	pool.autoAddToStage()
		.add(new HShape("vectors-1.svg"))
		.add(new HShape("vectors-2.svg"))

		.layout(
			new HShapeLayout()
			.target(
				new HImage("shapeMap.png")
			)
		)

		.onCreate(
			new HCallback() {
				public void run(Object obj) {	
					HShape d = (HShape) obj;
					d
						.enableStyle(false)
						.noStroke()
						//.stroke(#ffffff)
						.strokeWeight(3)
						.anchorAt(H.CENTER)
						.size((int)random(300,500))
					;
					d.randomColors(colors.fillOnly());
				}
			}
		)
		.requestAll()
	;
	


}

void draw() {
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
