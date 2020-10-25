public class LaserCannon extends SpaceObject
{
  //private Line line;
  //private int x;
  //private int y;
  private Projectile projectile;
  private int[] template = {0,1,0,1,1,1,1,1,1};
  
  public LaserCannon(Line line)
  {
    //this.line = line;
    //this.x=0;
    //this.y=line.getLineY();
    super(line, 0, line.getLineY());
    this.projectile=null;
  }
  
  void incX(int direction) 
  {
    //this.x=this.x+direction;
    super.x=super.x+direction;
  }

  public void reloadProjectile()
  {
    projectile=null;
  }

  public Projectile getProjectile()
  {
    return projectile;
  }

  public void fire()
  {
    projectile = new Projectile(super.x);
  }

  //
  // Add your code ABOVE this method
  //
  
  public void display() // CAREFUL HOW YOU MODIFY THIS CODE!!
  {
    fill(Game.LASERCANNON_COLOUR_GREEN);
    stroke(153);

    pushMatrix();   
    //translate(getX(), getY());    
    translate(super.x, super.y);

                                                 rect(Game.BLOCK_SIZE*1, 5,Game.BLOCK_SIZE,Game.BLOCK_SIZE);
    rect( 0,20,Game.BLOCK_SIZE,Game.BLOCK_SIZE); rect(Game.BLOCK_SIZE*1,20,Game.BLOCK_SIZE,Game.BLOCK_SIZE); rect(Game.BLOCK_SIZE*2,20,Game.BLOCK_SIZE,Game.BLOCK_SIZE);
    rect( 0,35,Game.BLOCK_SIZE,Game.BLOCK_SIZE); rect(Game.BLOCK_SIZE*1,35,Game.BLOCK_SIZE,Game.BLOCK_SIZE); rect(Game.BLOCK_SIZE*2,35,Game.BLOCK_SIZE,Game.BLOCK_SIZE);

    popMatrix();
  }
  
  public String toString()
  {
    String str;
    str="[LaserCannon:line=[lineNumber="+getLine().getLineNumber()+"]x="+getX()+";y="+getY()+"]";
    return str;
  }
}
