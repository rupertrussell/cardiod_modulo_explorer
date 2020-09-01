// Cardiod Modulo Expolrer
// Author Rupert Russell
// 1 September 2020
// Drag mouse to chagne m & n values
// Use arrow keys to change m & n numbers
// press s to save file


// cardiod_modulo_n_455_500
// How to calculate points on a circle
// Based on code from http://www.mathopenref.com/coordcirclealgorithm...
/* 
 There are 2 * PI Radians in a circle
 If we have a circle of radius 20 with its center at the origin, the circle can be described by the pair of equations
 x = 20 cos(t) 
 y = 20 sin(t)
 also pased on https://www.youtube.com/watch?v=qhbuKbxJsk8&amp... 
 Times Tables, Mandelbrot and the Heart of Mathematics
 by Burkard Polster and Giuseppe Geracitano
 see: http://codepen.io/hippiefuturist/full/NAvqgk/
 
 Artwork on Redbubble at: https://www.redbubble.com/shop/ap/24619400
 Code on Github at: https://github.com/rupertrussell/cardiod_modulo_explorer
 
 cardio m = 613.0n = 696.0
 
 */


float scale = 1; 
float w = 600 * scale ; // width of image
float h = 600 * scale; // height of image
float n = 696.0; // Modulus/Points
float m = 613.0; // Multiplication Factor
void setup() {
  background(255); 
  // size(9411, 9411); // full scale for Redbubble
  size(600, 600); // full scale for Redbubble
  smooth();
  // noLoop();
}
void draw() {
  background(200);



  float radius = w / 2 - 100;
  cardioid(n, radius); // number of points on circle, radius of circle
  // draw the cardiod lines
  for (int i = 0; i < n; i = i+1) {
    connectPoints(n, radius, i, i * m);
  }
  // draw the outline circle
  noFill();
  strokeWeight(0.5 * scale);

  ellipse(width/2, height /2, radius * 2, radius * 2);
  // save("test cardio m = " + m + "n = " + n+ ".png");
  // exit();
}
void cardioid(float n, float r) {
  // draws n points on a circle
  double step = 2 * PI/n; 
  float offset = w / 2;
  // draw n points on circle
  for (float theta=0; theta < 2 * PI; theta += step) {
    float x = offset + r * cos(theta);
    float y = offset - r * sin(theta); 
    stroke(255, 0, 0);
    // point(x, y);
  }
}
void connectPoints(float n, float r, float firstPoint, float secondPoint) {
  // Connect two points on a circle
  float step = 2 * PI/n; 
  float offset = w / 2;
  // draw n points on circle
  float x1 = offset + r * cos(firstPoint * step);
  float y1 = offset - r * sin(firstPoint * step);
  float x2 = offset + r * cos(secondPoint * step);
  float y2 = offset -r * sin(secondPoint * step);
  stroke(0, 0, 0);
  line(x1, y1, x2, y2);
}

void keyPressed() {

  if (keyCode == DOWN) {
    m=m- 0.001;
  }

  if (keyCode == UP) {
    m=m+ 0.001;
  }

  if (keyCode == LEFT) {
    n = n - 1;
  }

  if (keyCode == RIGHT) {
    n = n + 1;
  }
  if ( n < 2) {
    n=2;
  }

  if (key == 's' || key == 'S') {
    save("cardio m = " + m + "n = " + n+ ".png");
  }
}


void mouseDragged() {
  m = mouseY;
  n = mouseX;
  if ( n < 2) {
    n=2;
  }
}


void mouseReleased() {
  save("cardio m = " + m + "n = " + n+ ".png");
}
