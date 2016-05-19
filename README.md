# CTEC607 Interactive Kinect Installation

Requires Microsoft Kinect v1.

Interactive exhibit that pulls X,Y,Z coordinates from your hands and rotates a grid of cubes based on how much you move around. The project uses Z (depth) data from your left and right hands to rotate cubes on the X & Y axis respectively. Also scales sizes of cubes depending on amount of noise the kinect microphone detects.

When no people are detected in front of the camera, it generates random cubes that spin in a random rotation independent of each other. The cubes change size based on the amount of noise the Kinect picks up. Developed with the Processing framework, and the [Kinect4Win library](http://www.magicandlove.com/blog/research/kinect-for-processing-library/) which is a Java wrapper for the 1.6 Kinect SDK.

Written for the CTEC607 Creative Technologies Studio III Paper at Auckland University of Technology

##Setup Instructions
1.  Make sure you have [Processing](https://processing.org/) installed
2.  Ensure you have the [Kinect 1.6 SDK](http://www.microsoft.com/en-nz/download/details.aspx?id=34808) installed
3.  Ensure you have the [Kinect4Win Plugin](http://www.magicandlove.com/blog/research/kinect-for-processing-library/) for Processing installed
4.  Navigate to `bender/bender.pde'
5.  Do whatever you want with the code :)

## Licence

###THE BEER-WARE LICENSE (Revision 42):

[Walter Lim](mailto:waltissomewhere@gmail.com) put together this project.  As long as you retain this notice you can do whatever you want with this stuff. If we meet some day, and you think this stuff is worth it, you can buy me a beer in return.


Enjoy :)




