import shiffman.box2d.*;
import controlP5.*;
import java.util.*;

ControlP5 cp5;
RadioButton r;

ParticleSystem ps;
Obstacle ob;

float windControl = 0.0;
float XPosControl = 400.0;
float YPosControl = 200.0;
float XVelocityControl = 1.0;
float YVelocityControl = 1.0;
float rotationControl = 0.0;
float gravityControl = 0.0;
float alphaControl = 0.0;
float RControl = 210.0;
float GControl = 40.0;
float BControl = 179.0;
float sizeControl = 11.0;
float lifeControl = 255.0;
float massControl = 10.0;
boolean textureControl = false;
boolean shapeControl = true;
boolean emitControl = false;
boolean obsControl = false;

float leftMargin = 10;
float topMargin = 40;

float angle = 0;

void setup() {
  size(600, 400, P2D);
  background(255);
  blendMode(ADD);
  //  frameRate(20);
  cp5 = new ControlP5(this);

  cp5.addSlider("windControl")
    .setPosition(leftMargin, topMargin)
      .setRange(0, 8)
        .setLabelVisible(true)
          .setCaptionLabel("Wind");

  topMargin+=20;

  cp5.addSlider("XPosControl")
    .setPosition(leftMargin, topMargin)
      .setRange(0, width)
        .setLabelVisible(true)
          .setCaptionLabel("X-Pos");

  topMargin+=20;

  cp5.addSlider("YPosControl")
    .setPosition(leftMargin, topMargin)
      .setRange(0, height)
        .setLabelVisible(true)
          .setCaptionLabel("Y-Pos");

  topMargin+=20;

  cp5.addSlider("XVelocityControl")
    .setPosition(leftMargin, topMargin)
      .setRange(0, 3)
        .setLabelVisible(true)
          .setCaptionLabel("X-Velocity");

  topMargin+=20;

  cp5.addSlider("YVelocityControl")
    .setPosition(leftMargin, topMargin)
      .setRange(0, 3)
        .setLabelVisible(true)
          .setCaptionLabel("Y-Velocity");

  topMargin+=20;

  cp5.addSlider("rotationControl")
    .setPosition(leftMargin, topMargin)
      .setRange(0, 8)
        .setLabelVisible(true)
          .setCaptionLabel("Rotation");

  topMargin+=20;

  cp5.addSlider("gravityControl")
    .setPosition(leftMargin, topMargin)
      .setRange(-5, 5)
        .setLabelVisible(true)
          .setCaptionLabel("Gravity");

  topMargin+=20;

  cp5.addSlider("RControl")
    .setPosition(leftMargin, topMargin)
      .setRange(0, 255)
        .setLabelVisible(true)
          .setCaptionLabel("Color-R");

  topMargin+=20;

  cp5.addSlider("GControl")
    .setPosition(leftMargin, topMargin)
      .setRange(0, 255)
        .setLabelVisible(true)
          .setCaptionLabel("Color-G");

  topMargin+=20;

  cp5.addSlider("BControl")
    .setPosition(leftMargin, topMargin)
      .setRange(0, 255)
        .setLabelVisible(true)
          .setCaptionLabel("Color-B");

  topMargin+=20;

  cp5.addSlider("sizeControl")
    .setPosition(leftMargin, topMargin)
      .setRange(5, 50)
        .setLabelVisible(true)
          .setCaptionLabel("Size");

  topMargin+=20;

  cp5.addSlider("lifeControl")
    .setPosition(leftMargin, topMargin)
      .setRange(150, 400)
        .setLabelVisible(true)
          .setCaptionLabel("Life-Span");

  //  topMargin+=20;
  //
  //  cp5.addSlider("massControl")
  //    .setPosition(leftMargin, topMargin)
  //      .setRange(8, 20)
  //        .setLabelVisible(true)
  //          .setCaptionLabel("Mass");

  topMargin+=20;

  cp5.addToggle("textureControl")
    .setPosition(leftMargin, topMargin)
      .setSize(20, 20)
        .setCaptionLabel("Texture");

  cp5.addToggle("shapeControl")
    .setPosition(leftMargin + 50, topMargin)
      .setSize(20, 20)
        .setCaptionLabel("Shape");

  topMargin+=40;

  cp5.addToggle("emitControl")
    .setPosition(leftMargin, topMargin)
      .setSize(20, 20)
        .setCaptionLabel("Emitter");

  cp5.addToggle("obsControl")
    .setPosition(leftMargin + 50, topMargin)
      .setSize(20, 20)
        .setCaptionLabel("Obstacle");

  ps = new ParticleSystem();
  ob = new Obstacle(400, 300);
}

void draw() {
  background(0);

  fill(120, 90);
  noStroke();
  rect(0, 0, 170, height);

  PVector gravity = new PVector(0, gravityControl/50);
  ps.applyForce(gravity);

  if (obsControl) {
    ob.update();
    ps.applyObstruction(ob);
    ob.display();
  }
  ps.run();
}

