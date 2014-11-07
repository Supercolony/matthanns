import processing.pdf.*;
boolean record = false;

HShape d;
HColorPool colors;
HDrawablePool pool, pool2;

void setup(){
	size(1000,1000);
	H.init(this).background(#ffffff);
	smooth();
	colors = new HColorPool(#66c19d, #00978c, #bcf2e5, #ff7f60);
	pool = new HDrawablePool(500);
	pool.autoAddToStage()
		.add(new HShape("vectors-1.svg"))
		.add(new HShape("vectors-2.svg"))
		.add(new HShape("vectors-3.svg"))

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
						//.stroke(#24225a)
						//.strokeWeight(10)
						.noStroke()
						.anchorAt(H.CENTER)
						.size((int)random(100,300))
						//.rotate((int)random(360))
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
