import processing.pdf.*;
boolean record = false;

HShape d;
HColorPool colors;
HDrawablePool pool;

void setup(){
	size(1000,1000);
	H.init(this).background(#153166);
	smooth();
	colors = new HColorPool(#153166,#223F7A,#355B89,#415C9B,#5770AA,#6C84BB,#7994C6,#869FCE,#8DACD8,#8AB7E4,#B6C4DF,#D7DBEA);
	pool = new HDrawablePool(2000);
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
						//.noStroke()
						.strokeWeight(3)
						.stroke(#153166)
						.anchorAt(H.CENTER)
						.size((int)random(100,300))
						.rotate(90)
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
