class Spaceship extends Floater {   
  private double velocityX;
  private double velocityY;

  public Spaceship() {
    corners = 4;
    xCorners = new int[] {10, 40, 10, 20};
    yCorners = new int[] {-10, 0, 10, 0};
    myColor = color(255, 255, 255);
    myCenterX = 400;
    myCenterY = 400;
    myXspeed = 0;
    myYspeed = 0;
    velocityX = 0;
    velocityY = 0;
    myPointDirection = 0;
  }

  private void calcVelocity() {
    velocityX = myXspeed * Math.cos(myPointDirection * (Math.PI / 180));
    velocityY = myYspeed * Math.sin(myPointDirection * (Math.PI / 180));
  }

  public void accelerate(double a) {
    myXspeed += a;
    myYspeed += a;
  }

  public void move() {
    calcVelocity();
    myCenterX += velocityX;
    myCenterY += velocityY;
    if (myCenterX > width) {     
      myCenterX = 0;
      return;
    } 
    if (myCenterX < 0) {     
      myCenterX = width;
      return;
    }    
    if (myCenterY > height) {    
      myCenterY = 0;
      return;
    } 
    if (myCenterY < 0) {     
      myCenterY = height;
      return;
    }
  }

  public double getXVel() {
    return velocityX;
  }

  public double getYVel() {
    return velocityY;
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

  public double getDir() {
    return myPointDirection;
  }

  public void setDir(double angle) {
    calcVelocity();
    myPointDirection = angle;
  }
}
