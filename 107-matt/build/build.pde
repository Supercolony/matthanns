import processing.pdf.*;
boolean record = false;

HDrawablePool pool;
int boxSize = 300;

void setup() {
	size(500,500,OPENGL);
	H.init(this).background(#2817a1).use3D(true);
	smooth();

	pool = new HDrawablePool(500);
	pool.autoAddToStage()
		.add (
			new HBox()
		)

		.layout (
			new HGridLayout()
			.startX(150)
			.startY(150)
			.spacing(10,10)
			.cols(20)
		)

		.onCreate (
			 new HCallback() {
				public void run(Object obj) {
					int i = pool.currentIndex();
					HBox d = (HBox) obj;
					d
						.depth(random(boxSize))
						.width(random(boxSize))
						.height(random(boxSize))
						.noStroke()
						.z(-500)
					;
					new HOscillator()
						.target(d)
						.property(H.SCALE)
						.range(-1.2,0.5)
						.speed(5)
						.freq(1)
						.currentStep(i*2)
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
						.currentStep(i*10)
					;

					new HOscillator()
						.target(d)
						.property(H.ROTATIONZ)
						.range(-360, 360)
						.speed(0.5)
						.freq(1)
						.currentStep(i*10)
					;
				}
			}
		)

		.requestAll()
	;
}

void draw() {
	pointLight(6, 103, 206, width/2, height/2, -300);   
	pointLight(246, 36, 143,  width, height/2, -100);   
	pointLight(40, 23, 161,  width/2, height/2, -100); 
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
