import processing.pdf.*;
boolean record = false;

HShape d, e;
HColorPool colors;
HDrawablePool pool, pool2, pool3;

void setup(){
	size(1000,1000);
	H.init(this).background(#ffffff);
	smooth();
	colors = new HColorPool(#F6D532,#86CB48,#6EC1E0,#9AD9F2,#ACB1CB,#EBDCEF,#DDACD0,#D15E8D,#F5D0D4);

	pool = new HDrawablePool(200);
	pool.autoAddToStage()
	
		.add(new HShape("vectors-1.svg"))

		.layout(
			new HGridLayout()
			.startX(0)
			.startY(500)
			//.spacing(random(5)*5,random(5)*50)
			.spacing(random(20)*20,random(60,100)*20)
			.cols(10)
		)

		.onCreate(
			new HCallback() {
				public void run(Object obj) {	
					HShape d = (HShape) obj;
					d
						.enableStyle(false)
						// .stroke(#ffffff)
						// .strokeWeight(6)
						.noStroke()
						.anchorAt(H.CENTER)
						.size((int)random(200,800))
						.rotate((int)random(180))
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
