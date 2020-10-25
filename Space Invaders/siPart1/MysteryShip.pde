public class MysteryShip
{
  private Line line; 
  private int x;
  private int y;
  private float speed;   
  private int direction;
  private int[] template = {0,1,0,1,1,1,0,1,0};
    
  public MysteryShip(Line line)
  {
    this.line = line;    
    this.x=-Game.SPACESHIP_WIDTH;    
    this.y=line.getLineY();
    this.speed=2.0;
    this.direction=1;
  }

  public int getX()
  {
    return this.x;
  }
  
  public boolean visible()
  {
    if (this.x+((int)this.speed*1)>width)
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
    this.x=this.x+(this.direction*(int)this.speed);
  }

  public boolean intersect(int x, int y)
  {
    if (dist(x+1, y+1, this.x*this.speed, this.y) < 22.5)
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
    translate(this.x*this.speed, this.y);
    
                                                rect(Game.BLOCK_SIZE*1, 5,Game.BLOCK_SIZE,Game.BLOCK_SIZE);
    rect(0,20,Game.BLOCK_SIZE,Game.BLOCK_SIZE); rect(Game.BLOCK_SIZE*1,20,Game.BLOCK_SIZE,Game.BLOCK_SIZE); rect(Game.BLOCK_SIZE*2,20,Game.BLOCK_SIZE,Game.BLOCK_SIZE);
                                                rect(Game.BLOCK_SIZE*1,35,Game.BLOCK_SIZE,Game.BLOCK_SIZE); 
              
    popMatrix();
  }

  public String toString()
  {
    String str;
    str="[MysteryShip:line=[lineNumber="+line.getLineNumber()+"]x="+x+";y="+y+";speed="+speed+";direction="+getDirection()+"]";
    return str;
  }
}
