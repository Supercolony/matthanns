int value = 0;

HShape  shape1;
HTween tween;
HCallback tr, br, bl, tl;
HColorPool colors;
int marginOffset = 100;
float tweenEase = 0.01;
float tweenSpeed = 0.9;

void setup() {
  size(1280,1280);
  H.init(this).background(#ff6666).autoClear(false);
  smooth();
  colors = new HColorPool(#ff6666, #e85dae, #ffa366);
    shape1 = new HShape("geometrics.svg");
    shape1
    .enableStyle(false)
    .strokeJoin(CENTER)
    .strokeWeight(1)
    .strokeCap(CENTER)
    .anchorAt(H.CENTER)
    .stroke(#ffffff)
    //.noFill()
    .fill(#e85dae)
    .loc(marginOffset,marginOffset)
    .rotation(random(45))
  ;
  H.add(shape1);

  new HOscillator()
    .target(shape1)
    .property(H.ROTATION)
    .range(-180, 360)
    .speed(1)
    .freq(2)
  ;

  new HOscillator()
    .target(shape1)
    .property(H.SCALE)
    .range(1, 2)
    .speed(0.5)
    .freq(5)
  ;


  // tween from center to TL corner

  tween = new HTween()
    .target(shape1).property(H.LOCATION)
    .start(shape1.x(), shape1.y())
    .end(marginOffset, marginOffset)
    .ease(1).spring(0)
  ;

  // tween from TL to TR corner

  tr = new HCallback() {
    public void run(Object obj) {
      tween.start( shape1.x(), shape1.y() ).end( width-marginOffset, marginOffset )
      .ease(tweenEase).spring(tweenSpeed)
      .register().callback(br);
    }
  };

  // tween from TR to BR corner

  br = new HCallback() {
    public void run(Object obj) {
      tween.start( shape1.x(), shape1.y() ).end( random(width-marginOffset), random(height-marginOffset) )
      .ease(tweenEase).spring(tweenSpeed)
      .register().callback(bl);
    }
  };

  // tween from BR to BL corner

  bl = new HCallback() {
    public void run(Object obj) {
      tween.start( shape1.x(), shape1.y() ).end( random(marginOffset), random(height-marginOffset) )
      .ease(tweenEase).spring(tweenSpeed)
      .register().callback(tl);
    }
  };

  // tween from BL to TL corner

  tl = new HCallback() {
    public void run(Object obj) {
      tween.start( shape1.x(), shape1.y() ).end( random(marginOffset), random(marginOffset) )
      .ease(tweenEase).spring(tweenSpeed)
      .register().callback(tr);
    }
  };

  tween.register().callback(tr);
}

void draw() {
  H.drawStage();
}

void keyPressed() {
  if (value == 0) {
    saveFrame("supercolony_14_365-###.png"); 
  }
}
