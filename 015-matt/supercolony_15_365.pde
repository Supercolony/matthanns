int value = 0;

HSwarm swarm;
HDrawablePool pool;
HTimer timer;


void setup() {
  size(1280,1280);
  H.init(this).background(#ffffff).autoClear(false);
  smooth();

  swarm = new HSwarm()
    .addGoal(H.mouse())
    .speed(5)
    .turnEase(0.05f)
    .twitch(20)
  ;

  pool = new HDrawablePool(40);
  pool.autoAddToStage()
//    .add (
//      new HRect()
//      .rounding(4)
//    )
    .add (
      new HShape("geometrics.svg")
      .enableStyle(false)
      .anchorAt(H.CENTER)
      .strokeCap(CENTER)
      .strokeJoin(CENTER)
    )

    .colorist(new HColorPool(#009ecc, #ff6600, #0099cc, #8800cc, #d9007e, #ff0000, #FF3300, #FF6600).fillOnly())

    .onCreate (
      new HCallback() {
        public void run(Object obj) {
          HDrawable d = (HDrawable) obj;
          d
            //.size((int)random(10,200), (int)random(2,200) )
            //.size((int)random(80,100), (int)random(50,80) )
             //.size((int)random(100,120), (int)random(200,250) )
            .strokeWeight(2)
            .stroke(#005e79, 255)
            //.fill(#ffffff)
            .loc( width/2, height/2 )
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
    saveFrame("supercolony_15_365-###.png"); 
  }
}
