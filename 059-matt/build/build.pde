import processing.pdf.*;
boolean record = false;

HShape d, e;
HColorPool colors;
HDrawablePool pool, pool2, pool3;

void setup(){
	size(1000,1000);
	H.init(this).background(#0052fc);
	smooth();


	pool = new HDrawablePool(500);
	pool.autoAddToStage()
	
		.add(new HShape("vectors-1.svg"))
		.add(new HShape("vectors-2.svg"))

		.layout(
			new HGridLayout()
			.startX(400)
			.startY(0)
			.spacing(random(10)*5,50)
			.cols(10)
		)

		.onCreate(
			new HCallback() {
				public void run(Object obj) {
					int i = pool.currentIndex();	
					HShape d = (HShape) obj;
					d
						.enableStyle(false)
						//.noStroke()
						.strokeWeight(3)
						.stroke(#0052fc)
						.fill(#ffffff)
						.anchorAt(H.CENTER)
						.size((int)random(100,200))
						//.rotate(90)
						.rotate( (int)random(360) )
					;
					new HOscillator()
						.target(d)
						.property(H.SCALE)
						.range(0, 1)
						.speed(1)
						.freq(10)
						.currentStep(i)
					;
					new HOscillator()
						.target(d)
						.property(H.ROTATION)
						.range(-270, 270)
						.speed(1)
						.freq(7)
						.currentStep(i)
					;

				}
			}
		)
		.requestAll()
	;


}

void draw() {
	H.drawStage();
	PGraphics tmp = null;
	//saveFrame("59-######.png");
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
