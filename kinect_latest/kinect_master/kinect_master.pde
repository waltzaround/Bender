import kinect4WinSDK.Kinect; //import the Kinect4Win SDK kinect
import kinect4WinSDK.SkeletonData; //import the Kinect4Win SDK skeletondata

Kinect kinect; // computer, Kinect = kinect
HashMap <Integer, SkeletonData> bodies; // initialize hashmap that pairs an interger with SkeletonData

int activeUserID;// initialize interger activeUserID



final boolean DRAW_SKELETON = false; // turn this on if you want to see the skeleton

float leftFootX, leftFootY, rightFootX, rightFootY, HeadX, HeadY;
//boolean sketchFullScreen() {// switch for making it full screen
//return true;//yes make it fullscreen
//}

void setup() // void setup
{
  size(displayWidth, displayHeight, P3D);// set it to maximum resolution width/heightwise
  noStroke();// no strokes on shapes
  kinect = new Kinect(this); // tell koomputer that there is a new kinect
  smooth(); // activate anti aliasing
  bodies = new HashMap<Integer, SkeletonData>(); // set a new hashaap to count how many bodies there are (important to tell program which body & hands to track)
  activeUserID = -1; // set active user #
}// end void setup

void draw() // begin void draw
{
  defineLights(); // set lights OMG
  background(0);// no background

  SkeletonData _s = bodies.get(activeUserID); // we'll define _s later, 
  // if -check for NOT_TRACKED
  if ( _s != null )
  {
    if (_s.skeletonPositionTrackingState[Kinect.NUI_SKELETON_POSITION_HAND_LEFT] != Kinect.NUI_SKELETON_POSITION_NOT_TRACKED) {
      // println(_s.skeletonPositions[Kinect.NUI_SKELETON_POSITION_HAND_LEFT].z);
    }
    if (_s.skeletonPositionTrackingState[Kinect.NUI_SKELETON_POSITION_HAND_RIGHT] != Kinect.NUI_SKELETON_POSITION_NOT_TRACKED) {
      //  println(_s.skeletonPositions[Kinect.NUI_SKELETON_POSITION_HAND_RIGHT].z);
    }
    for (int x = 0; x <= width; x += 60) {
      for (int y = 0; y <= height; y += 60) {
        pushMatrix();
        translate(x, y, -100);
        rotateY(map((_s.skeletonPositions[Kinect.NUI_SKELETON_POSITION_HAND_LEFT].z/3), 0, width, 0, PI));
        rotateX(map((_s.skeletonPositions[Kinect.NUI_SKELETON_POSITION_HAND_RIGHT].z/3), 0, height, 0, PI));
        leftFootX = _s.skeletonPositions[Kinect.NUI_SKELETON_POSITION_FOOT_LEFT].x;
        leftFootY = _s.skeletonPositions[Kinect.NUI_SKELETON_POSITION_FOOT_LEFT].y;
        rightFootX = _s.skeletonPositions[Kinect.NUI_SKELETON_POSITION_FOOT_RIGHT].x;
        rightFootY = _s.skeletonPositions[Kinect.NUI_SKELETON_POSITION_FOOT_RIGHT].y;
        headX = _s.skeletonPositions[Kinect.NUI_SKELETON_POSITION_HEAD].x;
        headY = _s.skeletonPositions[Kinect.NUI_SKELETON_POSITION_HEAD].y;
        box(30);
        popMatrix();
      }
    }
  }


  //image(kinect.GetImage(), 320, 0, 320, 240);
  //image(kinect.GetDepth(), 0, 0, 1920, 1080);
  // image(kinect.GetMask(), 0, 240, 320, 240);
  if ( DRAW_SKELETON )
  {
    for (SkeletonData sd : bodies.values () ) 
    {
      drawSkeleton(sd);
      drawPosition(sd);
    }
  }
}

void defineLights() {
  // Orange point light on the right

  pointLight((leftFootX/80), (leftFootY/80), 0, // Color
  200, -150, 0); // Position

  pointLight(50, 100, 30, // Color
  1800, 1000, 0); // Position

  // Blue directional light from the left
  directionalLight(0, 102, 255, // Color
  1, 0, 0);    // The x-, y-, z-axis direction

  // Yellow spotlight from the front
  spotLight(255, 255, 109, // Color
  0, 40, 200, // Position
  0, -0.5, -0.5, // Direction
  PI / 2, 2);     // Angle, concentration


  // Yellow spotlight from the front
  spotLight(255, 255, 109, // Color
  0, 90, 600, // Position
  0, 0.5, 0.5, // Direction
  PI / 2, 2);     // Angle, concentration
}




void drawPosition(SkeletonData _s) 
{
  noStroke();
  fill(0, 100, 255);
  String s1 = str(_s.dwTrackingID);
  text(s1, _s.position.x*width/2, _s.position.y*height/2);
}

