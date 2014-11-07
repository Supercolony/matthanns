import processing.pdf.*;
boolean record = false;

HShape d, e;
HColorPool colors;

void setup(){
	size(1000,1000);
	H.init(this).background(#cec6b0);
	smooth();

	colors = new HColorPool(#024c75, #519fb5, #a3cbcb, #a19b8f);

	for (int i = 0; i<150; i++){
		e = new HShape("vectors-1.svg");
		e
			.enableStyle(false)
			.stroke(#519fb5, 50)
			.fill(#a3cbcb, 50)
			.strokeJoin(ROUND)
			.strokeCap(ROUND)
			.size( (int)random(50,1500) )
			.loc(random(width),random(height))
			.anchorAt(H.CENTER)
		;
		H.add(e);
	}

	for (int i = 0; i<150; i++){
		d = new HShape("vectors-1.svg");
		d
			.enableStyle(false)
			.stroke(#ffffff)
			.strokeJoin(ROUND)
			.strokeCap(ROUND)
			.size( (int)random(50,1500) )
			//.rotate(random(45, 360))
			.loc(500,random(height))
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
