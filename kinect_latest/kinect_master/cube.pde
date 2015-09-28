class Cube {
  float x, y, z; // position of the cube
  float size; // size of cube
  color c; // color of cube
  float xAngle, yAngle, zAngle; // current rotation amount of cube's x, y, z axes
  float xSpeed, ySpeed, zSpeed; // how quickly the cube is rotated in the x, y, z axes 

  // Cube constructor - create the cube and all of its parameters
  Cube(float x_, float y_, float z_, float size_, color c_, float xSpeed_, float ySpeed_, float zSpeed_) {
    x = x_;
    y = y_;
    z = z_;
    size = size_;
    c = c_;
    xSpeed = xSpeed_;
    ySpeed = ySpeed_;
    zSpeed = zSpeed_;

    xAngle = yAngle = zAngle = 0; // starting position
  }

  // update the cube
  // all we're doing is rotating each axis
  void update() {
    xAngle += xSpeed;
    yAngle += ySpeed;
    zAngle += zSpeed;
  }

  // draw the cube to the screen
  void display() {
    pushMatrix(); // need this
    translate(x, y, z); // position on screen
    rotateX(xAngle); // rotation amounts
    rotateY(yAngle);
    rotateZ(zAngle);
    fill(c);
    noStroke(); 
    box(size);
    popMatrix(); // and this
    // push and pop matrix allows for individual cube rotation
    // otherwise you would rotate the whole draw window, which isn't what you're looking for
  }
  
  /*
  void cubeScale(float bScale){
    size=bScale;
    
  }
  */
}