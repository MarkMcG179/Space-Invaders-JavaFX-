public class Projectile 
{
  private int x;
  private int y;
  private float speed;

  public Projectile(int x)
  {    
    this.x=x;
    this.y=height-25;
    this.speed=16.0;
  }
  
  public int getX()  // remove this method when SpaceObject is implemented in a later part of the assignment
  {
    return x;
  }
  
  public int getY()  // remove this method when SpaceObject is implemented in a later part of the assignment
  {
    return y;
  }
  
  //
  // Add your code ABOVE this method
  //
  
  public void display() // CAREFUL HOW YOU MODIFY THIS CODE!!
  {
    fill(0, 255, 0);
    stroke(0, 255, 0);
    
    pushMatrix();
    
    this.y=(this.y-((int)this.speed*1));    
    translate(this.x, this.y);
    //rect(15,-70,Game.BLOCK_SIZE,Game.BLOCK_SIZE);   // 15
    rect(21,-60,3,3);                                 // 3
    
    popMatrix();
  }
  
  public String toString()
  {
    String str;
    str="[Projectile:x="+getX()+";y="+getY()+";speed="+speed+"]";
    return str;
  }
  
}
