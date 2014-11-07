import processing.pdf.*;

HDrawablePool pool1, pool2;
HColorPool colors;
HShape d;
boolean record = false;

void setup(){
	size(1000,1000);
	H.init(this).background(#fbb89b);
	smooth();

	colors = new HColorPool(#8A1F01,#9B2A04,#B7451C,#E3480D,#F65516,#FFB598,#CD714C,#FB7C48,#F99B73,#FBBB9F,#FECDB7,#FEDBCB,#FFF0E9,#FDE6D7,#E9CFBD,#FEF4EB);

	pool1 = new HDrawablePool(50);
	pool1.autoAddToStage()
		.add(new HShape("vectors-1.svg"))

		.layout(
			new HHexLayout()
			.spacing(50)
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
						//.fill(#b74a29)
						.anchorAt(H.CENTER)
						//.alpha(50)	
						.size( (int)random(50,500) )
						//.rotate( (int)random(10,90) )
						//.rotate()
					;
					d.randomColors(colors.fillOnly());
				}
			}
		)
		.requestAll()
	;

	pool2 = new HDrawablePool(50);
	pool2.autoAddToStage()
		.add(new HShape("vectors-2.svg"))

		.layout(
			new HHexLayout()
			.spacing(50)
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
						//.fill(#ffffff)
						//.alpha((int)random(50,200) )
						.anchorAt(H.CENTER)
						//.size(50)
						.size( (int)random(100,500) )
						//.rotate( (int) random(90) )
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

