import processing.pdf.*;
boolean record = false;

HShape d, e, f;
HColorPool colors;
HDrawablePool pool, pool2, pool3;

void setup(){
	size(1000,1000);
	H.init(this).background(#EFF3F8);
	smooth();
	colors = new HColorPool(#3E3543,#676B78,#7F8892,#B0B6C3,#D3D9E3,#8C5B56,#C9A69E,#A57686,#CEBACD,#D6C9D6,#BCCCD6,#D8EAEF,#A3A0A1);

	pool = new HDrawablePool(1000);
	pool.autoAddToStage()
		.add(new HShape("vectors-1.svg"),60)
		.add(new HShape("vectors-2.svg"),20)
		.add(new HShape("vectors-3.svg"),20)

		.layout(
			new HGridLayout()
			//.startX(50)
			.startX(350)
			.startY(0)
			.spacing(50,100)
			.cols(10)
		)

		.onCreate(
			new HCallback() {
				public void run(Object obj) {
					for (int i = 0; i < 50; ++i) {
					HShape d = (HShape) obj;
					d
						.enableStyle(false)
						.noStroke()
						.anchorAt(H.CENTER)
						.size(random(50+(i*10)))
						.fill( colors.getColor() )
						.alpha( (int)random(50,250) )
						//.rotate( (int)random(4) * 90 )
					;
						d.randomColors(colors.fillOnly());
					}
				}
			}
		)
		.requestAll()
	;
	pool2 = new HDrawablePool(1000);
	pool2.autoAddToStage()
		.add(new HShape("vectors-1.svg"),20)
		.add(new HShape("vectors-2.svg"))
		.add(new HShape("vectors-3.svg"),20)

		.layout(
			new HGridLayout()
			//.startX(50)
			.startX(500)
			.startY(0)
			.spacing(10,80)
			.cols(10)
		)

		.onCreate(
			new HCallback() {
				public void run(Object obj) {
					for (int i = 0; i < 50; i++) {
					HShape e = (HShape) obj;
					e
						.enableStyle(false)
						.noStroke()
						.anchorAt(H.CENTER)
						.size(random(50+(i*5)))
						.fill( colors.getColor() )
						.alpha( (int)random(100,250) )
						//.rotate( (int)random(4) * 90 )
					;
						//e.randomColors(colors.fillOnly());
					}	
				}
			}
		)
		.requestAll()
	;

	pool3 = new HDrawablePool(1000);
	pool3.autoAddToStage()
		.add(new HShape("vectors-1.svg"),10)
		.add(new HShape("vectors-2.svg"))
		.add(new HShape("vectors-3.svg"),20)

		.layout(
			new HGridLayout()
			//.startX(50)
			.startX(750)
			.startY(0)
			.spacing(10,100)
			.cols(10)
		)

		.onCreate(
			new HCallback() {
				public void run(Object obj) {
					for (int i = 0; i < 50; ++i) {
					HShape f = (HShape) obj;
					f
						.enableStyle(false)
						.noStroke()
						.anchorAt(H.CENTER)
						.size(i*15)	
						.fill( colors.getColor() )
						.alpha( (int)random(50,100) )
						.rotate( (int)random(4) * 90 )
					;
						//f.randomColors(colors.fillOnly());
					}
				}
			}
		)
		.requestAll()
	;	

}

void draw() {
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
