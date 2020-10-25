public class Alien extends SpaceObject
{
  public Alien()
  {
  }
  
  public Alien(Line line, int x)
  {
    super(line, x, line.getLineY(), 1);
  }
  public void display()  
  {
    fill(Game.ALIEN_COLOUR_WHITE);
    stroke(153);

    pushMatrix();    
    translate(0,0);
    
    rect(0, 5,Game.BLOCK_SIZE,Game.BLOCK_SIZE); rect(15, 5,Game.BLOCK_SIZE,Game.BLOCK_SIZE); rect(30, 5,Game.BLOCK_SIZE,Game.BLOCK_SIZE);
    rect(0,20,Game.BLOCK_SIZE,Game.BLOCK_SIZE); rect(15,20,Game.BLOCK_SIZE,Game.BLOCK_SIZE); rect(30,20,Game.BLOCK_SIZE,Game.BLOCK_SIZE);
    rect(0,35,Game.BLOCK_SIZE,Game.BLOCK_SIZE); rect(15,35,Game.BLOCK_SIZE,Game.BLOCK_SIZE); rect(30,35,Game.BLOCK_SIZE,Game.BLOCK_SIZE);
    
    popMatrix();
  } 
}
