class Tree{
  int x;
  int y;
  int speed;
  
  Tree(int x){
  this.x=x;
  y=0;
  speed=3;
  }

  
  void drawtree(){
    fill(118,92,72);
    rect( x, y+25,10, 50);
    fill(66,105,47);
    circle(x,y,70);
  }
  
  void movedown(){
  this.y+=this.speed;
  }
}


class Player {

   int x,y,speed;
  
  public Player() {
    setDefaultValues();
  }
  
  public void setDefaultValues() {
     this.x = 298;
     this.y = 670;
     this.speed = 5;
  }
  
 private void drawPlayer(){
   fill(0,0,0);
  rect(x, y, 10, 55, 28);
  fill(0,0,255);
  rect(x-1,y+5,12,40);
  fill(0,0,255);
  rect(x-20,y+10,50,10);
  fill(255,0,0);
  circle(x+5,y+30,20);
  fill(255,229,180);
  rect(x-10,y+10,5,20);
  rect(x+15,y+10,5,20);}
  
  public void update() {
    
  
    if(leftPressed==true & x>105) {
      x-=speed;
    }
    else if(rightPressed==true & x<350){
      x+=speed;
    }
    
    
    // Drawing player
    drawPlayer();
  
  }
 
  

}

class Coke{
  int x,y,speed;
   
   Coke() {
    setDefaultValues();
  }
   
    void setDefaultValues() {
     x = (int) random(150,320) ;
     y = 0;
     speed = (int) random(3,5);
   }
   
 void drawCoke(){
  fill(255,0,0);
  rect(x,y,30,50);
  fill(255,255,255);
  textSize(12);
text("Coke", x+2, y+30);
  }
  
    void update() {
    y+=speed;
  }
   
}


class Enemy {
  

  int x,y,speed,c1,c2,c3;
  
  
   Enemy() {
    setDefaultValues();
  }
  
  void setDefaultValues() {
     x = (int) random(150,320) ;
     y = 0;
     speed = (int) random(3,5);
     c1= int(random(255));
     c2= int(random(255));
     c3 = int(random(255));
  }
  
  

  void drawEnemy(){
  fill(c1,c2,c3);
  circle(x,y,30);
  circle(x,y+40,50);
  }
  
   void update() {
    y+=speed;
  }
  

}


ArrayList<Tree> righttree = new ArrayList<Tree>();
ArrayList<Tree> lefttree = new ArrayList<Tree>();
ArrayList<Enemy> e = new ArrayList<Enemy>();
ArrayList<Coke> c = new ArrayList<Coke>();
Player p;
int width= 500,height =750; 
boolean rightPressed,leftPressed,isgameover;



void setup(){
    size(500,750);  
  p = new Player();

  isgameover=false;
  rightPressed=false;
  leftPressed=false;

  righttree.add(new Tree(50));
  lefttree.add(new Tree(450));
  e.add(new Enemy());
  c.add(new Coke());

  
}

void draw(){
  
  if(!isgameover){

  background(150);
  
  //left grass
  fill(124,252,0);          
  rect(0,0,width/5,height);
  rect(400,0,width/5,height);
 
  
  
  //Update all Entity
   
  for(int i=0;i<righttree.size();i++){
    Tree rtree = righttree.get(i);
    rtree.drawtree();
    rtree.movedown();
    if(rtree.y==300){
    righttree.add(new Tree(50));
    }
    else if(rtree.y>750){
    righttree.remove(rtree);
    }
  }
  
  for(int i=0;i<lefttree.size();i++){
    Tree ltree = lefttree.get(i);
    ltree.movedown();
    if(ltree.y==300){
    lefttree.add(new Tree(450));
    }
    else if(ltree.y>750){
    lefttree.remove(ltree);
    }
  }
  
  for(int i=0;i<e.size();i++){
    Enemy ene = e.get(i);
    ene.update();
    if(dist(p.x,p.y,ene.x,ene.y+10)<=50){
    isgameover=true;
    }
    if(ene.y==300){
    e.add(new Enemy());
    }
    else if(ene.y>750){
    e.remove(ene);
    }
  }
  
    for(int i=0;i<c.size();i++){
    Coke ene = c.get(i);
    ene.update();
    if(dist(p.x,p.y,ene.x,ene.y)<=50){
    c.remove(ene);
    c.add(new Coke());
    }
    else if(ene.y>750){
    c.remove(ene);
    c.add(new Coke());
    }
  }
  
  p.update();
  
  // Draw all entity
  for(int i=0;i<e.size();i++){
    Enemy ene = e.get(i);
    ene.drawEnemy();
  }
  
  
  for(int i=0;i<c.size();i++){
    Coke ene = c.get(i);
    ene.drawCoke();
  } 
   for(int i=0;i<righttree.size();i++){
    Tree rtree = righttree.get(i);
    rtree.drawtree();
  }
    for(int i=0;i<lefttree.size();i++){
    Tree ltree = lefttree.get(i);
    ltree.drawtree();
    
  }
  
  }
  else{
  textSize(64);
text("Game Over", 100, 320);
fill(0,0,0);
  }
}

void keyPressed(){
  if(keyCode == RIGHT ){
    rightPressed=true;
  }
  else if(keyCode ==LEFT){
  leftPressed=true;
  }
  
}

void keyReleased(){
   if(keyCode == RIGHT ){
    rightPressed=false;
  }
  else if(keyCode ==LEFT){
  leftPressed=false;
  }
}
