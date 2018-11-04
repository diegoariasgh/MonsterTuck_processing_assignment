class Car {
  // Our object is one box and two wheels
  CarShape box;
  Wheel wheel1;
  Wheel wheel2;

  Car(float x, float y) {
    // Initialize position of the box
    box = new CarShape(x, y, 100, 30, false);
    // Initialize position of two wheels
    wheel1 = new Wheel(x-28, y+16, false, 12);
    wheel2 = new Wheel(x+28, y+16,false, 12);

    // Define joints
    RevoluteJointDef rjd1 = new RevoluteJointDef();
    rjd1.initialize(box.body, wheel1.body, wheel1.body.getWorldCenter());
    rjd1.motorSpeed = -PI*3;
    rjd1.maxMotorTorque = 30000.0;
    rjd1.enableMotor = true;
    box2d.world.createJoint(rjd1);

    RevoluteJointDef rjd2 = new RevoluteJointDef();
    rjd2.initialize(box.body, wheel2.body, wheel2.body.getWorldCenter());
    rjd2.motorSpeed = -PI*3;
    rjd2.maxMotorTorque = 30000.0;
    rjd2.enableMotor = true;
    box2d.world.createJoint(rjd2);
  }

  void display() {
    box.display();
    wheel1.display();
    wheel2.display();
  }
}