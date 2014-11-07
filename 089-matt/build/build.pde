import processing.pdf.*;
boolean record = false;

HShape d, e;
HColorPool colors;
HDrawablePool pool, pool2, pool3, pool4, pool5, pool6;

void setup(){
	size(1000,1000);
	H.init(this).background(#e9d5d7);
	smooth();
	colors = new HColorPool(#e3eaf4,#f1f151,#de9842,#c1dbdc,#f6f3c8,#e9e6e1,#b545a5,#8ca3c3);

	
	pool = new HDrawablePool(20);
	pool.autoAddToStage()
	
		.add(new HShape("vectors-1.svg"))

		.layout(
			new HGridLayout()
			.startX(500)
			.startY(500)
			.spacing(0,30)
			.cols(10)
		)

		.onCreate(
			new HCallback() {
				public void run(Object obj) {	
					HShape d = (HShape) obj;
					d
						.enableStyle(false)
						.noStroke()
						//.stroke(#333333)
						.anchorAt(H.CENTER)
						.size((int)random(500,1500))
						//.rotate((int)random(180))
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
