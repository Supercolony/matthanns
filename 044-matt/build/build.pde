import processing.pdf.*;

HDrawablePool pool1, pool2, pool3, pool4;
HColorPool colors;
HShape d;
boolean record = false;

void setup(){
	size(1000,1000);
	H.init(this).background(#1CB7D5);
	smooth();

	colors = new HColorPool(#E74A3A,#4CB66C,#8DE6EE,#F6D044,#D5F8D5,#FCFEF2);

	pool3 = new HDrawablePool(10);
	pool3.autoAddToStage()
		.add(new HShape("vectors-3.svg"))

		.layout(
			new HHexLayout()
			.spacing(50)
			.offsetX(0)
			.offsetY(-500)
		)

		.onCreate(
			new HCallback() {
				public void run(Object obj) {	
					HShape d = (HShape) obj;
					d
						.enableStyle(false)
						.noStroke()
						.anchorAt(H.CENTER)
						.size((int)random(700,2000))
						.rotate(45)
					;
					d.randomColors(colors.fillOnly());
				}
			}
		)
		.requestAll()
	;
	
	pool1 = new HDrawablePool(10);
	pool1.autoAddToStage()
		.add(new HShape("vectors-1.svg"))

		.layout(
			new HHexLayout()
			.spacing(50)
			.offsetX(0)
			.offsetY(-100)
		)

		.onCreate(
			new HCallback() {
				public void run(Object obj) {	
					HShape d = (HShape) obj;
					d
						.enableStyle(false)
						.noStroke()
						.anchorAt(H.CENTER)
						.size(400)
						.rotate(45)
					;
					d.randomColors(colors.fillOnly());
				}
			}
		)
		.requestAll()
	;

	pool2 = new HDrawablePool(30);
	pool2.autoAddToStage()
		.add(new HShape("vectors-2.svg"))

		.layout(
			new HHexLayout()
			.spacing(10)
			.offsetX(0)
			.offsetY(100)
		)

		.onCreate(
			new HCallback() {
				public void run(Object obj) {	
					HShape d = (HShape) obj;
					d
						.enableStyle(false)
						.noStroke()
						.anchorAt(H.CENTER)
						.size((int)random(200,600))
						.rotate(45)
					;
					d.randomColors(colors.fillOnly());
				}
			}
		)
		.requestAll()
	;

	

	

	H.drawStage();
	noLoop();
}
 
void draw(){ 
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

