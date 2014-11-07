import processing.pdf.*;
boolean record = false;

HShape d, e;
HColorPool colors;
HDrawablePool pool;

void setup(){
	size(1000,1000);
	H.init(this).background(#0c6187);
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
		.add(#F69600)
		.add(#D3B89E)
		.add(#EADBC3)
		.add(#1D6189)
		.add(#5292C4)
		.add(#76ADD2)
	;

	pool = new HDrawablePool(500);
	pool.autoAddToStage()
		.add(new HShape("vectors-1.svg"))
		.add(new HShape("vectors-2.svg"))
		.add(new HShape("vectors-3.svg"))
		.add(new HShape("vectors-4.svg"))

		.layout(
			new HGridLayout()
			.startX(50)
			.startY(50)
			.spacing(50,50)
			.cols(19)
		)

		.onCreate(
			new HCallback() {
				public void run(Object obj) {
					HShape d = (HShape) obj;
					d
						.enableStyle(false)
						.noStroke()
						// .strokeJoin(ROUND)
						// .strokeCap(ROUND)
						// .strokeWeight(2)
						// .stroke(#333333)
						//.anchorAt(H.CENTER)
						.size( 50 + ( (int)random(4) * 100 ) )
						.rotate( (int)random(4) * 90 )
					;
					d.randomColors(colors.fillOnly());
				}
			}
		)
		.requestAll()
	;

	H.drawStage();

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
