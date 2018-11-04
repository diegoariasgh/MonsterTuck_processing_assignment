class Wheel {

  // We need to keep track of a Body and a radius
  Body body;
  float r;
  //boolean noMove=false;

  Wheel(float x, float y, boolean noMove, float radius) {
    r = radius;

    // Define a body
    BodyDef bd = new BodyDef();
    // Set its position
    bd.position = box2d.coordPixelsToWorld(x, y);
    if (noMove)
      bd.type = BodyType.STATIC;
    else
      bd.type = BodyType.DYNAMIC;
    if (r<10)
      bd.fixedRotation = true; 
    body = box2d.world.createBody(bd);

    // Make the body's shape a circle 
    CircleShape cs = new CircleShape();
    cs.m_radius = box2d.scalarPixelsToWorld(r);

    FixtureDef fd = new FixtureDef();
    fd.shape = cs;
    // Parameters that affect physics
    fd.density = 1;
    fd.friction = 10;
    fd.restitution = .9;

    // Attach fixture to body
    body.createFixture(fd);
    body.setLinearVelocity(new Vec2(0, 0));
  }

  // This function removes the particle from the box2d world
  void killBody() {
    box2d.destroyBody(body);
  }

  // Is the particle ready for deletion?
  boolean done() {
    // Let's find the screen position of the particle
    Vec2 pos = box2d.getBodyPixelCoord(body);
    // Is it off the bottom of the screen?
    if (pos.y > height+r*2) {
      killBody();
      return true;
    }
    return false;
  }

  void display() {
    // We look at each body and get its screen position
    Vec2 pos = box2d.getBodyPixelCoord(body);
    // Get its angle of rotation
    float a = body.getAngle();
    pushMatrix();
    translate(pos.x, pos.y);
    rotate(a);
    fill(127);
    stroke(0);
    strokeWeight(2);
    ellipse(0, 0, r*4, r*4);
    // Let's add a line so we can see the rotation
    //line(0, 0, r, 0);
    popMatrix();
  }
} 