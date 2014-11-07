int value = 0;

HSwarm swarm;
HDrawablePool pool;
HTimer timer;
HTween t1a, t1b, t1c;

void setup() {
  size(1280,1280);
  H.init(this).background(#ffffff).autoClear(false);
  smooth();

  //swarm point
  swarm = new HSwarm()
    .addGoal(1280,1280)
    .speed(5)
    .turnEase(0.05f)
    .twitch(20)
  ;

  pool = new HDrawablePool(100);
  pool.autoAddToStage()
    .add (
      new HShape("geometrics.svg")
      .enableStyle(false)
      .anchorAt(H.CENTER)
      .size(400,400)
      .rotation(45)
    )

    .colorist(new HColorPool(#f6eaba, #f3e4ce, #dfac56, #7fc3e3, #2e4e83, #35424f, #3a4047).fillOnly())

    .onCreate (
      new HCallback() {
        public void run(Object obj) {
          HDrawable d = (HDrawable) obj;
          d
            .stroke(#333333)
            .loc( 200, 200 )
            .anchorAt( H.CENTER )
          ;

          swarm.addTarget(d);
         
          t1a = new HTween()
          .target(d).property(H.ROTATION)
          .start(-45)
          .end(405)
          .ease(0.005)
          .spring(0.95)
          ;
          
          t1b = new HTween()
          .target(d)
          .property(H.SCALE)
          .start(1)
          .end(.3)
          .ease(0.0005)
          .spring(0.95)
          ;
          
          t1c = new HTween()
          .target(d).property(H.LOCATION)
          .start(1280, 1280)
          .end(random(640),random(800))
          .ease(0.005)
          .spring(0.95)
          ;
        }
      }
    )
  ;

  timer = new HTimer()
    .numCycles( pool.numActive() )
    .interval(250)
    .callback(
      new HCallback() { 
        public void run(Object obj) {
          pool.request();
        }
      }
    )
  ;
}

void draw() {
  H.drawStage();

}

void keyPressed() {
  if (value == 0) {
    saveFrame("supercolony_20_365-###.png"); 
  }
}
