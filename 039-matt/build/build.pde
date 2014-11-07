import processing.pdf.*;
HShape d, e;
HColorField colors;
boolean record = false;

void setup(){
	size(1000,1000);
	H.init(this).background(#6A262B);
	smooth();

	colors = new HColorField(width,height)
		.addPoint(width/2, height/2, #DA1432, 0.5)
		.addPoint(width/4, height/2, #ED6854, 0.2)
		.addPoint(0, height/2, #B6878C, 0.2)
		.addPoint(width/2, 0, #D3BDBC, 0.2)
		.addPoint(width, height, #DFDBDB, 0.5)
		.fillOnly()
	;

	for (int i = 0; i<50; i++){
		d = new HShape("vectors-1.svg");
		d
			.enableStyle(false)
			.noStroke()
			.fill(#6A262B)
			.size( (int)random(400,800) )
			.rotate(45)
			.loc( (int)random(width), (int)random(height) )
			.anchorAt(H.CENTER)
		;
		colors.applyColor(d);
		H.add(d);
	}

	for (int i = 0; i<50; i++){
		e = new HShape("vectors-2.svg");
		e
			.enableStyle(false)
			.noStroke()
			.fill(#6A262B)
			.size( (int)random(400,800) )
			.rotate(45)
			.loc( (int)random(width), (int)random(height) )
			.anchorAt(H.CENTER)
		;
		colors.applyColor(e);
		H.add(e);
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