void drawSkeleton(SkeletonData _s) 
{
  // Body
  DrawBone(_s, 
  Kinect.NUI_SKELETON_POSITION_HEAD, 
  Kinect.NUI_SKELETON_POSITION_SHOULDER_CENTER);
  DrawBone(_s, 
  Kinect.NUI_SKELETON_POSITION_SHOULDER_CENTER, 
  Kinect.NUI_SKELETON_POSITION_SHOULDER_LEFT);
  DrawBone(_s, 
  Kinect.NUI_SKELETON_POSITION_SHOULDER_CENTER, 
  Kinect.NUI_SKELETON_POSITION_SHOULDER_RIGHT);
  DrawBone(_s, 
  Kinect.NUI_SKELETON_POSITION_SHOULDER_CENTER, 
  Kinect.NUI_SKELETON_POSITION_SPINE);
  DrawBone(_s, 
  Kinect.NUI_SKELETON_POSITION_SHOULDER_LEFT, 
  Kinect.NUI_SKELETON_POSITION_SPINE);
  DrawBone(_s, 
  Kinect.NUI_SKELETON_POSITION_SHOULDER_RIGHT, 
  Kinect.NUI_SKELETON_POSITION_SPINE);
  DrawBone(_s, 
  Kinect.NUI_SKELETON_POSITION_SPINE, 
  Kinect.NUI_SKELETON_POSITION_HIP_CENTER);
  DrawBone(_s, 
  Kinect.NUI_SKELETON_POSITION_HIP_CENTER, 
  Kinect.NUI_SKELETON_POSITION_HIP_LEFT);
  DrawBone(_s, 
  Kinect.NUI_SKELETON_POSITION_HIP_CENTER, 
  Kinect.NUI_SKELETON_POSITION_HIP_RIGHT);
  DrawBone(_s, 
  Kinect.NUI_SKELETON_POSITION_HIP_LEFT, 
  Kinect.NUI_SKELETON_POSITION_HIP_RIGHT);

  // Left Arm
  DrawBone(_s, 
  Kinect.NUI_SKELETON_POSITION_SHOULDER_LEFT, 
  Kinect.NUI_SKELETON_POSITION_ELBOW_LEFT);
  DrawBone(_s, 
  Kinect.NUI_SKELETON_POSITION_ELBOW_LEFT, 
  Kinect.NUI_SKELETON_POSITION_WRIST_LEFT);
  DrawBone(_s, 
  Kinect.NUI_SKELETON_POSITION_WRIST_LEFT, 
  Kinect.NUI_SKELETON_POSITION_HAND_LEFT);

  // Right Arm
  DrawBone(_s, 
  Kinect.NUI_SKELETON_POSITION_SHOULDER_RIGHT, 
  Kinect.NUI_SKELETON_POSITION_ELBOW_RIGHT);
  DrawBone(_s, 
  Kinect.NUI_SKELETON_POSITION_ELBOW_RIGHT, 
  Kinect.NUI_SKELETON_POSITION_WRIST_RIGHT);
  DrawBone(_s, 
  Kinect.NUI_SKELETON_POSITION_WRIST_RIGHT, 
  Kinect.NUI_SKELETON_POSITION_HAND_RIGHT);

  // Left Leg
  DrawBone(_s, 
  Kinect.NUI_SKELETON_POSITION_HIP_LEFT, 
  Kinect.NUI_SKELETON_POSITION_KNEE_LEFT);
  DrawBone(_s, 
  Kinect.NUI_SKELETON_POSITION_KNEE_LEFT, 
  Kinect.NUI_SKELETON_POSITION_ANKLE_LEFT);
  DrawBone(_s, 
  Kinect.NUI_SKELETON_POSITION_ANKLE_LEFT, 
  Kinect.NUI_SKELETON_POSITION_FOOT_LEFT);

  // Right Leg
  DrawBone(_s, 
  Kinect.NUI_SKELETON_POSITION_HIP_RIGHT, 
  Kinect.NUI_SKELETON_POSITION_KNEE_RIGHT);
  DrawBone(_s, 
  Kinect.NUI_SKELETON_POSITION_KNEE_RIGHT, 
  Kinect.NUI_SKELETON_POSITION_ANKLE_RIGHT);
  DrawBone(_s, 
  Kinect.NUI_SKELETON_POSITION_ANKLE_RIGHT, 
  Kinect.NUI_SKELETON_POSITION_FOOT_RIGHT);
}

void DrawBone(SkeletonData _s, int _j1, int _j2) 
{
  noFill();
  stroke(255, 255, 0);
  if (_s.skeletonPositionTrackingState[_j1] != Kinect.NUI_SKELETON_POSITION_NOT_TRACKED &&
    _s.skeletonPositionTrackingState[_j2] != Kinect.NUI_SKELETON_POSITION_NOT_TRACKED) {
    line(_s.skeletonPositions[_j1].x*width/2, 
    _s.skeletonPositions[_j1].y*height/2, 
    _s.skeletonPositions[_j2].x*width/2, 
    _s.skeletonPositions[_j2].y*height/2);
  }
}

void appearEvent(SkeletonData _s) 
{
  if (_s.trackingState == Kinect.NUI_SKELETON_NOT_TRACKED) 
  {
    return;
  }
  println("appearing: " + _s.dwTrackingID);
  synchronized(bodies) {
    bodies.put((Integer) _s.dwTrackingID, _s);
  }
  if ( activeUserID < 0 )
  {
    // First/only user entered 
    activeUserID = _s.dwTrackingID;
  }
}

void disappearEvent(SkeletonData _s) 
{
  synchronized(bodies) {
    println("disappearing: " + _s.dwTrackingID);
    bodies.remove(_s.dwTrackingID);
  }
  if ( activeUserID == _s.dwTrackingID )
  {
    // bugger, acitve user gone...
    if ( bodies.isEmpty() )
    {
      // ... and no replacement
      activeUserID = -1;
    } else
    {
      // give me the remaining ID's, and pick the fcirst one as new active user
      activeUserID = bodies.keySet().iterator().next();
    }
  }
}

void moveEvent(SkeletonData _b, SkeletonData _a) 
{
  if (_a.trackingState == Kinect.NUI_SKELETON_NOT_TRACKED) 
  {
    return;
  }
  synchronized(bodies) {
    bodies.get(_a.dwTrackingID).copy(_a);
  }
}

