int value = 0;

HShape  r1, r2, r3, r4;
HTween t1a, t1b, t1c;
HTween t2a, t2b, t2c;
HTween t3a, t3b, t3c;
HTween t4a, t4b, t4c;

void setup() {
  size(1280,1280);
  H.init(this).background(#ffffff).autoClear(false);
  smooth();

  // Shape 1

  r1 = new HShape("geometrics.svg");
  r1
    .enableStyle(false)
    .stroke(#ffffff, 100)
    .strokeWeight(2)
    .fill(#00cccc)
    .anchorAt(H.CENTER)
    .loc(640,640)
    .rotation(45)
  ;
  H.add(r1);

  t1a = new HTween()
    .target(r1).property(H.LOCATION)
    .start( r1.x(), r1.y() )
    .end( 100, 100)
    .ease(0.005)
    .spring(0.96)
  ;
  
  t1b = new HTween()
    .target(r1).property(H.ROTATION)
    .start(-45)
    .end(405)
    .ease(0.005)
    .spring(0.95)
  ;
  
  t1c = new HTween()
    .target(r1)
    .property(H.SCALE)
    .start(0)
    .end(1)
    .ease(0.005)
    .spring(0.95)
  ;
  
  //Shape 2
  r2 = new HShape("geometrics.svg");
  r2
    .enableStyle(false)
    .stroke(#ffffff, 100)
    .strokeWeight(2)
    .fill(#ff6699)
    .anchorAt(H.CENTER)
    .loc(640,640)
    .rotation(45)
  ;
  
  H.add(r2);

  t2a = new HTween()
    .target(r2).property(H.LOCATION)
    .start( r2.x(), r2.y() )
    .end( 1180,100)
    .ease(0.005)
    .spring(0.95)
  ;
  
  t2b = new HTween()
    .target(r2).property(H.ROTATION)
    .start(-45)
    .end(405)
    .ease(0.005)
    .spring(0.95)
  ;
  
  t2c = new HTween()
    .target(r2)
    .property(H.SCALE)
    .start(0)
    .end(1)
    .ease(0.005)
    .spring(0.95)
  ;
  
  //Shape 3
  r3 = new HShape("geometrics.svg");
  r3
    .enableStyle(false)
    .stroke(#ffffff, 100)
    .strokeWeight(2)
    .fill(#ff0055)
    .anchorAt(H.CENTER)
    .loc(640,640)
    .rotation(45)
  ;
  H.add(r3);

  t3a = new HTween()
    .target(r3).property(H.LOCATION)
    .start( r3.x(), r3.y() )
    .end( 1180,1180)
    .ease(0.005)
    .spring(0.95)
  ;
  
  t3b = new HTween()
    .target(r3).property(H.ROTATION)
    .start(-45)
    .end(725)
    .ease(0.005)
    .spring(0.95)
  ;
  
  t3c = new HTween()
    .target(r3)
    .property(H.SCALE)
    .start(0)
    .end(1)
    .ease(0.005)
    .spring(0.95)
  ;
  
  //Shape 4
  r4 = new HShape("geometrics.svg");
  r4
    .enableStyle(false)
    .stroke(#ffffff, 100)
    .strokeWeight(2)
    .fill(#009bd6)
    .anchorAt(H.CENTER)
    .loc(640,640)
    .rotation(45)
  ;
  H.add(r4);

  t4a = new HTween()
    .target(r4).property(H.LOCATION)
    .start( r4.x(), r4.y() )
    .end( 100,1180)
    .ease(0.005)
    .spring(0.95)
  ;
  
  t4b = new HTween()
    .target(r4).property(H.ROTATION)
    .start(-45)
    .end(725)
    .ease(0.005)
    .spring(0.95)
  ;
  
  t4c = new HTween()
    .target(r4)
    .property(H.SCALE)
    .start(0)
    .end(1)
    .ease(0.005)
    .spring(0.95)
  ;
  
  //Shape 5
  r4 = new HShape("geometrics.svg");
  r4
    .enableStyle(false)
    .stroke(#ffffff, 100)
    .strokeWeight(2)
    .fill(#009bd6)
    .anchorAt(H.CENTER)
    .loc(640,640)
    .rotation(45)
  ;
  H.add(r4);

  t4a = new HTween()
    .target(r4).property(H.LOCATION)
    .start( r4.x(), r4.y() )
    .end( 640,300)
    .ease(0.005)
    .spring(0.95)
  ;
  
  t4b = new HTween()
    .target(r4).property(H.ROTATION)
    .start(-45)
    .end(725)
    .ease(0.005)
    .spring(0.95)
  ;
  
  t4c = new HTween()
    .target(r4)
    .property(H.SCALE)
    .start(0)
    .end(0.5)
    .ease(0.005)
    .spring(0.95)
  ;
  
  //Shape 6
  r3 = new HShape("geometrics.svg");
  r3
    .enableStyle(false)
    .stroke(#ffffff, 100)
    .strokeWeight(2)
    .fill(#ff0055)
    .anchorAt(H.CENTER)
    .loc(640,640)
    .rotation(45)
  ;
  H.add(r3);

  t3a = new HTween()
    .target(r3).property(H.LOCATION)
    .start( r3.x(), r3.y() )
    .end( 300,640)
    .ease(0.005)
    .spring(0.95)
  ;
  
  t3b = new HTween()
    .target(r3).property(H.ROTATION)
    .start(-45)
    .end(725)
    .ease(0.005)
    .spring(0.95)
  ;
  
  t3c = new HTween()
    .target(r3)
    .property(H.SCALE)
    .start(0)
    .end(0.5)
    .ease(0.005)
    .spring(0.95)
  ;

  // Shape 7

  r1 = new HShape("geometrics.svg");
  r1
    .enableStyle(false)
    .stroke(#ffffff, 100)
    .strokeWeight(2)
    .fill(#00cccc)
    .anchorAt(H.CENTER)
    .loc(640,640)
    .rotation(45)
  ;
  H.add(r1);

  t1a = new HTween()
    .target(r1).property(H.LOCATION)
    .start( r1.x(), r1.y() )
    .end( 940, 640)
    .ease(0.005)
    .spring(0.96)
  ;
  
  t1b = new HTween()
    .target(r1).property(H.ROTATION)
    .start(-45)
    .end(405)
    .ease(0.005)
    .spring(0.95)
  ;
  
  t1c = new HTween()
    .target(r1)
    .property(H.SCALE)
    .start(0)
    .end(0.5)
    .ease(0.005)
    .spring(0.95)
  ;
  
  //Shape 9
  r2 = new HShape("geometrics.svg");
  r2
    .enableStyle(false)
    .stroke(#ffffff, 5)
    .strokeWeight(1)
    .noFill()
    .anchorAt(H.CENTER)
    .loc(640,640)
    .rotation(45)
  ;
  
  H.add(r2);

  t2a = new HTween()
    .target(r2).property(H.LOCATION)
    .start( r2.x(), r2.y() )
    .end( 640,640)
    .ease(0.005)
    .spring(0.95)
  ;
  
  t2b = new HTween()
    .target(r2).property(H.ROTATION)
    .start(-45)
    .end(405)
    .ease(0.005)
    .spring(0.95)
  ;
  
  t2c = new HTween()
    .target(r2)
    .property(H.SCALE)
    .start(0)
    .end(5)
    .ease(0.005)
    .spring(0.95)
  ;
  
    //Shape 2
  r2 = new HShape("geometrics.svg");
  r2
    .enableStyle(false)
    .stroke(#ffffff, 100)
    .strokeWeight(2)
    .fill(#ff6699)
    .anchorAt(H.CENTER)
    .loc(640,640)
    .rotation(45)
  ;
  
  H.add(r2);

  t2a = new HTween()
    .target(r2).property(H.LOCATION)
    .start( r2.x(), r2.y() )
    .end( 640,940)
    .ease(0.005)
    .spring(0.95)
  ;
  
  t2b = new HTween()
    .target(r2).property(H.ROTATION)
    .start(-45)
    .end(405)
    .ease(0.005)
    .spring(0.95)
  ;
  
  t2c = new HTween()
    .target(r2)
    .property(H.SCALE)
    .start(0)
    .end(0.5)
    .ease(0.005)
    .spring(0.95)
  ;


}

void draw() {
  H.drawStage();
}

void keyPressed() {
  if (value == 0) {
    saveFrame("supercolony_18_365-###.png"); 
  }
}
