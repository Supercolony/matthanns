import processing.pdf.*;
boolean record = false;

HShape d, e, f, g, h, i;
HColorPool colors;
HDrawablePool pool, pool2, pool3, pool4, pool5, pool6;

void setup(){
	size(1000,1000);
	H.init(this).background(#ededed);
	smooth();
	//colors = new HColorPool(#521F27,#1B5078,#208AA9,#4C6148,#A2C559,#EA5427,#D67B90,#8DA7A3,#CDC4BD,#DF9F95,#F5CCBB,#F3CC3A,#EDE08E);
	colors = new HColorPool(#333333, #cccccc, #666666, #999999, #dddddd, #777777, #888888);
	pool6 = new HDrawablePool(500);
	pool6.autoAddToStage()
		.add(new HShape("vectors-6.svg"))

		.layout(
			new HShapeLayout()
			.target(
				new HImage("shapeMap5.png")
			)
		)

		.onCreate(
			new HCallback() {
				public void run(Object obj) {
					HShape i = (HShape) obj;
					i
						.enableStyle(false)
						.noStroke()
						.anchorAt(H.CENTER)
						.size( (int)random(50,300) )
						.rotate( (int)random(90) )
					;
					i.randomColors(colors.fillOnly());
				}
			}
		)

		.requestAll()
	;
	pool3 = new HDrawablePool(250);
	pool3.autoAddToStage()
		.add(new HShape("vectors-3.svg"))

		.layout(
			new HGridLayout()
			.startX(50)
			.startY(50)
			.spacing(200,200)
			.cols(50)
		)

		.onCreate(
			new HCallback() {
				public void run(Object obj) {
					HShape f = (HShape) obj;
					f
						.enableStyle(false)
						.noStroke()
						.anchorAt(H.CENTER)
						.size(800)
						.alpha(20)
						.fill( colors.getColor() )
						//.rotate( (int)random(360) )
					;
					//f.randomColors(colors.fillOnly());
				}
			}
		)

		.requestAll()
	;

	pool = new HDrawablePool(500);
	pool.autoAddToStage()
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
						.noStroke()
						.anchorAt(H.CENTER)
						.size( (int)random(50,300) )
						//.rotate( (int)random(360) )
					;
					d.randomColors(colors.fillOnly());
				}
			}
		)
		.requestAll()
	;

	pool2 = new HDrawablePool(500);
	pool2.autoAddToStage()
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
					HShape e = (HShape) obj;
					e
						.enableStyle(false)
						.noStroke()
						.anchorAt(H.CENTER)
						.size( (int)random(50,300) )
						//.rotate( (int)random(360) )
					;
					e.randomColors(colors.fillOnly());
				}
			}
		)

		.requestAll()
	;
	pool4 = new HDrawablePool(50);
	pool4.autoAddToStage()
		.add(new HShape("vectors-4.svg"))

		.layout(
			new HShapeLayout()
			.target(
				new HImage("shapeMap3.png")
			)
		)

		.onCreate(
			new HCallback() {
				public void run(Object obj) {
					HShape g = (HShape) obj;
					g
						.enableStyle(false)
						.noStroke()
						.anchorAt(H.CENTER)
						.size( (int)random(50,300) )
						//.rotate( (int)random(360) )
					;
					g.randomColors(colors.fillOnly());
				}
			}
		)

		.requestAll()
	;
	pool5 = new HDrawablePool(50);
	pool5.autoAddToStage()
		.add(new HShape("vectors-5.svg"))

		.layout(
			new HShapeLayout()
			.target(
				new HImage("shapeMap4.png")
			)
		)

		.onCreate(
			new HCallback() {
				public void run(Object obj) {
					HShape h = (HShape) obj;
					h
						.enableStyle(false)
						.noStroke()
						.anchorAt(H.CENTER)
						.size( (int)random(50,300) )
						//.rotate( (int)random(360) )
					;
					h.randomColors(colors.fillOnly());
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
