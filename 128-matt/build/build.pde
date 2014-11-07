import processing.pdf.*;
boolean record = false;

HShape d, e;
HColorPool colors;
HDrawablePool pool, pool2, pool3;

void setup(){
	size(640,640);
	H.init(this).background(#fffcdf);
	smooth();
	colors = new HColorPool()
		.add(#6b1d19, 3)
		.add(#c52212, 9)
		.add(#f0b48d, 4)
	;

	pool = new HDrawablePool(576);
	pool.autoAddToStage()
		.add(new HShape("vectors-1.svg"))
		.add(new HShape("vectors-2.svg"))

		.layout (
			new HGridLayout()
			.startX(32)
			.startY(32)
			.spacing(25,25)
			.cols(24)
		)

		.onCreate (
			 new HCallback() {
				public void run(Object obj) {
					HDrawable d = (HDrawable) obj;
					d
						.size((int)random(50,100))
						.noStroke()
						.fill( colors.getColor() )
						.alpha( (int)random(100,800) )
						.anchorAt(H.CENTER)
					;

					HRotate rot = new HRotate();
					rot.target(d).speed( random(-2,2) );
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
