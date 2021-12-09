class Spaceship extends Floater {   
  public Spaceship() {
    corners = 4;

    xCorners = new int[] {10, 40, 10, 20};
    yCorners = new int[] {-10, 0, 10, 0};
    myColor = color(255, 255, 255);
    myCenterX = 400;
    myCenterY = 400;
    myXspeed = 0;
    myYspeed = 0;
    myPointDirection = 0;
  }
  
  public void shoot() {
  }
  
  public double getXSpeed() {
    return myXspeed;
  }
  
    public double getYSpeed() {
    return myYspeed;
  }

  public void setXSpeed(double x) {
    myXspeed = x;
  }

  public void setYSpeed(double y) {
    myYspeed = y;
  }
  
  public double getX() {
    return myCenterX;
  }
  
  public double getY() {
    return myCenterY;
  }

  public void setX(double x) {
    myCenterX = x;
  }

  public void setY(double y) {
    myCenterY = y;
  }
  
  public void setDirection(double angle) {
    myPointDirection = angle;
  }
}
