import processing.pdf.*;
boolean record = false;

HShape d, e, f, g, h, i;
HColorPool colors;
HDrawablePool pool, pool2, pool3, pool4, pool5, pool6;

void setup(){
	size(1000,1000);
	H.init(this).background(#ededed);
	smooth();
	colors = new HColorPool(#000000,#4F1C2A,#D20F1D,#DC3D97,#A4787E,#A99EA1,#E59FC5,#EADCE3);


	pool = new HDrawablePool(5000);
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
						//.fill(255)
						.anchorAt(H.CENTER)
						.size((int)random(100,500))
						//.size(50)
						.rotate( (int)random(360) )
					;
					d.randomColors(colors.fillOnly());
					//d.randomColors(colors.strokeOnly());
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
