import processing.pdf.*;
boolean record = false;

HShape d, e;
HColorPool colors;

void setup(){
	size(1280,1280);
	H.init(this).background(#00201f);
	smooth();

	colors = new HColorPool(#cc0093, #6f00c5, #0a00c5, #0060c5, #00c5c1);

	for (int i = 0; i<150; i++){
		d = new HShape("vectors-1.svg");
		d
			.enableStyle(false)
			.stroke(#00201f)
			.strokeJoin(ROUND)
			.strokeCap(ROUND)
			.size( (int)random(50,1500) )
			.rotate(random(45, 360))
			.loc( 640, 640)
			.anchorAt(H.CENTER)
		;
		d.randomColors( colors.fillOnly() );
		H.add(d);
	}
}

void draw() {
	PGraphics tmp = null;

	if (record) {
		tmp = beginRecord(PDF, "render-2-######.pdf");
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
