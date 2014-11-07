import processing.pdf.*;
boolean record = false;

HShape d, e;
HColorPool colors, colors2;

void setup(){
	size(1280,1280);
	H.init(this).background(#ccd3ca);
	smooth();

	colors = new HColorPool(#c9492b, #1f658d, #556879, #bec5c7, #ccd3ca);
	colors2 = new HColorPool(#556879, #bec5c7, #ccd3ca);
	

	for (int i = 0; i<150; i++){
		e = new HShape("vectors-2.svg");
		e
			.enableStyle(false)
			.stroke(#555555,100)
			.strokeJoin(ROUND)
			.strokeCap(ROUND)
			.rotation(45)
			.size( (int)random(100,1000) )
			.loc( 700, (int)random(height) )
			.anchorAt(H.CENTER)
			
		;
		e.randomColors( colors.fillOnly());
		H.add(e);
	}

	for (int i = 0; i<150; i++){
		d = new HShape("vectors.svg");
		d
			.enableStyle(false)
			.stroke(#555555, 100)
			.strokeJoin(ROUND)
			.strokeCap(ROUND)
			.rotation(45)
			.size( (int)random(50,1000) )
			.loc( 960, (int)random(height) )
			.anchorAt(H.CENTER)
		;
		d.randomColors( colors2.fillOnly() );
		H.add(d);
	}

	for (int i = 0; i<150; i++){
		d = new HShape("vectors.svg");
		d
			.enableStyle(false)
			.stroke(#555555, 100)
			.strokeJoin(ROUND)
			.strokeCap(ROUND)
			.rotation(45)
			.size( (int)random(50,1000) )
			.loc( 320, (int)random(height) )
			.anchorAt(H.CENTER)
		;
		d.randomColors( colors2.fillOnly() );
		H.add(d);
	}
	
}

void draw() {
	PGraphics tmp = null;

	if (record) {
		tmp = beginRecord(PDF, "render-3-######.pdf");
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
