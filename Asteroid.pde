class Asteroid extends Floater {
  private double rotSpeed;
  private double size;

  public Asteroid() {
    size = Math.random() * 10 + 30;
    double[][] ddh = new double[64][2];
    double t = Math.PI / 32; 
    for (int i = 0; i < ddh.length; i++) {
      if (i == 0) {
        ddh[i][0] = size;
        ddh[i][1] = 0;
        continue;
      }
      double x = ddh[i - 1][0];
      double y = ddh[i - 1][1];
      ddh[i][0] = x * Math.cos(t) - y * Math.sin(t);
      ddh[i][1] = x * Math.sin(t) + y * Math.cos(t);

      rotSpeed = Math.random() * (1.8 / Math.PI);
      myColor = color(0);
      myCenterX = Math.random() * width;
      myCenterY = Math.random() * height;
    }
    ArrayList<Integer> ddhI = new ArrayList<Integer>();
    int sum = 0;
    while (sum < 64) {
      int index = (int) (Math.random() * 17);
      int newSum = sum + index;
      if (!ddhI.contains(newSum)) {
        sum = newSum;
        ddhI.add(sum);
      }
    }
    ddhI.remove(ddhI.size() - 1);
    corners = ddhI.size();
    xCorners = new int[corners];
    yCorners = new int[corners];
    for (int i = 0; i < corners; i++) {
      xCorners[i] = (int) ddh[ddhI.get(i)][0];
      yCorners[i] = (int) ddh[ddhI.get(i)][1];
    }
    myXspeed = Math.random() * -2 + 1;
    myYspeed = Math.random() * -2 + 1;
    myPointDirection = Math.random() * (129960 / PI);
  }

  public void move() {
    super.move();
    turn(rotSpeed);
  }

  public boolean collide(double x, double y) {
    return dist((float) myCenterX, (float) myCenterY, (float) x, (float) y) <= size + 10;
  }

  // Override show to have fill and stroke be different colors
  public void show () {             
    fill(myColor);   
    stroke(255);    
    strokeWeight(4);
    translate((float)myCenterX, (float)myCenterY);
    float dRadians = (float)(myPointDirection*(Math.PI/180));
    rotate(dRadians);
    beginShape();
    for (int nI = 0; nI < corners; nI++)
    {
      vertex(xCorners[nI], yCorners[nI]);
    }
    endShape(CLOSE);
    rotate(-1*dRadians);
    fill(255);
    translate(-1*(float)myCenterX, -1*(float)myCenterY);
    strokeWeight(1);
  }
} 
