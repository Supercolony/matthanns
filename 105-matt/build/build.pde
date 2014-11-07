import processing.pdf.*;
boolean record = false;

HSwarm swarm;
HDrawablePool pool, pool2, swarmPool;
HMagneticField field;
HColorPool colors;


int numMagnets = 30;

void setup() {
	size(1000,1000);

	H.init(this).background(#fcf0e4);
	smooth();

	colors = new HColorPool(#e34a1b,#e96423,#7e9731,#e2c040,#da3343).fillOnly();
	
	field = new HMagneticField();

	for (int i = 0; i<numMagnets; i++){
		if ( (int)random(2) == 0 ) field.addPole( (int)random(width), (int)random(height),   3); // x, y, north polarity / strength =  3 / repel
		else                       field.addPole( (int)random(width), (int)random(height),  -3); // x, y, south polarity / strength = -3 / attract
	}

	pool = new HDrawablePool(3500);
	pool.autoAddToStage()
		.add(
			new HShape("vectors-1.svg")
			.enableStyle(false)
			.anchorAt(H.CENTER)
			.size(20)
		)

		.colorist(colors)

		.layout(
			new HGridLayout()
			.startX(0)
			.startY(300)
			.spacing(10,10)
			.cols(100)
		)

		.onCreate (
			new HCallback() {
				public void run(Object obj) {
					HDrawable d = (HDrawable) obj;
					d.noStroke().anchor(-20,-20);
					field.addTarget(d);
				}
			}
		)

		.requestAll()
	;

	swarm = new HSwarm()
		.addGoal(width/2,height/2)
		.speed(7)
		.turnEase(0.03)
		.twitch(10)

	;

	swarmPool = new HDrawablePool(numMagnets);
	swarmPool.autoAddToStage()
		.add (new HRect(5))
		.onCreate (
			 new HCallback() {
				public void run(Object obj) {
					HDrawable d = (HDrawable) obj;
					d
						.noStroke()
						.noFill()
						.loc( (int)random(width), (int)random(height) )
						.visibility(false)
					;

					swarm.addTarget(d);
				}
			}
		)
		.requestAll()
	;
}

void draw() {
	int i = 0;

	for (HDrawable d : swarmPool) {
		HMagneticField.HPole p = field.pole(i);
		p._x = d.x();
		p._y = d.y();
		++i;
	}

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
