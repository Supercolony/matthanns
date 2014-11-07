import processing.pdf.*;
boolean record = false;

HShape d, e;
HColorPool colors;
HDrawablePool pool, pool2;

void setup(){
	size(1000,1000);
	H.init(this).background(#24171F);
	smooth();
	colors = new HColorPool(#9F988E,#3D708A,#9F2026,#C55897,#DCA7CE,#D895A4,#259F73,#89D4A9,#38B8C8,#95DFDE,#98B6C7,#DBD8D9,#E1D226,#FEFEFD);

	pool = new HDrawablePool(1000);
	pool.autoAddToStage()
		.add(new HShape("vectors-1.svg"),10)
		.add(new HShape("vectors-2.svg"))
		.add(new HShape("vectors-3.svg"),20)

		.layout(
			new HGridLayout()
			//.startX(50)
			.startX(450)
			.startY(0)
			.spacing(10,10)
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
						.size(400)
						.fill( colors.getColor() )
						.alpha( (int)random(100,255) )
						.rotate( (int)random(4) * 90 )
					;

					// HRotate rot = new HRotate();
					// rot.target(d).speed( random(-2,2) );
				}
			}
		)
		.requestAll()
	;
	pool2 = new HDrawablePool(1000);
	pool2.autoAddToStage()
		.add(new HShape("vectors-1.svg"),10)
		.add(new HShape("vectors-2.svg"))
		.add(new HShape("vectors-3.svg"),20)

		.layout(
			new HGridLayout()
			//.startX(50)
			.startX(150)
			.startY(0)
			.spacing(10,10)
			.cols(10)
		)

		.onCreate(
			new HCallback() {
				public void run(Object obj) {
					HShape e = (HShape) obj;
					e
						.enableStyle(false)
						.noStroke()
						.anchorAt(H.CENTER)
						.size(400)
						.fill( colors.getColor() )
						.alpha( (int)random(100,255) )
						.rotate( (int)random(4) * 90 )
					;

					// HRotate rot = new HRotate();
					// rot.target(d).speed( random(-2,2) );
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
		tmp = beginRecord(PDF, "render-4-######.pdf");
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
