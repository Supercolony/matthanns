HColorPool colors;
HDrawablePool pool;

import processing.pdf.*;
boolean record = false;

int value = 0;

void setup() {
  size(1000,1000);
  H.init(this).background(#cad9f0);
  smooth();

  colors = new HColorPool(#258fa2, #f0483f, #f6e24c);

  pool = new HDrawablePool(400);
  pool.autoAddToStage()
    .add(
      new HRect(100)
      .rounding(100)
      .anchorAt(H.CENTER)
      .noStroke()
    )

    .layout(
      new HGridLayout()
      .startLoc(0, height/2)
      .spacing(1, 100)
      .cols(40)
    )

    .onCreate(
      new HCallback() {
        public void run(Object obj) {
          int i = pool.currentIndex();

          HDrawable d = (HDrawable) obj;
          d.fill( colors.getColor(i*100) );

          new HOscillator()
            .target(d)
            .property(H.X)
            .relativeVal(d.x())
            .range(0, 500)
            .speed(1)
            .freq(0.5)
            .currentStep(i)
          ;

          new HOscillator()
            .target(d)
            .property(H.Y)
            .relativeVal(d.y())
            .range(0, 500)
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
            .range(0, 2)
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
