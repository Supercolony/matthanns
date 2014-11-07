import processing.pdf.*;
HShape d;
HColorField colors;
boolean record = false;

void setup(){
	size(1000,1000);
	H.init(this).background(#076bc0);
	smooth();

	colors = new HColorField(width,height)
		.addPoint(width/2, height/2, #f57358, 0.5)
		.addPoint(width/2, height/2, #ededed, 0.2)
		.fillOnly()
	;

	for (int i = 0; i<200; i++){
		d = new HShape("vectors-1.svg");
		d
			.enableStyle(false)
			.noStroke()
			.fill(#076bc0)
			.size( (int)random(25,800) )
			.rotate(random(25))
			.loc( (int)random(width), (int)random(height) )
			.anchorAt(H.CENTER)
		;
		colors.applyColor(d);
		H.add(d);
	}
}

void draw() {
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
