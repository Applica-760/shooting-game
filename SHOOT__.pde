float[] pack = {250,500,750};
float[] fack = {400,400,400};
int pp = 255;
int ppp =0;
int b1 = 30;
int b2 = 144;
int b3 = 255;
int U =750;
int Z =(int)random(255);

void setup() {
  size(1000, 800);
  textAlign(CENTER);
  textSize(90);
}

void draw() {
  background(0, 0, 80);
  enemy(pack[0],fack[0]);
  enemy(pack[1],fack[1]);
  enemy(pack[2],fack[2]);
  
  noFill();
  strokeJoin(ROUND);
  stroke(255,255,0);
  strokeWeight(25);
  beginShape();
  vertex(30,770);
  vertex(30,30);
  vertex(970,30);
  vertex(970,770);
  endShape();
  strokeWeight(5);
  
  star(random(1000), random(800));
  star(random(1000), random(800));
  star(random(1000), random(800));
  star(random(1000), random(800));
  star(random(1000), random(800));
  star(random(1000), random(800));

  stroke(0,0,255);
  strokeWeight(25);
  line(60,U,450,U);
  line(550,U,960,U);
  strokeWeight(5);
  
  fack[0] += 0.5;
  fack[1] += 0.5;
  fack[2] += 0.5;
  
  if ((mousePressed) && (dist(pack[0],fack[0],mouseX,mouseY)<50)) {//utareruto enemy koutai 0
    enemyx(pack[0],fack[0]);
    fack[0] -= 2.5;
    if (mouseX > pack[0]) {
      pack[0] -= 1.2;
    } else if (mouseX < pack[0]) {
      pack[0] += 1.2;
    }
  }
  
  if ((mousePressed) && (dist(pack[1],fack[1],mouseX,mouseY)<50)) {//utareruto enemy koutai 1
    enemyx(pack[1],fack[1]);
    fack[1] -= 2.5;
    if (mouseX > pack[1]) {
      pack[1] -= 1.2;
    } else if (mouseX < pack[1]) {
      pack[1] += 1.2;
    }
  }
  
  if ((mousePressed) && (dist(pack[2],fack[2],mouseX,mouseY)<50)) {//utareruto enemy koutai 2
    enemyx(pack[2],fack[2]);
    fack[2] -= 2.5;
    if (mouseX > pack[2]) {
      pack[2] -= 1.2;
    } else if (mouseX < pack[2]) {
      pack[2] += 1.2;
    }
  }
  
  
  if (mousePressed) {//beeeeeeeeeem
    strokeWeight(12);
    stroke(b1,b2,b3);
    for (int i = 100; i  > 10; i -= 2) {
      line(mouseX,mouseY,500,680);
    }
  }
  
  
  if ((pack[0] < 65) || (pack[0] > 945) || (fack[0] < 65)) {//enemy sibou hantei
    pack[0] = -1000;
    fack[0] = -1000;
  }
  if ((pack[1] < 65) || (pack[1] > 945) || (fack[1] < 65)) {//neemtsibouhantei
    pack[1] = -1000;
    fack[1] = -1000;
  }
  if ((pack[2] < 65) || (pack[2] > 945) || (fack[2] < 65)) {//enemysibouhantei
    pack[2] = -1000;
    fack[2] = -1000;
  }
  
  
  if ((fack[0] > U-60) || (fack[1] > U-60) || (fack[2] >U-60)) {//make hantei
    fill(255,0,0);
    text("GAME OVER...",500,400);
    pp =0;
    ppp =80;
    b1 =00;
    b2 =0;
    b3 =80;
  }
  
  if ((pack[0] < -900) && (pack[1] < -900) && (pack[2] < -900) && (fack[0] < -900) && (fack[1] < -900) && (fack[2] < -900)) {
    fill(Z,Z,Z);
    text("YOU WIN!!!",500,400);
  }
  juukou(500,800);
  pointer(mouseX, mouseY);
}




void pointer(int x, int y) {
  pushMatrix();
  translate(x, y);
  strokeWeight(10);
  stroke(pp, 0, ppp, 250);
  noFill();
  ellipse(0, 0, 120, 120);
  strokeWeight(5);
  ellipse(0, 0, 30, 30);
  strokeCap(ROUND);
  line(0, -90, 0, -40);
  line(0, 90, 0, 40);
  line(-90, 0, -40, 0);
  line(90, 0, 40, 0);
  popMatrix();
}

void star(float x, float y) {
  pushMatrix();
  translate(x, y);
  noStroke();
  fill(255, 255, 0);
  triangle(0, 0, 3, 3, -1, 2);
  popMatrix();
}

void enemy(float x,float y)  {
  pushMatrix();
  translate(x,y);
  noStroke();
  fill(128,128,128);
  ellipse(0,0,80,100);
  fill(10);
  arc(20,-10,20,20,radians(0),radians(135));
  arc(20,-10,20,20,radians(315),radians(360));
  arc(-20,-10,20,20,radians(45),radians(225));
  popMatrix();
}

void enemyx(float x,float y) {
  pushMatrix();
  translate(x,y);
  noStroke();
  fill(128,128,128);
  ellipse(0,0,80,100);
  fill(10);
  stroke(2);
  line(0,-20,20,0);
  line(0,0,20,-20);
  line(-20,-20,0,0);
  line(-20,0,0,-20);
  popMatrix();
}
  

void juukou(int x,int y) {
  pushMatrix();
  translate(x,y);
  noStroke();
  fill(0,110,0);
  rect(-10,-120,20,120);
  rect(-50,-30,100,30);
  popMatrix();
}
