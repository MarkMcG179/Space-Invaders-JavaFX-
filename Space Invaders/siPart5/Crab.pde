public class Crab extends Alien
{
  int[] template = {1,0,1,1,1,1,1,0,1};
  int direction;
  
  public Crab(Line line, int x)
  {
    //this.line=line;    
    //this.x=x;
    //this.y=line.getLineY();
    //this.speed=1;
    super(line, x);
    this.direction=1;
  }
  
  public int getDirection()
  {
    return this.direction;
  }
  
  public void changeDirection()
  {
    this.direction=direction*-1;
        incLine();
  }
  
  public void incLine()
  {
    setY(getY()+(Game.SCREEN_LINE_HEIGHT));
    
  }
  
  void incX()
  {
    int xval = this.getX()+(this.direction*(int)getSpeed());
    this.setX(xval);
  }
  
  public boolean intersect(int x, int y)
  {
    if (dist(x+1, y+1, this.getX()*this.getSpeed(), this.getY()) < 22.5)
      return true;
    else
      return false;
  }
  
  public void display() // CAREFUL HOW YOU MODIFY THIS CODE!!
  {
    fill(Game.ALIEN_COLOUR_WHITE);
    stroke(153);

    pushMatrix();
    
    incX();
    
    translate(this.getX()*this.getSpeed(), this.getY());
    
    rect(0, 5,Game.BLOCK_SIZE,Game.BLOCK_SIZE);                                              rect(30, 5,Game.BLOCK_SIZE,Game.BLOCK_SIZE);
    rect(0,20,Game.BLOCK_SIZE,Game.BLOCK_SIZE); rect(15,20,Game.BLOCK_SIZE,Game.BLOCK_SIZE); rect(30,20,Game.BLOCK_SIZE,Game.BLOCK_SIZE);
    rect(0,35,Game.BLOCK_SIZE,Game.BLOCK_SIZE);                                              rect(30,35,Game.BLOCK_SIZE,Game.BLOCK_SIZE);
    
    popMatrix();
  } 
  
  public String toString()
  {
    String str;
    str="[Octopus:line=[lineNumber="+this.getLine().getLineNumber()+"]x="+this.getX()+";y="+this.getY()+";speed="+this.getSpeed()+";direction="+getDirection()+"]";
    return str;
  }
  
}
