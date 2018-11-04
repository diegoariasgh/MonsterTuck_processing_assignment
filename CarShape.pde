class CarShape {

  // We need to keep track of a Body and a width and height
  Body body;
  float w;
  float h;

  // Constructor
  CarShape(float x, float y, float w_, float h_, boolean lock) {
    w = w_;
    h = h_;
    
    // Define and create the body
    BodyDef bd = new BodyDef();
    bd.position.set(box2d.coordPixelsToWorld(new Vec2(x,y)));
    if (lock) bd.type = BodyType.STATIC;
    else bd.type = BodyType.DYNAMIC;

    body = box2d.createBody(bd);

    // Define the shape -- a  (this is what we use for a rectangle)
    PolygonShape sd = new PolygonShape();
    float box2dW = box2d.scalarPixelsToWorld(w/2);
    float box2dH = box2d.scalarPixelsToWorld(h/2);
    sd.setAsBox(box2dW, box2dH);

    // Define a fixture
    FixtureDef fd = new FixtureDef();
    fd.shape = sd;
    // Parameters that affect physics
    fd.density = .01;
    fd.friction = 0.1;
    fd.restitution = 0.5;

    body.createFixture(fd);

    body.setLinearVelocity(new Vec2(0,0));
    body.setAngularVelocity(0);
  }

  // This function removes the particle from the box2d world
  void killBody() {
    box2d.destroyBody(body);
  }
  
  Vec2 pos(){
    Vec2 pos = box2d.getBodyPixelCoord(body);
    
    return pos;
  }

  // Drawing the box
  void display() {
    // We look at each body and get its screen position
    Vec2 pos = box2d.getBodyPixelCoord(body);
    // Get its angle of rotation
    float a = body.getAngle();

    rectMode(PConstants.CENTER);
    pushMatrix();
    translate(pos.x,pos.y);
    rotate(-a);
    fill(0);
    stroke(0);
    strokeWeight(1);
    quad(0,0, -50/2, 0, -30/2 , -40/2, 35/2, 0);
    popMatrix();
  }
}