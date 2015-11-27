//You should implement your assign4 here.
//moveimage
PImage enemy,fighter,treasure;
//background
PImage bg1,bg2,hp,bg3,start1,start2,end1,end2;
int treasureX,treasureY,bg1x=0,hphave;
int fighterX,fighterY,i,enemysize=61,fightersize=51;
int mode,s,ego=0,enemylose,shoothave=0,shootnum=0,f=5,bownX,bownY;
int [] enemyX=new int[8];
int [] enemyY=new int[8];
int [] shootX=new int[5];
int [] shootY=new int[5];
boolean[] enemyhave=new boolean[8];
boolean[] shootleave=new boolean[5];
PImage[] flame=new PImage [5];
PImage shoot;
boolean go_left  = false;
boolean go_up    = false;
boolean go_down  = false;
boolean go_right = false;
boolean start    = true;
boolean end      = false;
boolean bown    = false;
boolean change ;
boolean shootgo;

void setup () {
  size(640, 480) ;
  fighterX=width-fightersize;
  fighterY=height/2;
  //loadimage
  bg1=loadImage("img/bg1.png");
  bg3=loadImage("img/bg1.png");
  bg2=loadImage("img/bg2.png");
  fighter=loadImage("img/fighter.png");
  treasure=loadImage("img/treasure.png"); 
  hp=loadImage("img/hp.png");
  enemy=loadImage("img/enemy.png");
  start1=loadImage("img/start1.png");
  start2=loadImage("img/start2.png");
  end1=loadImage("img/end1.png");
  end2=loadImage("img/end2.png");
  for(int a=0;a<5;a++)
  flame[a]=loadImage("img/flame" + (a+1) + ".png");
  shoot=loadImage("img/shoot.png");
shoothave=0;
  //random
  treasureY=floor(random(41,439));
  treasureX=floor(random(41,599));
   enemyY[4]=floor(random(0,419));
  mode=0;
  hphave=20;
  ego=0;

  for(int open=0;open<5;open++)
    enemyhave[open]=true;
}
void draw() {
   
  
  
  
   if(start){
  image(start2,0,0);
  if((mouseX>206&&mouseX<446)&&(mouseY>306&&mouseY<408))
  image(start1,0,0);
  }
  
  else if(end){
  image(end2,0,0);
  if((mouseX>206&&mouseX<446)&&(mouseY>306&&mouseY<408))
  image(end1,0,0);
 
  }
  
  //game
  else{
    
  bg1x+=2;
  bg1x=bg1x%1280;
  image(bg1,bg1x,0);
  image(bg2,bg1x-640,0);
  image(bg3,bg1x-1280,0);
  ego=ego+3;
  
   if(mode%3+1==1){
       for(int v=0;v<5;v++){
            if(enemyhave[v]==true){
       enemyX[v]=(v+1-5)*enemysize+ego;
       enemyY[v]=enemyY[4];
     image(enemy,enemyX[v],enemyY[v]);
    }
     }
     if(ego>=935){
  for(int open=0;open<5;open++)
    enemyhave[open]=true;
  enemyY[0]=floor(random(305,419));  
   mode++; 
   ego=0; 
  }
   for(int v=0;v<5;v++){
      if(enemyhave[v]==false)
    enemylose++;
    
   }
    if(enemylose==5){
     mode++;
     enemyY[0]=floor(random(305,419));
     ego=0;
     for(int open=0;open<5;open++)
    enemyhave[open]=true;
    }
    enemylose=0;
   }
   
    if(mode%3+1==2){
   for(int v=0;v<5;v++){
    if(enemyhave[v]==true){
     enemyX[v]=(v+1-5)*enemysize+ego;
     enemyY[v]=enemyY[0]-v*enemysize;
    image(enemy,enemyX[v],enemyY[v]);
    }
   }
   for(int v=0;v<5;v++){
      if(enemyhave[v]==false)
    enemylose++;
   }
    if(enemylose==5){
     mode++;
     enemyY[0]=floor(random(31,175));
     ego=0;
      for(int open=0;open<8;open++)
    enemyhave[open]=true;
    }
     if(ego>=935){
  for(int open=0;open<8;open++)
    enemyhave[open]=true;
  enemyY[0]=floor(random(31,175));  
   mode++; 
   ego=0;
  }
     enemylose=0;
   }
   
 if(mode%3+1==3){
 if(ego>=935){
  for(int open=0;open<5;open++)
    enemyhave[open]=true;
   enemyY[4]=floor(random(0,419)); 
   mode++; 
   ego=0; 
  }
   for(int v=0;v<8;v++){
      if(enemyhave[v]==false)
    enemylose++;
    
   }
    if(enemylose==8){
     mode++;
     enemyY[4]=floor(random(0,419)); 
     ego=0;
     for(int open=0;open<5;open++)
    enemyhave[open]=true;
    }
    enemylose=0;
   for(int k=0;k<5;k++){
    if(k==0)enemyX[0]=-183+ego;
    if(k==1){enemyX[1]=-1*61-183+ego;enemyY[1]=enemyY[0]+k*61;enemyX[2]=1*61-183+ego;enemyY[2]=enemyY[0]+k*61;}
    if(k==2){enemyX[3]=-2*61-183+ego;enemyY[3]=enemyY[0]+k*61;enemyX[4]=2*61-183+ego;enemyY[4]=enemyY[0]+k*61;}
    if(k==3){enemyX[5]=-1*61-183+ego;enemyY[5]=enemyY[0]+k*61;enemyX[6]=1*61-183+ego;enemyY[6]=enemyY[0]+k*61;}
    if(k==4)enemyX[7]=enemyX[0];enemyY[7]=enemyY[0]+k*61;
  }
    
  for(int u=0;u<8;u++){
    if(enemyhave[u]==true)//<>//
    image(enemy,enemyX[u],enemyY[u]);
  }
     enemylose=0;
 }
   
  
  

  image(fighter,fighterX,fighterY);
  fill(255,0,0);
  rect(10,0,hphave,31);
  image(hp,0,0);
  image(treasure,treasureX,treasureY);
  if((fighterX<=width-fightersize&&fighterX>=0))
  if((fighterY<=height-fightersize&&fighterY>=0)){
  if(go_up)
  if(fighterY>5)
  fighterY-=5;
  else
  fighterY=0;
  if(go_down)
  if(fighterY<height-fightersize-5)
  fighterY+=5;
  else
  fighterY=height-fightersize;
  
  if(go_left)
  if(fighterX>5)
  fighterX-=5;
  else
  fighterX=0;
 
  if(go_right)
  if(fighterX<width-fightersize-5)
  fighterX+=5;
  else
  fighterX=width-fightersize;
  }
 
   //shoot
     for(int e=0;e<5;e++){ 
    if(shootleave[e]){
    image(shoot,shootX[e],shootY[e]);
    if(shootX[e]>=-31)
    shootX[e]-=3;
    else{
    shootleave[e]=false;
    shoothave--;
    }
     }
     }
     for(int p=0;p<5;p++){
       for(int r=0;r<8;r++){
       if(shootleave[p]==true){
       if(enemyhave[r]==true){
       if(enemyX[r]+61>=shootX[p])
       if(enemyX[r]+61>=shootX[p]&&(((shootY[p]>enemyY[r])&&(shootY[p]<enemyY[r]+61))||((shootY[p]+27>enemyY[r]) && (shootY[p]+27<enemyY[r]+61)))){
    shoothave--;
    enemyhave[r]=false;
     f=0;
     bownX=enemyX[r];
     bownY=enemyY[r];
     shootleave[p]=false;
     
     }
   }
 }
     }
     }
  //catch enemy
   for(int p=0;p<8;p++){
     if(enemyhave[p]==true){
     if(((fighterY>=            enemyY[p])&&(fighterY            <=enemyY[p]+enemysize))||(
         (fighterY+fightersize>=enemyY[p])&&(fighterY+fightersize<=enemyY[p]+enemysize))){
     if((fighterX>=enemyX[p]&&fighterX<=enemyX[p]+enemysize)||
     (fighterX+fightersize>=enemyX[p]&&fighterX+fightersize<=enemyX[p]+enemysize)){
      hphave-=40;
     enemyhave[p]=false;
    f=0;
     bownX=enemyX[p];
     bownY=enemyY[p];
     }
     }
   }
  }
  
  
     
   if(frameCount%(60/10)==0){ 
     if(f<5){   
     f++;
     
  }
   }
    if(f<5)//<>//
 image(flame[f],bownX,bownY);
 
  //catch treasure
  if(((treasureX>=fighterX&&treasureX<=fighterX+fightersize)||(treasureX+41>=fighterX&&treasureX+41<=fighterX+fightersize))
  && ((treasureY>=fighterY&&treasureY<=fighterY+fightersize)||(treasureY+41>=fighterY&&treasureY+41<=fighterY+fightersize))){
  if(hphave<200)
    hphave+=20;
    treasureY=floor(random(41,439));
  treasureX=floor(random(41,599));
  }
  if(hphave<=0){
   end=true;
   mode=0;
   ego=0;
  }
   }
}

