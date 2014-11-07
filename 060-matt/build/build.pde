import processing.pdf.*;
boolean record = false;

HShape d, e;
HColorPool colors;
HDrawablePool pool, pool2, pool3;

void setup(){
	size(1000,1000);
	H.init(this).background(#171820);
	smooth();
	colors = new HColorPool(#253046,#2D4869,#6592B8,#94C297,#B0D3E5,#DDF6F9);

	pool3 = new HDrawablePool(50);
	pool3.autoAddToStage()
	
		.add(new HShape("vectors-1.svg"))

		.layout(
			new HGridLayout()
			.startX(0)
			.startY(400)
			.spacing(random(50)*5,50)
			.cols(10)
		)

		.onCreate(
			new HCallback() {
				public void run(Object obj) {	
					HShape d = (HShape) obj;
					d
						.enableStyle(false)
						.noStroke()
						//.fill(#ffffff)
						.anchorAt(H.CENTER)
						.size((int)random(100,1000))
						//.rotate(90)
						.rotate( (int)random(360) )
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
