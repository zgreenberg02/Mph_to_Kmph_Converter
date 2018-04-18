int mph, kph;
int c1x = 240;
int c2x = 560;
int cy = 290;
int radius = 100;
void setup()
{
  size(800, 600);
  background(200);
  frameRate(100);
}

void draw()
{
  background(200);
  drawRef();

  if (mouseX >= 40 && mouseX <= 760)
  {
    mph = mouseX/4 - 10;
  } else if (mouseX < 40)
  {
    mph = 0;
  } else {
    mph = 180;
  }

  kph = int(mph*1.60934);
}

void drawRef()
{


  fill(0);
  noStroke();
  if (mouseX > 40 && mouseX <= 760)
  {
    rect(40, 510, mouseX-40, 20);
  } else if (mouseX <= 40)
  {
  } else 
  {
    rect(40, 510, 720, 20);
  }

  fill(0);
  stroke(0);
  strokeWeight(3);
  line(40, 520, 760, 520);

  textSize(15);
  text("MPH: "+ mph, 17, 500);
  textSize(15);
  text("MPH: "+ mph, 210, cy + 160);
  text("KPH: "+ kph, 530, cy + 160);
   text("MPH", 220, cy - 120);
  text("KPH", 540, cy - 120);
  for (int i = 0; i <760; i = i + 10) {
    fill(0);
    strokeWeight(3);
    stroke(0);
    textSize(10);
    if (i*2+40 <= 760) {

      line(i*2+40, 512, i*2+40, 528 ); // lines every 20 for the tens
    }
    if (i*4+40 <= 760) {

      line(i*4+40, 505, i*4+40, 535 );
      text(i, i*4+35, 547);
    }
  }

  strokeWeight(3);
  fill(255);
  ellipse(c1x, cy, radius*2, radius*2);
  ellipse(c2x, cy, radius*2, radius*2);

  fill(0);

  fill(0, 0, 0);
  noStroke();
  ellipse(c1x, cy, 10, 10);
  ellipse(c2x, cy, 10, 10);
  

  //for loop for the circle tick marks


  for (float i = 135; i <= 405; i = i + (270/17))
  {

    float angle1 = radians(i);             // leftt circle
    float c1x1 = c1x + cos(angle1) * radius;
    float c1y1 = cy + sin(angle1) * radius;
    float c1x2 = c1x + cos(angle1) * radius * 0.9;
    float c1y2 = cy + sin(angle1) * radius * 0.9;

    strokeWeight(3);
    stroke(0);

    line(c1x1, c1y1, c1x2, c1y2);
  }

  for (float i = 135; i <= 405; i = i + (270/16))
  {

    float angle2 = radians(i);                        // right circle

    float c2x1 = c2x + cos(angle2) * radius;
    float c2y1 = cy + sin(angle2) * radius;
    float c2x2 = c2x + cos(angle2) * radius * 0.9;
    float c2y2 = cy + sin(angle2) * radius * 0.9;

    strokeWeight(3);
    stroke(0);

    line(c2x1, c2y1, c2x2, c2y2);
  }

  for (float i = 135; i <= 405; i = i + 60)//2*(270/17))
  {

    float angle3 = radians(i);// l circle
    float c1x1 = c1x + cos(angle3) * radius;
    float c1y1 = cy + sin(angle3) * radius;
    float c1x2 = c1x + cos(angle3) * radius * 0.8;
    float c1y2 = cy + sin(angle3) * radius * 0.8;
    int text1 = int(i / 1.5 - 90);
    String t1 = ""+text1;
    float c1tx = c1x + cos(angle3) * radius * .67 - textWidth(t1) + 5;
    float c1ty = cy + sin(angle3) * radius * .67 + 5;
    strokeWeight(3);
    stroke(0);
    text(t1, c1tx,c1ty);
    line(c1x1, c1y1, c1x2, c1y2);
  }


  for (float i = 135; i <= 405; i = i + 2*(270/16))  
  {

    //r  circle
    float angle4 = radians(i);
    float c2x1 = c2x + cos(angle4) * radius;
    float c2y1 = cy + sin(angle4) * radius;
    float c2x2 = c2x + cos(angle4) * radius * 0.8;
    float c2y2 = cy + sin(angle4) * radius * 0.8;
    strokeWeight(3);
    stroke(0);
    line(c2x1, c2y1, c2x2, c2y2);
    
    
    
    int text2 = int(i * 32 / 27 - 160);  //need to change 
    String t2 = ""+text2;
    float c2tx = c2x + cos(angle4) * radius * .67 - textWidth(t2) + 5;
    float c2ty = cy + sin(angle4) * radius * .67 + 5;
   
    text(t2, c2tx,c2ty);
    
  
  }


  float radm = radians(1.5 * mph + 135);
  float radk = radians(135 * kph / 160 + 135);
  float l1x = c1x + cos(radm) * radius * .9;
  float l1y = cy + sin(radm) * radius * .9; 
  float l2x = c2x + cos(radk) * radius * .9;
  float l2y = cy + sin(radk) * radius * .9; 

  stroke(255, 0, 0);
  line(c1x, cy, l1x, l1y);
  line(c2x, cy, l2x, l2y);
  
  
    textSize(25);
  text("MPH to KPH Converter", 300, 50);
  textSize(15);
  text("To use move mouse arcoss page to change the Miles Per Hour and convert it into Kilometers Per Hour", 25, 80);
  textSize(13);
  text("By: Zach Greenberg || 2017", 320, 110);
}