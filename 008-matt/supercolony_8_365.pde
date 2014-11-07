HColorPool colors;
HDrawablePool pool;

int value = 0;

void setup() {
  size(1280,1280);
  H.init(this).background(#ffd800);
  smooth();

  colors = new HColorPool(#FFFFFF,#FFFFFF, #FFFFFF,#FFFFFF,#FFFFFF,#FFFFFF);

  pool = new HDrawablePool(500);
  pool.autoAddToStage()
    .add(
      new HRect(random(100))
      .rounding(200)
      .anchorAt(H.CENTER)
      .stroke(255)
    )

    .layout(
      new HGridLayout()
      .startLoc(0, height/2)
      .spacing(0, 2)
      .cols(500)
    )

    .onCreate(
      new HCallback() {
        public void run(Object obj) {
          int i = pool.currentIndex();

          HDrawable d = (HDrawable) obj;
          d.fill( colors.getColor(i*100), 70);

          new HOscillator()
            .target(d)
            .property(H.X)
            .relativeVal(d.x())
            .range(-1280, 1280)
            .speed(0.05*PI)
            .freq(1)
            .currentStep(i)
          ;

          new HOscillator()
            .target(d)
            .property(H.Y)
            .relativeVal(d.y())
            .range(-1280, 1280)
            .speed(0.05*PI)
            .freq(10)
            .currentStep(i)
          ;

          new HOscillator()
            .target(d)
            .property(H.ROTATION)
            .range(0, 1280)
            .speed(0.001)
            .freq(5*i)
            .currentStep(i)
          ;

          new HOscillator()
            .target(d)
            .property(H.SCALE)
            .range(0, 2)
            .speed(0.05)
            .freq(2*i)
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
}

void keyPressed() {
  if (value == 0) {
    saveFrame("supercolony_8_365-###.png"); 
  }
}
