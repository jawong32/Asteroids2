class Bullet extends Floater {
  public Bullet(double x, double y, double vX, double vY, double dir) {
    myPointDirection = dir;
    corners = 4;
    xCorners = new int[] {5, 5, -5, -5};
    yCorners = new int[] {-2, 2, 2, -2};
    myColor = color(200, 20, 20);
    myCenterX = x + 10;
    myCenterY = y;
    myXspeed = vX;
    myYspeed = vY;
    accelerate(6);
  }
  
  public double getX() {
    return myCenterX;
  }

  public double getY() {
    return myCenterY;
  }
}
