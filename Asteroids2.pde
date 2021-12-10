Spaceship ship = new Spaceship();
Star[] stars = new Star[65];
ArrayList<Asteroid> asteroids = new ArrayList<Asteroid>();
ArrayList<Bullet> bullets = new ArrayList<Bullet>();

public void setup() {
  size(800, 800);
  for (int i = 0; i < stars.length; i++) {
    stars[i] = new Star();
  }
  for (int i = 0; i < 25; i++) {
    asteroids.add(new Asteroid());
  }
}

public void draw() {
  background(0); 
  if (asteroids.size() < 20) {
    for (int i = 0; i < (int) (Math.random() * 3) + 1; i++) {
      asteroids.add(new Asteroid());
    }
  }

  for (Star star : stars) {
    star.move(); 
    star.show();
  }

  for (Bullet bullet : bullets) {
    bullet.move();
    bullet.show();
  }

  ship.move(); 
  ship.show(); 

  // Hurts performance but prevents asteroids
  // from flashing when collision occurs
  ArrayList<Asteroid> pseudoAItr = new ArrayList<Asteroid>(); 
  for (Asteroid asteroid : asteroids) {
    pseudoAItr.add(asteroid);
  }

  ArrayList<Bullet> pseudoBItr = new ArrayList<Bullet>();
  for (Bullet bullet : bullets) {
    pseudoBItr.add(bullet);
  }

  for (Asteroid asteroid : pseudoAItr) {
    asteroid.move(); 
    asteroid.show(); 
    if (asteroid.collide(ship.getX(), ship.getY())) {
      asteroids.remove(asteroid);
      continue;
    }
    for (Bullet bullet : pseudoBItr) {
      if (asteroid.collide(bullet.getX(), bullet.getY())) {
        asteroids.remove(asteroid);
        bullets.remove(bullet);
      }
    }
  }
}

public void keyPressed() {
  if (key == 'w' || key == 'W') {
    ship.accelerate(0.25);
    ship.accelerate(0.05);
  }

  if (key == 'a' || key == 'A') {
    ship.turn(-4);
  }

  if (key == 's' || key == 'S') {
    ship.accelerate(-0.25);
  }

  if (key == 'd' || key == 'D') {
    ship.turn(4);
  }

  if (key == 'h' || key == 'H') {
    ship.setXSpeed(0); 
    ship.setYSpeed(0); 
    ship.setX(Math.random() * 801); 
    ship.setY(Math.random() * 801); 
    ship.setDir(Math.random() * 361);
  }

  if (key == ' ') {
    if (bullets.size() < 12) {
      bullets.add(new Bullet(ship.getX(), ship.getY(), ship.getXVel(), ship.getYVel(), ship.getDir()));
    }
  }
}
