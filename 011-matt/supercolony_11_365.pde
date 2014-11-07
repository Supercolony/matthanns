HDrawablePool pool;
int value = 0;

void setup() {
  size(1280,1280);
  H.init(this).background(#66ccff);
  smooth();
  pool = new HDrawablePool(1000);
  pool.autoAddToStage()
    .add (
      new HShape("geometrics.svg")
      .enableStyle(false)
      .strokeJoin(CENTER)
      .strokeCap(CENTER)
      .anchorAt(H.CENTER)
    )
    
    .layout (
      new HGridLayout()
      .startX(10)
      .startY(100)
      .spacing(50,200)
      .cols(40)
    )

    .onCreate (
      new HCallback() {
        public void run(Object obj) {
          HDrawable d = (HDrawable) obj;
          d
            .fill( #ffffff, (int)random(noise(50),170))
            .strokeWeight(3)
            .stroke( #66ccff,(int)random(150))
            //.noStroke()
            .rotation( ((int)random(400)) * sin(90)  )
            //.rotation( ((int)random(10)))
          ;
        }
      }
    )

    .requestAll()
  ;

  H.drawStage();
  noLoop();
}

void draw() {}

void keyPressed() {
  if (value == 0) {
    saveFrame("supercolony_11_365-004.png"); 
  }
}
