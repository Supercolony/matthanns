HDrawablePool pool;
int value = 0;

void setup() {
  size(1280,1280);
  H.init(this).background(#008ecc );
  smooth();
  pool = new HDrawablePool(10);
  pool.autoAddToStage()
    .add (
      new HShape("geometrics-1.svg")
      .enableStyle(false)
      .strokeJoin(CENTER)
      .strokeCap(CENTER)
      .anchorAt(H.CENTER)
    )
    
    .add (
      new HShape("geometrics-2.svg")
      .enableStyle(false)
      .strokeJoin(CENTER)
      .strokeCap(CENTER)
      .anchorAt(H.CENTER)
    )

    .layout (
      new HGridLayout()
      .startX(10)
      .startY(10)
      .spacing(50,200)
      .cols(40)
    )

    .onCreate (
      new HCallback() {
        public void run(Object obj) {
          HDrawable d = (HDrawable) obj;
          d
            .fill( #ffffff, (int)random(255))
            //.strokeWeight(1)
            //.stroke( #ffffff )
            .noStroke()
            //.rotation( ((int)random(400)) * random(90)  )
            .rotation( ((int)random(10)))
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
    saveFrame("supercolony_9_365-010.png"); 
  }
}
