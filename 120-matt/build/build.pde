HColorPool colors;
HDrawablePool pool;

import processing.pdf.*;
boolean record = false;

int value = 0;

void setup() {
  size(1000,1000);
  H.init(this).background(#063435);
  smooth();

  colors = new HColorPool(#057c7d,#02aeb8,#0a747f,#58d0c6);

  pool = new HDrawablePool(400);
  pool.autoAddToStage()
    .add(
      new HPath(10)
      .triangle( H.ISOCELES, H.TOP )
      .anchorAt(H.CENTER)
      .noFill()
    )

    .layout(
      new HGridLayout()
      .startLoc(width/2, height/2)
      .spacing(10, 10)
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
