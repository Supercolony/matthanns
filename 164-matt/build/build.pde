HDrawablePool pool;
HColorPool colors;
HCanvas canvas;
HShape d;
PShader flipHalf;
PShader flipHalfY;

void setup(){
	size(1000,1000, P3D);
	frameRate(24);
	H.init(this).background(#f3e1d3).use3D(true);
	smooth();

	canvas = (HCanvas) H.add(new HCanvas(P3D).autoClear(false).background(#000000));
	H.add(canvas);

	flipHalf = loadShader("flipHalf.glsl");
	//flipHalfY = loadShader("flipHalfY.glsl");


	colors = new HColorPool()

		.add(#bc2011,3) 
		.add(#f3e1d3,2)
		.add(#ffbe64,2)
		.add(#afbea9,2)
		.add(#dd6b82,2)
		.add(#58200e,2)
		.add(#bdc093,2)
		.add(#d78fbd,2)
	;

	pool = new HDrawablePool(500); //Shapes
	pool.autoParent(canvas)

		.add(new HShape("vectors-1.svg"))
		.add(new HShape("vectors-2.svg"))
		.add(new HShape("vectors-3.svg"))


		.onCreate(
			new HCallback() {
				public void run(Object obj) {
					int i = pool.currentIndex();
					HShape d = (HShape) obj;
					d
						.enableStyle(false)
						.noStroke()
						.fill(colors.getColor(),50)
						.x(random(0,width/2))
						.y(random(0,width/2))
						.size( ( (int)random(1,2) * 200 ) ) // 50, 100, 150, 200
					;


					new HOscillator()
						.target(d)
						.property(H.SIZE)
						.range((int)random(1,2)*100, 1500)
						.speed(.1)
						.freq(PI*3)
						//.waveform(H.SAW)
						.currentStep(i+10*PI)
					;

					new HOscillator()
						.target(d)
						.property(H.Z)
						.range(-100, 0)
						.speed(.5)
						.freq(2)
						.waveform(H.SAW)
						.currentStep(i+20)
					;

					new HOscillator()
						.target(d)
						.property(H.X)
						.range(width/2+100, -100)
						.speed(random(3))
						.freq(random(2))
						.waveform(H.SAW)
						.currentStep(i)
					;

					new HOscillator()
						.target(d)
						.property(H.ROTATIONX)
						.range(-60, 60/PI)
						.speed(.1)
						.freq(random(2))
						.waveform(H.TRIANGLE)
						.currentStep(i+100)
					;

					new HOscillator()
						.target(d)
						.property(H.ROTATIONY)
						.range(-30, 30)
						.speed(.1)
						.freq(3)
						.waveform(H.SAW)
						.currentStep(i)
					;

					new HOscillator()
						.target(d)
						.property(H.ROTATIONZ)
						.range(-360, 720)
						.speed(.2)
						.freq(random(16))
						.waveform(H.SAW)
						.currentStep(i)
					;

				}
			}
		)
		.requestAll()
	;


}

 
void draw() {

	H.drawStage();

	filter(flipHalfY); //flip half composition with glsl shader
	filter(flipHalf); //flip half composition with glsl shader

}

void keyPressed() {
  if (key == 's') {
    //stop();
    saveFrame();
  }
}


