import processing.pdf.*;
boolean record = false;

HShape d;
HColorPool colors;
HDrawablePool pool;

void setup(){
	size(1000,1000);
	H.init(this).background(#ededed);
	smooth();
	colors = new HColorPool(#1B5078,#208AA9,#4C6148,#A2C559,#EA5427,#D67B90,#8DA7A3,#CDC4BD,#DF9F95,#F5CCBB,#F3CC3A,#EDE08E);
	//colors = new HColorPool(#333333, #cccccc, #666666, #999999, #dddddd, #777777, #888888);
	pool = new HDrawablePool(1000);
	pool.autoAddToStage()
		.add(new HShape("vectors-2.svg"))
		.add(new HShape("vectors-3.svg"))
		.add(new HShape("vectors-4.svg"))

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
						.stroke(#000000)
						.fill(255)
						.anchorAt(H.CENTER)
						.size((int)random(100,500))
						//.rotate( (int)random(360) )
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
