HColorPool colors;
HDrawablePool pool;

import processing.pdf.*;
boolean record = false;

int value = 0;

void setup() {
  size(1000,1000);
  H.init(this).background(#303C4B);
  smooth();

  colors = new HColorPool(#656872,#8C7A8F,#7F8189,#8E8D95,#A4889E,#99989F,#B398A9,#A3A3A9,#B0ACB2,#C7ADB8,#BCBABF,#CFC3C9,#DEDADB);

  pool = new HDrawablePool(400);
  pool.autoAddToStage()
    .add(
      new HRect(50)
      .rounding(100)
      .anchorAt(H.CENTER)
      .noFill()
    )

    .layout(
      new HGridLayout()
      .startLoc(width/2, height/2)
      .spacing(1, 100)
      .cols(40)
    )

    .onCreate(
      new HCallback() {
        public void run(Object obj) {
          int i = pool.currentIndex();

          HDrawable d = (HDrawable) obj;
          d.stroke( colors.getColor(i*100) );

          new HOscillator()
            .target(d)
            .property(H.X)
            .relativeVal(d.x())
            .range(-500, 100)
            .speed(1)
            .freq(0.5)
            .currentStep(i)
          ;

          new HOscillator()
            .target(d)
            .property(H.Y)
            .relativeVal(d.y())
            .range(-300, 100)
            .speed(2)
            .freq(0.7)
            .currentStep(i)
          ;

          new HOscillator()
            .target(d)
            .property(H.ROTATION)
            .range(0, 360)
            .speed(0.001)
            .freq(1)
            .currentStep(i)
          ;

          new HOscillator()
            .target(d)
            .property(H.SCALE)
            .range(0, 6)
            .speed(1)
            .freq(4)
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
