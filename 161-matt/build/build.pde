HDrawablePool pool;
HColorPool colors;
HCanvas canvas;

PShader flipHalf;
PShader flipHalfY;

void setup(){
	size(1000,1000, P3D);
	frameRate(24);
	H.init(this).background(#e4e2d6).use3D(true);
	smooth();

	canvas = (HCanvas) H.add(new HCanvas(P3D).autoClear(false).background(#000000));
	H.add(canvas);

	flipHalf = loadShader("flipHalf.glsl");
	flipHalfY = loadShader("flipHalfY.glsl");


	colors = new HColorPool()

		.add(#d297b3,5) //light pink
		.add(#4b5c6e,2) //grey
		.add(#7da67a,2) //green
		.add(#508eb7,2) //blue
		.add(#cbd8eb,2) //light blue
		.add(#dfd799,2) //blue
		// .fillOnly()
	;

	pool = new HDrawablePool(1000); //Shapes
	pool.autoParent(canvas)

		.add ( new HPath().polygon(2) )
		.add ( new HPath().polygon(3) )
		.add ( new HPath().polygon(5) )


		.onCreate(
			new HCallback() {
				public void run(Object obj) {
					int i = pool.currentIndex();
					HDrawable d = (HDrawable) obj;
					d
						// .strokeJoin(ROUND)
						// .strokeCap(ROUND)
						// .strokeWeight(2)
						// .stroke(#e4e2d6)
						.noStroke()
						.fill(colors.getColor())
						.anchor(random(-100,100),random(-200,200*PI))
						.x(random(0,width/2))
						.y(height/2)
						.size( ( (int)random(1,4) * 50 ) ) // 50, 100, 150, 200
					;


					new HOscillator()
						.target(d)
						.property(H.SIZE)
						.range(40, 80)
						.speed(.1)
						.freq(PI*3)
						.waveform(H.SAW)
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


