class Bullet extends Floater {
  public Bullet(double x, double y, double dir) {
    myPointDirection = dir;
    corners = 4;
    xCorners = new int[] {-1, 1, 1, -1};
    yCorners = new int[] {3, 3, -3, -3};
    myColor = color(200, 20, 20);
    myCenterX = x;
    myCenterY = y;
  }
}
