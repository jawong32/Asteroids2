class Asteroid extends Floater {
  private double rotSpeed;

  public Asteroid() {
    corners = (int) (Math.random() * 4) + 10;
    myColor = color(0);
    xCorners = new int[corners];
    yCorners = new int[corners];
    xCorners[0] = (int) (Math.random() * 100) + 60;
    yCorners[0] = (int) (Math.random() * 50) + 25;
    xCorners[corners / 2] = xCorners[0] + (int) (Math.random() * 25) + 50;
    yCorners[corners / 2] = yCorners[0];
    
    myCenterX = (xCorners[0] + xCorners[corners / 2]) / 2 + Math.random() * 801;
    myCenterY = yCorners[0] + Math.random() * 801;

    for (int i = 1; i < corners / 2; i++) {
      int nextX;
      int nextY = (int) (Math.random() * -20);
      do {
        nextX = (int) (Math.random() * 5) + 3;
      } while (xCorners[i - 1] + nextX > xCorners[corners / 2]);
      xCorners[i] = xCorners[i - 1] + nextX;
      yCorners[i] = yCorners[i - 1] + nextY;
    }

    for (int i = corners / 2 + 1; i < corners; i++) {
      int nextX;
      int nextY = (int) (Math.random() * 20);
      do {
        nextX = (int) (Math.random() * -5) - 3;
      } while (xCorners[i - 1] + nextX < xCorners[0]);
      xCorners[i] = xCorners[i - 1] + nextX;
      yCorners[i] = yCorners[i - 1] + nextY;
    }

    myXspeed = Math.random() * -2 + 1;
    myYspeed = Math.random() * -2 + 1;
    myPointDirection = 0;//Math.random() * 361 * (180 / PI);
    rotSpeed = Math.random() * 0.01 * (180 / PI);
  }

  // Had to override show to have fill be different from stroke
  public void show() {
    fill(myColor);   
    stroke(255);    
    strokeWeight(5);
    pushMatrix();
    translate((float) myCenterX, (float) myCenterY);
    float dRadians = (float)(myPointDirection*(Math.PI/180));
    rotate(dRadians);
    beginShape();
    for (int nI = 0; nI < corners; nI++) {
      vertex(xCorners[nI], yCorners[nI]);
    }
    endShape(CLOSE);
    popMatrix();
    //ellipse((float) myCenterX, (float) myCenterY, 30, 30);
    strokeWeight(1);
  }


  // Had to override to wrap correctly
  public void move() {
    myCenterX += myXspeed;    
    myCenterY += myYspeed;     

    if (myCenterX > width + 100) {     
      myCenterX = -100;
    } else if (myCenterX < -100) {     
      myCenterX = width;
    }    
    
    if (myCenterY > height + 100) {    
      myCenterY = -100;
    } else if (myCenterY < -100) {     
      myCenterY = height + 100;
    }
    
    turn(rotSpeed);
  }
}
