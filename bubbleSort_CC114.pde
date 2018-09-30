/*
Learning exercise based on Daniel Shiffman's excellent Coding Challenge series.
This is Coding Challenge #114
https://youtu.be/67k3I2GxTH8

@sspboyd
*/

float[] values; // array to hold the random values
boolean done; // boolean to determine if the sort is all done
boolean recording; // boolean to flag if we should be recording the output


void setup() {
  size(1024, 1024); // square output for mobile
  recording = false; // are we recording this?
  values = new float[width]; // make the array's length to the same width as the sketch
  for (int i=0; i<values.length; i++) {
    values[i] = random(height); // make some random value and store in array
  }
}

void draw() {
  background(199);
  stroke(11, 29, 76);
  
  done = true; 
  for (int i=0; i<values.length-1; i++) {
    if (values[i] < values[i+1]) {
      swap(i, i+1);
      done = false;    
    }
  }

  // Draw the lines
  for (int i=0; i<values.length; i++) {
    line(i, 0, i, values[i]);
  }

  if (recording) {
    saveFrame("output/bubbleSort-#####.png");
  }
  
  if (done) {
    // true? no swaps made so I guess we are done!
    noLoop();
    println("Done!!!");
  }
}

void swap(int a, int b) { // I know, Processing/Java provide built in methods to sort and manipulate. 
  float tmp = values[a];
  values[a] = values[b];
  values[b] = tmp;
}
