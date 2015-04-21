float y=748;
int x=0;
float deltaC=0.35;
float t=0;
float starX[]=new float [50];
float starY[]=new float [50];
float starSize[]=new float [50];
int sunCg=242;
int sunCb=0;
int sunSize=60;
float o=0;
int planeX;
int parachuteY=50;
float parachuteX=624;
int walkingX;
int planeXb=560;
int planeYb=528;
PImage imgPlane;
PImage imgParachute;
PImage imgWalking;
PImage imgPlaneB;

void setup() {
  background(153, 217, 234);
  size (1248, 748);
  
  for (int i=0; i<50; i=i+1) {//stars at random positions & sizes
    starX[i]=random(0, 1248);
    starY[i]=random(0, 582);
    starSize[i]=random(3, 6);
  }
  
  imgPlane=loadImage("Plane.png");//pictures
  imgParachute=loadImage("Parachute.png");
  imgWalking=loadImage("Walking2.png");
  imgPlaneB=loadImage("PlaneB.png");
}

void draw() {
  background(153, 217, 234);
  size (1248, 748);
  
  fill(16, 14, 67, t);//sky changing color
  stroke(16, 14, 67, t);
  rect(0, 0, 1248, 582);
  
  for (int i=0;i<50; i=i+1) { //stars
    if ((x==0)&&(sunSize==60))
      o=0;
    if ((x>=0)&&(sunSize==50))
      o=o+0.05;
    if ((x==0)&&(sunSize==60))
      o=0;
    if ((x>=1100)&&(sunSize==50))
      o=o-0.5;
      fill(255, o);
      noStroke();
      ellipse(starX[i], starY[i], starSize[i], starSize[i]);
  }
  
  strokeWeight(4);
  
  x=x+2;//sun & moon
  y=0.001*(x-624)*(x-624)+130;
  stroke(255, sunCg, sunCb);
  fill(255, sunCg, sunCb);
  ellipseMode(RADIUS);//sun & moon
  ellipse(x, y, sunSize, sunSize);
  if ((sunSize==60)&&(x==1248)) {//moon
    x=0;
    sunCg=255;
    sunCb=255;
    sunSize=50;
  }
  if ((sunSize==50) && (x==1248)) {//sun
    x=0;
    sunCg=242;
    sunCb=0;
    sunSize=60;
  }
  
  stroke(0);//red (chimney & roof)
  fill(237, 28, 36);
  rect(568, 179, 52, 116);//chimney
  triangle(824, 325, 535, 324, 680, 170);//roof
  
  image(imgPlaneB,planeXb,planeYb,200,100);//planeBackwards
    if((sunSize==60)&&(planeXb<=200)){
      planeXb-=8;
      planeYb-=1;
    }
    else if((sunSize==60)&&(planeXb<=560)&&(planeXb>200)){
      planeXb-=6;
      planeYb=528;
    }
    else if (sunSize==50){
      planeXb=560;
      planeYb=528;
    }
    
  stroke(0);//house
  fill(255, 127, 39);
  rect(535, 324, 289, 258);
      
  image(imgPlane,planeX,50,200,100);//plane
    if ((sunSize==60)&&(x>=150))
      planeX=planeX+2;
    else
      planeX=-300;
    if (planeX==1272)
      planeX=-1400;
      
  if (((planeX>=624)&&(sunSize==60))||(sunSize==50)){//parachuting person
    parachuteY=parachuteY+1;
    parachuteX=parachuteX+0.8;
    image(imgParachute,parachuteX,parachuteY,60,60);
  }
  if((parachuteY>=542)&&(sunSize==60)){
      parachuteY=50;
      parachuteX=624;
  }  
  
  if ((parachuteY>=542)&&(walkingX>=655)){//walking
    walkingX-=2;
    image(imgWalking,walkingX,518,70,70);
  }
  if (parachuteY==542)
    walkingX=1017;
  
  stroke(185, 122, 87);//trunk
  fill(185, 122, 87);
  rect(1031, 313, 112, 275);
  
  stroke(34, 177, 76);//tree
  fill(34, 177, 76);
  ellipseMode(CENTER);
  ellipse(1080, 263, 205, 156);
  ellipseMode(RADIUS);
  ellipse(1019, 228, 41, 41);
  ellipse(1063, 209, 29, 29);
  ellipse(1105, 198, 25, 25);
  ellipse(1147, 201, 29, 29);
  ellipse(1163, 228, 35, 35);
  ellipse(981, 260, 27, 27);
  ellipse(1161, 263, 41, 41);
  ellipse(991, 300, 30, 30);
  ellipse(1023, 300, 48, 48);
  ellipse(1084, 317, 42, 42);
  ellipse(1137, 298, 37, 37);
  
  stroke(0);//windows
  fill(153, 217, 234);
  rect(581, 358, 70, 69);
  rect(722, 360, 65, 66);
  
  fill(16, 14, 67,t);//windows changing color
  rect(581, 358, 70, 69);
  rect(722, 360, 65, 66);
  
  stroke(0);//door
  fill(255, 242, 0);
  rect(629, 476, 64, 106);
  
  stroke(181, 230, 29);//grass
  fill(181, 230, 29);
  rect(0, 582, 1248, 166);
  
  t=t+deltaC;//transparency of sky
  if ((sunSize==60)&&(x==0)) {
    t=0;
    deltaC=deltaC*-1;
  }
  if ((sunSize==50) && (x==0)) {
    t=300;
    deltaC=deltaC*-1;
    t=t+deltaC;
  }
}

