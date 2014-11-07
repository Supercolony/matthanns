import processing.pdf.*;
boolean record = false;

HShape d, e;
HColorPool colors;

void setup(){
	size(1000,1000);
	H.init(this).background(#ffffff);
	smooth();

	colors = new HColorPool()
		.add(#34221C)
		.add(#7A6954)
		.add(#ADA095)
		.add(#BE885F)
		.add(#AA3910)
		.add(#D17018)
		.add(#F49F4F)
		.add(#FFBE6A)
		.add(#F5D1A2)
		.add(#F69600, 10)
		.add(#D3B89E)
		.add(#EADBC3)
		.add(#1D6189)
		.add(#5292C4)
		.add(#76ADD2)
	;

	for (int i = 0; i<50; i++){
		d = new HShape("vectors-1.svg");
		d
			.enableStyle(false)
			.noStroke()
			.size(300)
			.loc(i*100, 300)
			.anchorAt(H.CENTER)
		;
		d.randomColors( colors.fillOnly() );
		H.add(d);
	}

	for (int i = 0; i<50; i++){
		e = new HShape("vectors-2.svg");
		e
			.enableStyle(false)
			.noStroke()
			.size(200)
			.rotate(270)
			.loc(i*100,450)
			.anchorAt(H.CENTER)
		;
		e.randomColors( colors.fillOnly() );
		H.add(e);
	}

	for (int i = 0; i<50; i++){
		e = new HShape("vectors-2.svg");
		e
			.enableStyle(false)
			.noStroke()
			.size(200)
			.rotate(-270)
			.loc(i*100,550)
			.anchorAt(H.CENTER)
		;
		e.randomColors( colors.fillOnly() );
		H.add(e);
	}

	for (int i = 0; i<50; i++){
		e = new HShape("vectors-3.svg");
		e
			.enableStyle(false)
			.noStroke()
			.size(100)
			.rotate(-180)
			.loc(i*100,625)
			.anchorAt(H.CENTER)
		;
		e.randomColors( colors.fillOnly() );
		H.add(e);
	}

	for (int i = 0; i<50; i++){
		e = new HShape("vectors-3.svg");
		e
			.enableStyle(false)
			.noStroke()
			.size(100)
			.rotate(-180)
			.loc(i*100,375)
			.anchorAt(H.CENTER)
		;
		e.randomColors( colors.fillOnly() );
		H.add(e);
	}

	for (int i = 0; i<200; i++){
		e = new HShape("vectors-4.svg");
		e
			.enableStyle(false)
			.noStroke()
			.size(200)
			.rotate(-180)
			.loc(i*50,850)
			.anchorAt(H.CENTER)
		;
		e.randomColors( colors.fillOnly() );
		H.add(e);
	}

	for (int i = 0; i<200; i++){
		e = new HShape("vectors-4.svg");
		e
			.enableStyle(false)
			.noStroke()
			.size(200)
			.loc(i*50,150)
			.anchorAt(H.CENTER)
		;
		e.randomColors( colors.fillOnly() );
		H.add(e);
	}

	for (int i = 0; i<50; i++){
		d = new HShape("vectors-1.svg");
		d
			.enableStyle(false)
			.noStroke()
			.size(300)
			.rotate(180)
			.loc(i*100,700)
			.anchorAt(H.CENTER)
		;
		d.randomColors( colors.fillOnly() );
		H.add(d);
	}

}

void draw() {
	PGraphics tmp = null;

	if (record) {
		tmp = beginRecord(PDF, "render-4-######.pdf");
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
