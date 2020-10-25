public class MysteryShip extends SpaceObject
{
  //private Line line; 
  //private int x;
  //private int y;
  //private float speed;   
  private int direction;
  private int[] template = {0,1,0,1,1,1,0,1,0};
    
  public MysteryShip(Line line)
  {
    //this.line = line;    
    //this.x=-Game.SPACESHIP_WIDTH;    
    //this.y=line.getLineY();
    //this.speed=2.0;
    super(line, -Game.SPACESHIP_WIDTH, line.getLineY(), 2.0);
    this.direction=1;
  }

  //public int getX()
  //{
    //return this.x;
  //}
  
  public boolean visible()
  {
    if (super.x+((int)super.speed*1)>width)
      return false;
    else
      return true;
  }
  
  public int getDirection()
  {
    return this.direction;
  }
    
  void incX()
  {
    super.x=super.x+(this.direction*(int)super.speed);
  }

  public boolean intersect(int x, int y)
  {
    if (dist(x+1, y+1, super.x*super.speed, super.y) < 22.5)
      return true;
    else
      return false;
  }

  //
  // Add your code ABOVE this method
  //
  
  public void display() // CAREFUL HOW YOU MODIFY THIS CODE!!
  {
    fill(Game.MYSTERYSHIP_COLOUR_GREEN);
    stroke(153);

    pushMatrix();
    
    incX();
    translate(super.x*super.speed, super.y);
    
                                                rect(Game.BLOCK_SIZE*1, 5,Game.BLOCK_SIZE,Game.BLOCK_SIZE);
    rect(0,20,Game.BLOCK_SIZE,Game.BLOCK_SIZE); rect(Game.BLOCK_SIZE*1,20,Game.BLOCK_SIZE,Game.BLOCK_SIZE); rect(Game.BLOCK_SIZE*2,20,Game.BLOCK_SIZE,Game.BLOCK_SIZE);
                                                rect(Game.BLOCK_SIZE*1,35,Game.BLOCK_SIZE,Game.BLOCK_SIZE); 
              
    popMatrix();
  }

  public String toString()
  {
    String str;
    str="[MysteryShip:line=[lineNumber="+getLine().getLineNumber()+"]x="+getX()+";y="+getY()+";speed="+getSpeed()+";direction="+getDirection()+"]";
    return str;
  }
}
