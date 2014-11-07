import processing.pdf.*;
boolean record = false;

HSwarm swarm;
HDrawablePool pool, swarmPool;
HMagneticField field;
HColorPool colors;


int numMagnets = 10;

void setup() {
	size(1000,1000);

	H.init(this).background(#000000);
	smooth();

	colors = new HColorPool(#ed333f, #7cb3a8).fillOnly();
	
	field = new HMagneticField();

	for (int i = 0; i<numMagnets; i++){
		if ( (int)random(2) == 0 ) field.addPole( (int)random(width), (int)random(height),   3); // x, y, north polarity / strength =  3 / repel
		else                       field.addPole( (int)random(width), (int)random(height),  -3); // x, y, south polarity / strength = -3 / attract
	}

	pool = new HDrawablePool(2500);
	pool.autoAddToStage()
		.add(
			new HShape("vectors-1.svg")
			.enableStyle(false)
			.anchorAt(H.CENTER)
			.size(10)
		)

		.colorist(colors)

		.layout(
			new HGridLayout()
			.startX(500)
			.startY(500)
			.spacing(5,5)
			.cols(50)
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
		.twitch(20)
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
