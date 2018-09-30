float[] values;
boolean done;
boolean recording;


void setup() {
  size(1024, 1024);
  background(255);
 recording = true;
  values = new float[width];
  for (int i=0; i<values.length; i++) {
    values[i] = random(height);
  }

}

void draw() {
  background(0,18,47);
  stroke(0,199,76);
  done =true;
  for (int i=0; i<values.length-1; i++) {
    if (values[i] < values[i+1]) {
      swap(i, i+1);
      done = false;
    }
  }

// values = reverse(sort(values));
for (int i=0; i<values.length; i++) {
  line(i, 0, i, values[i]);
}

if(recording){
  //saveFrame("output/bubbleSort-#####.png");
}
  if (done) {
    // no swaps made so I guess we are done!
    noLoop();
    println("Done!!!");
  }
}



void swap(int a, int b) {
  float tmp = values[a];
  values[a] = values[b];
  values[b] = tmp;
}
