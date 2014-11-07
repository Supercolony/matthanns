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
    .twitch(100)
  ;

  pool = new HDrawablePool(100);
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

    .colorist(new HColorPool(#cdcdcd, #9a9a9a, #585858, #cc0099, #7f7f7f, #727272, #484848, #636363).fillOnly())

    .onCreate (
      new HCallback() {
        public void run(Object obj) {
          HDrawable d = (HDrawable) obj;
          d
            //.size((int)random(10,200), (int)random(2,200) )
            //.size((int)random(80,100), (int)random(50,80) )
             //.size((int)random(100,120), (int)random(200,250) )
            .strokeWeight(2)
            .stroke(#333333, 255)
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
