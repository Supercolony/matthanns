import processing.pdf.*;
boolean record = false;

HDrawablePool pool, pool2, pool3;
int boxSize = 300;

void setup() {
	size(500,500,OPENGL);
	H.init(this).background(#f0c643).use3D(true);
	smooth();

	pool = new HDrawablePool(50);
	pool.autoAddToStage()
		.add (
			new HBox()
		)

		.layout (
			new HGridLayout()
			.startX(-20)
			.startY(150)
			.spacing(40,10)
			.cols(20)
		)

		.onCreate (
			 new HCallback() {
				public void run(Object obj) {
					int i = pool.currentIndex();
					HBox d = (HBox) obj;
					d
						.depth(random(50,500))
						.width(random(0,boxSize))
						.height(random(0,boxSize))
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
						.range(-360, 180)
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
						.range(-180, 180)
						.speed(0.5)
						.freq(1)
						.currentStep(i*10)
					;
				}
			}
		)

		.requestAll()
	;
	pool2 = new HDrawablePool(200);
	pool2.autoAddToStage()
		.add (
			new HBox()
		)

		.layout (
			new HGridLayout()
			.startX(450)
			.startY(150)
			.spacing(10,10)
			.cols(20)
		)

		.onCreate (
			 new HCallback() {
				public void run(Object obj) {
					int i = pool2.currentIndex();
					HBox d = (HBox) obj;
					d
						.depth(random(50,500))
						.width(random(0,boxSize))
						.height(random(0,boxSize))
						.noStroke()
						.z(-500)
					;
					new HOscillator()
						.target(d)
						.property(H.SCALE)
						.range(-1.2,0.1)
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
						.range(-180, 10)
						.speed(0.3)
						.freq(1)
						.currentStep(i*10)
					;

					new HOscillator()
						.target(d)
						.property(H.ROTATIONZ)
						.range(-10, 10)
						.speed(0.5)
						.freq(1)
						.currentStep(i*10)
					;
				}
			}
		)

		.requestAll()
	;
	pool3 = new HDrawablePool(400);
	pool3.autoAddToStage()
		.add (
			new HBox()
		)

		.layout (
			new HGridLayout()
			.startX(10)
			.startY(200)
			.spacing(40,10)
			.cols(20)
		)

		.onCreate (
			 new HCallback() {
				public void run(Object obj) {
					int i = pool3.currentIndex();
					HBox d = (HBox) obj;
					d
						.depth(random(50,500))
						.width(random(5))
						.height(random(5))
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
						.range(-360, 180)
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
						.range(-180, 180)
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
	pointLight(59, 95, 171, 200, 200, -100);   
	pointLight(209, 127, 42,  width, height/2, -100);   
	pointLight(240, 198, 67,  width/2, height/2, -100); 
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
