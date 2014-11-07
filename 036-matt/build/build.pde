import processing.pdf.*;
HDrawablePool pool;
HPolarLayout layout;
boolean record = false;
HShape d;
int colshifter = 0;

void setup(){
	size(1000,1000);
	H.init(this).background(#202020);
	smooth();

	layout = new HPolarLayout(0.25, 10, width / 2, height / 2, true, 0.005);

	pool = new HDrawablePool( 10);
	pool.autoAddToStage()
		.add(new HShape("vectors-1.svg"))
		.onCreate (
			new HCallback() {
				public void run(Object obj) {
					int i = pool.currentIndex();

					HShape d = (HShape) obj;
					d
						.enableStyle(false)
						.noStroke()
						//.size(50)
						.fill(#000000)
						.anchorAt(H.CENTER)
					;

					layout.applyLayout(d);

					new HOscillator()
						.target(d)
						.property(H.SCALE)
						.range(0.1, 50)
						.speed(2)
						.freq(1)
						.currentStep( i )
					;

					new HOscillator()
						.target(d)
						.property(H.ROTATION)
						.range(-180, (int)random(90,180))
						.speed(0.5)
						.freq(1)
						.currentStep( i )
					;
				}
			}
		)
		.requestAll()
	;
}
 
void draw(){

	colorMode(HSB, 360, 100, 100);

	colshifter++;
	if (colshifter >360) colshifter=0;

	for (HDrawable d : pool) {
		color tempClr = color(colshifter, random(50, 100), random(75, 100));
		d.fill( tempClr );
	}

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

	H.drawStage();
}

void keyPressed() {
	if (key == 's') {
		record = true;
		draw();
	}
}

