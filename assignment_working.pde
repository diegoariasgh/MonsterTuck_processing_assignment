// The Nature of Code
// Daniel Shiffman
// http://natureofcode.com

// Example demonstrating distance joints 
// A bridge is formed by connected a series of particles with joints

import shiffman.box2d.*;
import org.jbox2d.common.*;
import org.jbox2d.dynamics.joints.*;
import org.jbox2d.collision.shapes.*;
import org.jbox2d.collision.shapes.Shape;
import org.jbox2d.common.*;
import org.jbox2d.dynamics.*;
import org.jbox2d.dynamics.contacts.*;

// A reference to our box2d world
Box2DProcessing box2d;
Car car;
CarShape carShape;
// An object to describe a Bridget (a list of particles with joint connections)
Bridge bridge;
Surface surface;

void setup() {
  size(1200, 500);
  // Initialize box2d physics and create the world
  box2d = new Box2DProcessing(this);
  box2d.createWorld();
// Create the surface
  surface = new Surface();

  // Make the bridge
  bridge = new Bridge(2*width/3, 89, surface.end1x,surface.end1y, surface.start2x, surface.start2y );

  car = new Car(100, 120);

}

void draw() {
  background(255);

  // We must always step through time!
  box2d.step();
  surface.display();
  car.display();


  // Draw the windmill
  bridge.display();


  fill(0);
  //text("Click mouse to add boxes.", 10, height-10);
}