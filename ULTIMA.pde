String[] imFiles = {"1.png",
                    "2.png",
                    "4.png",
                    "3.png"};
PImage[] im = new PImage[4];
 
int nX = 0;     
int nY = 0;     
float aY = 0;   
int aX = 15;     
float aV = 0;    
float aA = 0.05; 
int p = 0;       
boolean pCount = true; 
long t = 0;      
void setup() {
  size(400, 400);  
  nY = height - 100; 
  t = millis();  
  
  for(int i = 0; i < 4; i = i + 1) {
    im[i] = loadImage(imFiles[i]);
  }
}

void draw() {
  image(im[0], 0, 0, width, height);  
  
  // Apple's movement
  aV = aV + aA;  
  aY = aY + aV;  
  if (aY > height) {
    aY = 15;    
    aX = int(random(width - 20)); 
    aV = 0;   
    pCount = true;  
  }
  
  fill(random(255),random(255),random(255));  
  
  if (aY + 20 > nY && aY < nY + 100) {  
    if (aX + 20 > nX && aX < nX + 100) { 
      fill(255, 0, 0);  
      if (pCount) p = p + 1;
      pCount = false;  
                      
    } 
  }

  image(im[1], aX, aY,20,20);  
  if(pCount) {
    image(im[2], nX, nY,100,100);  
  } else {
    image(im[3], nX, nY,100,100); 
  } 
  
  float timer = (millis() - t) / 1000; 

  if (timer >= 40) { 
    noLoop();
  }

  fill(0);
  textSize(20);  
  text("Tiempo: " + (40 - timer), 10, 20);

  fill(0);  
  textSize(20);  
  text("Toques: " + p, 3 * width / 4, 20); 
}

void keyPressed() {
  if (keyCode == RIGHT) {
    nX = nX + 10;
  }
  if (keyCode == LEFT) {
    nX = nX - 10;
  }
  if (nX < 0) {
    nX = 0;
  }
  if (nX > width - 100) {  
    nX = width - 100;
  }
}
