import processing.pdf.*;
boolean record = false;

HShape d, e;
HColorPool colors;
HDrawablePool pool, pool2, pool3, pool4, pool5, pool6;


void setup(){
	size(1000,1000);
	H.init(this).background(#f6ebd5);
	smooth();
	colors = new HColorPool(#ed333f,#7cb3a8, #333333);

	pool = new HDrawablePool(30);
	pool.autoAddToStage()
	
		.add(new HShape("vectors-1.svg"))

		.layout(
			new HGridLayout()
			.startX(200)
			.startY(500)
			.spacing(0,sin(100))
			.cols(1)
		)

		.onCreate(
			new HCallback() {
				public void run(Object obj) {	
					HShape d = (HShape) obj;
					d
						.enableStyle(false)
						.noStroke()
						.anchorAt(H.CENTER)
						.size((int)random(sin(300),800))
						.rotate((int)random(360))
					;
					d.randomColors(colors.fillOnly());
				}
			}
		)
		.requestAll()
	;

	pool3 = new HDrawablePool(30);
	pool3.autoAddToStage()
	
		.add(new HShape("vectors-2.svg"))

		.layout(
			new HGridLayout()
			.startX(500)
			.startY(500)
			.spacing(0,cos(100))
			.cols(1)
		)

		.onCreate(
			new HCallback() {
				public void run(Object obj) {	
					HShape d = (HShape) obj;
					d
						.enableStyle(false)
						.noStroke()
						.anchorAt(H.CENTER)
						.size((int)random(300,800*sin(90)))
						.rotate((int)random(360))
					;
					d.randomColors(colors.fillOnly());
				}
			}
		)
		.requestAll()
	;

	pool2 = new HDrawablePool(30);
	pool2.autoAddToStage()
	
		.add(new HShape("vectors-1.svg"))

		.layout(
			new HGridLayout()
			.startX(800)
			.startY(0)
			.spacing(0,100)
			.cols(1)
		)

		.onCreate(
			new HCallback() {
				public void run(Object obj) {	
					HShape d = (HShape) obj;
					d
						.enableStyle(false)
						.noStroke()
						.anchorAt(H.CENTER)
						.size((int)random(300,800))
						.rotate((int)random(360))
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