void mousePressed(){
  if(start){
    if((mouseX>206&&mouseX<446)&&(mouseY>306&&mouseY<408))
   start = false;
  }
   if(end){
    if((mouseX>206&&mouseX<446)&&(mouseY>306&&mouseY<408))
   end = false;
   hphave=40;
   fighterX=width-fightersize;
   fighterY=height/2;
   treasureY=floor(random(41,439));
  treasureX=floor(random(41,599));
  enemyY[0]=floor(random(0,419));
   for(int open=0;open<5;open++){
    shootleave[open]=false;
     enemyhave[open]=true;
   }
    shoothave=0;
    f=5;
  }
}

void keyPressed(){
  
  switch(keyCode){
    case UP:
    go_up = true;
    break;
    case DOWN:
    go_down = true;
    break;
    case LEFT:
    go_left = true;
    break;
    case RIGHT:
    go_right = true;
    break; 
   case 32:
if(shoothave<5){
      shootnum++;
      shoothave++;
      
      shootleave[shootnum%5]=true;
      shootX[shootnum%5]=fighterX-31;
      shootY[shootnum%5]=fighterY+fightersize/4;
    }
    break;
  }
}

void keyReleased(){
    switch (keyCode) {
      case UP:
        go_up = false;
        break;
      case DOWN:
        go_down = false;
        break;
      case LEFT:
        go_left = false;
        break;
      case RIGHT:
        go_right = false;
        break;
        
    }
  }
