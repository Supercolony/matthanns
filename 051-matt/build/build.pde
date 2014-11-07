import processing.pdf.*;
boolean record = false;

HShape d, e;
HColorPool colors;

void setup(){
	size(1000,1000);
	H.init(this).background(#1E0D06);
	smooth();

	colors = new HColorPool(#1E0D06,#311209,#45160C,#651B0D,#861D0B,#962608,#A81F0D,#C0240D,#D63610,#DE3F10,#F14C12);


	for (int i = 0; i<150; i++){
		d = new HShape("vectors-1.svg");
		d
			.enableStyle(false)
			//.stroke(#ffffff)
			.noStroke()
			.strokeJoin(ROUND)
			.strokeCap(ROUND)
			.size( (int)random(200,800) )
			.rotate(random(45, 360))
			.loc(800,random(1000))
			.anchorAt(H.CENTER)
		;
		d.randomColors( colors.fillOnly() );
		H.add(d);
	}

	for (int i = 0; i<150; i++){
		e = new HShape("vectors-2.svg");
		e
			.enableStyle(false)
			//.stroke(#ffffff)
			.noStroke()
			.strokeJoin(ROUND)
			.strokeCap(ROUND)
			.size( (int)random(200,600) )
			.rotate(random(45, 360))
			.loc(500,random(1000))
			.anchorAt(H.CENTER)
		;
		e.randomColors( colors.fillOnly() );
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
}

void keyPressed() {
	if (key == 's') {
		record = true;
		draw();
	}
}
