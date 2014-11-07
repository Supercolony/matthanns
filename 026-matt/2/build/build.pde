import processing.pdf.*;
boolean record = false;

HShape d, e;
HColorPool colors;
HDrawablePool pool;

void setup(){
	size(1000,1000);
	H.init(this).background(#0c6187);
	smooth();
	colors = new HColorPool(#40332E,#A85D33,#D28743,#9F8161,#D8B380,#ECD5A7,#FAF4D2,#157AA9,#34BFD4,#9DDBE9,#9DC8B4,#3A8C52,#F9AD19,#F8C740,#FBDB68)
	;

	pool = new HDrawablePool(1000);
	pool.autoAddToStage()
		.add(new HShape("vectors-1.svg"),10)
		.add(new HShape("vectors-2.svg"))
		.add(new HShape("vectors-3.svg"),20)

		.layout(
			new HGridLayout()
			.startX(-100)
			.startY(-100)
			.spacing(random(50)*5,50)
			.cols(10)
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
						// .strokeWeight(1)
						// .stroke(#333333)
						//.anchorAt(H.CENTER)
						.size( 100 + ( (int)random(4) * 200 ) )
						//.rotate( (int)random(4) * 90 )
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
