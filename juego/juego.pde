float posX;

float posXB[];
float posYB[];

int estado[];

int puntaje;

float x = 290;
float y = 350;

int ancho = 70;
int alto = 20;

int dir = 1; 
int dir2 = -1;
int dir3 = 1;

int vel = 2;
int vel2 = 5;
int vel3 = 3;

int scene = 0;

float dist = 0;

PImage diamante;
PImage fondo;
PImage personaje;
PImage flecha;
PImage base;
PImage titulo;
PImage win;
PImage lose;
PImage play;

void setup()
  {
  size(600,600);
  
  fondo = loadImage("fondo.jpg");
  diamante = loadImage("diamante.png");
  personaje = loadImage("ojo.png");
  flecha = loadImage("flecha.png");
  base = loadImage("piedra.png");
  titulo = loadImage("titulo.png");
  win = loadImage("win.png");
  lose = loadImage("lose.png");
  play = loadImage("play.png");
  
  
  posXB= new float[100];
  posYB= new float[100];
  estado= new int[100];
  
  for (int i=0; i<100; i++) {
    posXB[i]=random(10, 580);
    posYB[i]=random(70, 530);
    estado[i]=1;
  }
  
  /*for (int i = 10; i < 590; i = i+50) {
  for (int j = 70; j < 530; j = j+50) {
    
    posXB[i]=i;
    posYB[i]=i;
    estado[i]=1;
    
  }
}*/
  
  }
  
void draw()
{
  
  
  background (255);
  image(fondo,0,0);
  
  if (mousePressed==true) {
    if (scene==0){
      scene=1;
    }
    else if (scene==2){
      scene=0;
    }
    else if (scene==3){
      scene=0;
    }
  }
  switch(scene)
  {
    
  /*--------------- Escena 1 ---------------*/ 
  case 0:  
  image(fondo,0,0,600,600);
  image(titulo,100,100,250,80);
  image(play,350,450,120,120);
  break;
  
  
  /*--------------- Escena 1 ---------------*/
  
  
  /*--------------- Escena 2 ---------------*/
  
  case 1:
  /*------- Personaje --------*/
  
  
  
  image (personaje,x,y,20,20);
  //rect(x,y,20,20);
  x = x + vel * dir;
  if (x > 580 || x < 0){
    dir = dir * -1;
  }
  
  y = y + vel2 * dir2;
   if (y < 0){
    dir2 = dir2 * -1;
  }
  
  if (y > 600)
  {
    x= 300;
    y= 200;
    //scene=2;
  }
  if (puntaje >= 100){
    scene=3;
  }
  
  /*---------- Diamantes ------------*/
  for (int i=0; i<100; i++)
  {
    /*if (mousePressed==true)
    {
      dist=dist(x, y, posXB[i], posYB[i]);
      if(dist<=20)
      {
        estado[i]=0;
      }
    }*/
    if (estado[i]==1) {
      image(diamante,posXB[i], posYB[i], 20,20);
    }
  }
  for (int i=0; i<100; i++)
  {
    dist=dist(x, y, posXB[i], posYB[i]);
      if(dist<=20)
      {
        estado[i]=0;
      }
  }
  fill(#FFFFFF);
  text("Puntaje: "+ puntaje, 30,40);
  puntaje=0; 
  for(int i=0; i<100; i++)
  {
    if(estado[i]==0)
    {
    puntaje++;
    }
  }
  
  /*for (int i = 10; i < 590; i = i+50) {
  for (int j = 70; j < 530; j = j+50) {
   
   
    image(diamante,i, j, 20,20);
  
    
     
   if (mousePressed)
      {
        dist = dist(mouseX, mouseY, i, j);
        if (dist <=30)
        {
          println("xx");
        }
      
     }
  
  
  
  }
  
  
}*/
  /*------- Barra --------*/
  
  fill(55,55,55);
  image(base,posX,550,ancho,alto);
  //rect(posX,550,ancho,alto);
  
  //posX = mouseX;
  posX = posX + vel3 *dir3;
  
  image(flecha,282.5,580,35,13);
  //rect(290,580,20,20);
  
  posX = posX + vel3 * dir3;
  if (posX > 530 || posX < 0){
    dir3 = dir3 * -1;
  }
  
 
  
  if (y > 530 && y < 600){
    if (x >= posX && x <= posX+ancho)
      {
        dir2 = dir2 * -1;
      }
  }
  
  
  break; 
 /*--------------- Escena 2 ---------------*/

 /*--------------- Escena 3 ---------------*/
 
 case 2:
 image(titulo,100,100,250,80);
 image(lose,350,450,185,55);
 break;
 /*--------------- Escena 3 ---------------*/  
 case 3:
 image(titulo,100,100,250,80);
 image(win,350,450,185,55);
}
 

 
 
}
 
void mouseClicked (){
  if(mouseX >= 290 && mouseX<= 310 && mouseY >= 580 && mouseY<=600)
    {
      dir3 = dir3 * -1;   
    }   
    else  {
      dir3 = dir3 * 1;      
    }
  
  }
