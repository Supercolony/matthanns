import processing.pdf.*;
boolean record = false;

HShape d;
HColorPool colors, colors2;
HDrawablePool pool, pool2;

void setup(){
	size(1000,1000);
	H.init(this).background(#203a52);
	smooth();
	colors2 = new HColorPool(#4a91b3, #203a52);
	pool2 = new HDrawablePool(100);
	pool2.autoAddToStage()
		.add(new HShape("vectors-1.svg"))

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
						//.stroke(#24225a)
						//.strokeWeight(10)
						.noStroke()
						.anchorAt(H.CENTER)
						.size((int)random(100,300))
						.rotate(45)
					;
					d.randomColors(colors2.fillOnly());
				}
			}
		)
		.requestAll()
	;
	colors = new HColorPool(#d03232, #4c8eb1, #ffffff);
	pool = new HDrawablePool(100);
	pool.autoAddToStage()
		.add(new HShape("vectors-1.svg"))

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
