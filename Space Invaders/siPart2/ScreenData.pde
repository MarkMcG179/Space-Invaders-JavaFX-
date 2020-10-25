public class ScreenData
{
  private int score;
  private int lives;

  public ScreenData()
  {
    score=0;
    lives=Game.INITIAL_LIVES;
  }

  public int getScore()
  {
    return score;
  }
  
  public void setScore(int score)
  {
     this.score=score;
  }
  
  public void incScore(int value)
  {
     score=score+value;
  }
  
  public int getLives()
  {
    return lives;
  }
  
  public void setLives(int lives)
  {
    this.lives=lives;
  }
  
  public void addLife()
  {
    ++lives;
  }
  
  public void loseLife()
  {
    --lives;
  }
  
  public void display()
  {
    textSize(28);
    fill(153);    
    
    // display lives and score
    textAlign(LEFT);
    text("Score:"+getScore(), 2, 25);
    textAlign(LEFT);
    text("Lives:"+getLives(), 2, 590);
    
    fill(51,235,28);
    stroke(153);
    
    // display minature laser cannons later
    int factor = 7;
    for(int i = 0; i < Game.INITIAL_LIVES-1; i++)
    {
      rect(Game.BLOCK_SIZE*(factor + i), height-25,Game.BLOCK_SIZE,Game.BLOCK_SIZE);
      rect(Game.BLOCK_SIZE*(factor +.35 +i), height-30, 5, 5);
    }
  }
  
  
  public String toString()
  {
    String str;
    str= "[ScreenData:score="+getScore()+";lives="+getLives()+"]";
    return str;
  }
  
  
}
