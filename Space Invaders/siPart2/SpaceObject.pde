public abstract class SpaceObject
{
  private Line line;
  private int x;
  private int y;
  private float speed;
  
  public SpaceObject()
  {
    this.line=new Line(0);
    this.x=0;
    this.y=0;
    this.speed=1.0;
  }
  
  public SpaceObject(Line line, int x, int y)
  {
    this.line=line;
    this.x=x;
    this.y=y;
  }
  
  public SpaceObject(int x, int y, float speed)
  {
    this.line=new Line(0);
    this.x=x;
    this.y=y;
    this.speed=speed;
  }
  
  public SpaceObject(Line line, int x, int y, float speed)
  {
    this.line=line;
    this.x=x;
    this.y=y;
    this.speed=speed;
  }
  
  public void setLine(Line line)
  {
    this.line=line;
  }
  
  public Line getLine()
  {
    return this.line;
  }
  
  public void setX(int x)
  {
    this.x=x;
  }
  
  public int getX()
  {
    return this.x;
  }
  
  public void setY(int y)
  {
    this.y=y;
  }
  
  public int getY()
  {
    return this.y;
  }
  
  public void setSpeed(float speed)
  {
    this.speed=speed;
  }
  
  public float getSpeed()
  {
    return this.speed;
  }
  
  public abstract void display();
  {
    
  }
  
  public String toString()
  {
    String str;
    str="[SpaceObject:line=[lineNumber="+line.getLineNumber()+"]x="+x+";y="+y+";speed="+speed+"]";
    return str;
  }
  
}
