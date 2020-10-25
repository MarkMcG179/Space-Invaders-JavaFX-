Game game;

void setup()
{
  size(650, 600);  
  game = new Game();
  game.help();

  ///ScreenData testing;
  ScreenData screenData = new ScreenData();
  println(screenData);
  screenData.setScore(100);
  screenData.incScore(10);
  println("score="+screenData.getScore());
  screenData.setLives(3);
  screenData.addLife();
  screenData.addLife();
  screenData.loseLife();
  println("lives="+screenData.getLives());
  println(screenData);


  //// SpaceObject testing
  //println();
  //println();
  //SpaceObject spaceObject = new SpaceObject();
  //println(spaceObject);
  //spaceObject.setX(100);
  //println("x="+spaceObject.getX());
  //spaceObject.setY(200);
  //println("y="+spaceObject.getY());
  //spaceObject.setSpeed(2.0);
  //println("speed="+spaceObject.getSpeed());
  //println(spaceObject);
  
}

void draw()
{  
  background(0, 0, 0);
  game.update();
} 

void keyPressed()
{  
  if (key=='a')
    game.action(Game.LEFT);

  if (key=='s')
    game.action(Game.RIGHT);

  if (key==' ')
    game.action(Game.FIRE);

  if (key=='q')
    exit();

  if (key=='h')
    game.help();
}
