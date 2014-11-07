import processing.pdf.*;

HDrawablePool pool;
HColorPool colors;
HShape d;
boolean record = false;

void setup(){
	size(1000,1000);
	H.init(this).background(#fdf7e1);
	smooth();

	colors = new HColorPool(#521F27,#1B5078,#208AA9,#4C6148,#A2C559,#EA5427,#D67B90,#8DA7A3,#CDC4BD,#DF9F95,#F5CCBB,#F3CC3A,#EDE08E);

	pool = new HDrawablePool(200);
	pool.autoAddToStage()
		.add(new HShape("vectors-1.svg"))

		.layout(
			new HHexLayout()
			.spacing(10)
			.offsetX(0)
			.offsetY(0)
		)

		.onCreate(
			new HCallback() {
				public void run(Object obj) {	
					HShape d = (HShape) obj;
					d
						.enableStyle(false)
						.noStroke()
						.anchorAt(H.CENTER)
						.size( (int)random(50,500) )
						.rotate( (int)random(10,90) )
					;
					d.randomColors(colors.fillOnly());
				}
			}
		)
		.requestAll()
	;

	H.drawStage();
	noLoop();
}
 
void draw(){ 
	PGraphics tmp = null;

	if (record) {
		tmp = beginRecord(PDF, "render-1-######.pdf");
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

