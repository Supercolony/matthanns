int value = 0;

HSwarm swarm;
HDrawablePool pool;
HTimer timer;

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
      .size(300,300)
    )

    .colorist(new HColorPool(#44bd78, #ab92e5, #ed7152, #333333, #2f4555, #61bd43, #4181b8, #7b41b8).fillOnly())

    .onCreate (
      new HCallback() {
        public void run(Object obj) {
          HDrawable d = (HDrawable) obj;
          
            .stroke(#ffffff)
            .loc( 0, 0 )
            .anchorAt( H.CENTER )
          ;

          swarm.addTarget(d);
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
    saveFrame("supercolony_19_365-###.png"); 
  }
}
