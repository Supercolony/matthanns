import processing.pdf.*;
boolean record = false;

HDrawablePool pool;
int boxSixe = 450;

void setup() {
	size(1000,1000,OPENGL);
	H.init(this).background(#000000).use3D(true);
	smooth();

	pool = new HDrawablePool(500);
	pool.autoAddToStage()
		.add (
			new HBox()
		)

		.layout (
			new HGridLayout()
			.startX(220)
			.startY(200)
			.spacing(10,10)
			.cols(20)
		)

		.onCreate (
			 new HCallback() {
				public void run(Object obj) {
					int i = pool.currentIndex();
					HBox d = (HBox) obj;
					d
						.depth(boxSixe)
						.width(boxSixe)
						.height(boxSixe)
						.noStroke()
						.z(-500)
					;

					new HOscillator()
						.target(d)
						.property(H.ROTATIONX)
						.range(-180, 180)
						.speed(0.3)
						.freq(1)
						.currentStep(i*2)
					;

					new HOscillator()
						.target(d)
						.property(H.ROTATIONY)
						.range(-180, 180)
						.speed(0.3)
						.freq(1)
						.currentStep(i*2)
					;

					new HOscillator()
						.target(d)
						.property(H.ROTATIONZ)
						.range(-360, 360)
						.speed(0.5)
						.freq(1)
						.currentStep(i*2)
					;
				}
			}
		)

		.requestAll()
	;
}

void draw() {
	pointLight(255, 255, 255, 255, height/2, -300);        // orange
	pointLight(0, 0, 0,  width, height/2, -300);   // teal
	pointLight(255, 255, 255,  width/2, height/2, -100); // yellow
	saveFrame();
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
