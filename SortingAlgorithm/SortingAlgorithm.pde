/*
Name: Aava Sapkota and Sarah Zhao
Teacher: Ms. Krasteva
Date: April 13, 2020
Assignment: Selection Sort

Selection Sort: 
Selection sort is a sorting algorithm that treats the array as two subarrays: unsorted and 
sorted (initially, the entire array is unsorted). Selection sort looks for the smallest value
in the array and brings it to the front. The minimum value is now a subarray of its own (sorted),
with selection sort looking at the rest of the values in the array (unsorted).

*/

//contains numbers
int [] numbers={(int)random(0, 10), (int)random(0, 10), (int)random(0, 10), (int)random(0, 10), (int)random(0, 10)}; 
//keep explainations
String [] explaination = {"Selection sort is a sorting algorithm that treats the array","as two subarrays: unsorted and sorted (initially, the entire","array is unsorted). Selection sort looks for the smallest","value in the array and brings it to the front. The smallest","value is now a subarray of its own (sorted), with selection","sort looking at the rest of the values in the array (unsorted).",  "Let’s say my array was comprised of {44, 12, 11, 30, 9}. The", "first thing selection sort would do is move ‘9’ to the front,","{9, 44, 12, 11, 30}. Now, ‘9’ is comprised of the 'sorted array'", "and ‘44, 12, 11, 30’ is part of the 'unsorted array'. Selection","will run through the unsorted array to determine the smallest",  "value and place it as the next sorted element. In ‘44, 12, 11,","30’, 11 is the smallest value, so 11 will become the next value", "{9, 11, 44, 12, 30}. This pattern will continue until the entire", "array is sorted."};      

int rowCount = 0;  //counts rows in animation
int sortedVals = 0;  //counts the number of sorted values in array
int min; //holds the smallest value
int index; //holds the index of the smallest value
boolean start = true; //determines if animation starts or stops
int cCounter = 0; //counts number of time 
int a = 420; //placement variable


PFont header; //title
PFont subheader; //subtitles
PFont standard; //standard text
PFont nums; //number font

//counters
int i=0;//row spacing counter
int x=0;//searching 
int step=0;

void setup()
{
  size (1500, 1000);
  background (212, 237, 255);
  title();//title
  info();//description
  structure();//background
  frameRate(5);
}
void draw() {
  if (start == true) {//make sure animation starts
    if (sortedVals < numbers.length) {//keep array index in bounds
      displayArray(0);
      if (step>10) searchArray();
      if (step%10==0) rowCount++;
      if (step%20==0) step=0;
      if (step%30==0) sortArray();
    } else {
      if (step<=numbers.length) displayArray(1);//display final array
    }
  }
}

void displayArray(int y) {
  textSize(40); 
  textFont(loadFont("Consolas-Bold-48.vlw")); 
  stroke(0);
  strokeWeight(1);
  for (int i=0; i<5; i++) {
    if (i<sortedVals) fill(106, 168, 79); //display green if value is sorted
    else fill(246, 178, 107); 
    rect(920+(i*100), 630-a+((rowCount-y)*75), 80, 45, 7);

    fill(0); 
    text(numbers[i]+"", 945+(i*100), 670-a+((rowCount-y)*75));
  }

  if (rowCount%2==1&&cCounter<50) { //display the number of times the array is checked/manipulated
    fill (255, 193, 77);
    ellipse (875, 650-a + ((rowCount)*75), 50, 50);
    fill(0);
    textSize(35);
    text(cCounter/10+1, 868, 662-a+((rowCount)*75));
    cCounter++;
  }
  step++;
}

void searchArray() {
  strokeWeight(7);
  fill(0, 0, 0, 0);
  stroke(106, 168, 79);
  if (x%2==0) {//select each box
    stroke(106, 168, 79);
    rect(920+((i%5)*100), 630-a+(rowCount*75), 80, 45, 7);
  } else {
    stroke(246, 178, 107);
    rect(920+((i%5)*100), 630-a+(rowCount*75), 80, 45, 7);
    i++;
  }
  x++;
}

void sortArray() {
  min = numbers[sortedVals];
  index = 0;
  for (int i=sortedVals; i<5; i++) { //find smallest value in subarray
    if (numbers[i]<=min) {
      min=numbers[i]; //store the smallest number
      index = i;//store it's index
    }
  }

  for (int i=sortedVals; i<numbers.length; i++) { //highlight smallest value and switching value 
    if (i==index||i==sortedVals) {
      stroke(106, 168, 79);
      rect(920+((i%5)*100), 630-a+((rowCount-1)*75), 80, 45, 7);
    }
  }
  
  //switch values
  int temp = numbers[sortedVals];  //hold value at front of unsorted subarray to be swapped
  numbers[sortedVals]=numbers[index]; //swap the smallest value to the front of the array into the sorted subArray(green) 
  numbers[index]=temp;

  sortedVals++;//add on to sorted values subarray
}

void title ()
{
  header = loadFont("Broadway-90.vlw");
  subheader = loadFont("BookAntiqua-30.vlw");
  standard = loadFont("BookAntiqua-26.vlw");
  textAlign(CENTER);
  textFont(header);
  fill (0);
  text("SELECTION SORT", 750, 130); //program title
  textFont(subheader);
  text("What is ' Selection Sort? '", 270, 235);//description title
}

void info ()
{
  textAlign (CORNER);
  textFont (standard);
  fill (0);
  for(int i=0; i<15; i++){
    text(explaination[i],90, 300+i*30); //display explaination
  }
}

void structure()
{
  //start button
  fill(106, 168, 79, 100);
  rect(150, 790, 160, 70, 7);
  fill(0);
  text("    Start\nAnimation", 170, 820);

  //stop button
  fill(190, 0, 0, 100);
  rect(350, 790, 160, 70, 7);
  fill(0);
  text("    Stop\nAnimation", 370, 820);

  //reset button
  fill(0, 0, 250, 100);
  rect(550, 790, 160, 70, 7);
  fill(0);
  text("    Reset\nAnimation", 570, 820);
  
  //description box
  fill (174, 133, 255, 50);
  rect (60, 170, 760, 600, 20);
}

void reset() {
  for (int i=0; i<5; i++) numbers[i]=(int)random(0, 10); //reset array values
  noStroke();
  fill(212, 237, 255);
  rect(830, 200, 600, 800); //reset background
  //reset all values
  rowCount=0; 
  sortedVals=0;  
  min=0; 
  index=0; 
  cCounter=0; 
  a=420;
  i=0;  
  x=0;
  step=0;
}


//buttons
void mousePressed() {
  if (mouseX>=150&&mouseX<=150+160&&mouseY>=790&&mouseY<=790+70)start = true; //start animation button
  if (mouseX>=350&&mouseX<=350+160&&mouseY>=790&&mouseY<=790+70) start = false;//stop animation button
  if (mouseX>=550&&mouseX<=550+160&&mouseY>=790&&mouseY<=790+70) reset();//reset buttons
}
