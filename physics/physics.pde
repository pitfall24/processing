class RigidBody {
  double xpos, ypos;
  double xvel, yvel;
  double xacc, yacc;
  
  double mass;
  double radius;
  double gravity;
  
  double bounciness;
  double friction;
  boolean onGround;
  
  public RigidBody(double xpos, double ypos, double mass, double radius, double gravity, double bounciness, double friction, boolean onGround) {
    this.xpos = xpos;
    this.ypos = ypos;
    
    this.xvel = 0;
    this.yvel = 0;
    this.xacc = 0;
    this.yacc = 0;
    
    this.mass = mass;
    this.radius = radius;
    this.gravity = gravity;
    
    this.bounciness = bounciness;
    this.friction = friction;
    this.onGround = onGround;
  }
  
  void updateState(double delta) {
    this.xpos += delta * this.xvel;
    this.ypos += delta * this.yvel;
    
    this.xvel += delta * this.xacc;
    this.yvel += delta * this.yacc;
    
    if (!this.onGround) {
      this.yacc += delta * this.gravity;
    }
  }
  
  void checkWalls(int x1, int y1, int x2, int y2) {
    if (this.xpos - this.radius < x1 || this.xpos + this.radius > x2) {
      this.xvel *= -this.bounciness;
    }
    
    if (this.ypos - this.radius < y1 || this.ypos + this.radius > y2) {
      this.yvel *= -this.bounciness;
    }
  }
  
  void setPos(double xpos, double ypos) {
    this.xpos = xpos;
    this.ypos = ypos;
  }
  
  void setVel(double xvel, double yvel) {
    this.xvel = xvel;
    this.yvel = yvel;
  }
  
  void setAcc(double xacc, double yacc) {
    this.xacc = xacc;
    this.yacc = yacc;
  }
}

RigidBody test1;
RigidBody test2;

int precision;

void setup() {
  size(800, 600);
  
  test1 = new RigidBody(width / 2, height / 2, 10, 50, 0, 1.1, 1, false);
  test1.setVel(3 * 60, 5 * 60);
  
  test2 = new RigidBody(width / 2, height / 2, 10, 50, 0, 1.1, 1, false);
  test2.setVel(3 * 60, 5 * 60);
  
  precision = 100;
}

void draw() {
  background(255);
  
  fill(255, 0, 0);
  ellipse(width - (float) test1.xpos, height - (float) test1.ypos, (float) test1.radius * 2, (float) test1.radius * 2);
  fill(0, 0, 255);
  ellipse(width - (float) test2.xpos, height - (float) test2.ypos, (float) test2.radius * 2, (float) test2.radius * 2);
  
  for (int i = 0; i < precision; i++) {
    test1.checkWalls(0, 0, width, height);
    test1.updateState(1.0 / (60.0 * precision));
  }
  
  test2.checkWalls(0, 0, width, height);
  test2.updateState(1.0 / (60.0));
}
