import processing.pdf.*;
boolean record = false;

HShape d;
HColorPool colors;
HDrawablePool pool, pool2;

void setup(){
	size(1000,1000);
	H.init(this).background(#00c2c2);
	smooth();

	pool2 = new HDrawablePool(1000);
	pool2.autoAddToStage()
		.add(new HShape("vectors-3.svg"))
		.add(new HShape("vectors-4.svg"))

		.layout(
			new HShapeLayout()
			.target(
				new HImage("shapeMap2.png")
			)
		)

		.onCreate(
			new HCallback() {
				public void run(Object obj) {	
					HShape d = (HShape) obj;
					d
						.enableStyle(false)
						//.noStroke()
						.stroke(#00c2c2)
						.fill(255)
						.anchorAt(H.CENTER)
						.size((int)random(50,200))
						.rotate( (int)random(360) )
					;
					//d.randomColors(colors.fillOnly());
				}
			}
		)
		.requestAll()
	;

	pool = new HDrawablePool(1000);
	pool.autoAddToStage()
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
						.stroke(#00c2c2)
						.fill(255)
						.anchorAt(H.CENTER)
						.size((int)random(50,300))
						.rotate( (int)random(360) )
					;
					//d.randomColors(colors.fillOnly());
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
