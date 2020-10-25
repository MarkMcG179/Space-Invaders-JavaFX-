public class Game
{
  public static final int BLOCK_SIZE = 15;
  public static final int BUNKER_WIDTH_AND_HEIGHT = 40;  
  public static final int INITIAL_LIVES = 3;   
  public static final int LEFT = -1;
  public static final int RIGHT = 1;
  public static final int FIRE = 0;
  public static final int LASERCANNON_STEP = 10;  
  public static final int SCREEN_LINES = 12;
  public static final int SCREEN_LINE_HEIGHT = 50;  
  public static final int SPACESHIP_WIDTH = 45;  
  public static final int MIN_ALIENS_IN_LINE = 8;
  public static final int ALIEN_COLOUR_WHITE = #ffffff;
  public static final int ALIEN_COLOUR_HIT = #ff00ff;
  public static final int LASERCANNON_COLOUR_GREEN = #34eb1c;
  public static final int BUNKER_COLOUR_GREEN = #34eb1c;
  public static final int MYSTERYSHIP_COLOUR_GREEN = #ff0000;

  private int BUNKER_X[] = {120, 240, 360, 480};
  private int ALIEN_X[] =  {0, 60, 120, 180, 240, 300, 360, 420};  
  private ArrayList<Bunker> bunkers = new ArrayList<Bunker>();
  private LaserCannon laserCannon;  
  //private Octopus octopus;
  //private ArrayList<Octopus> octopuses;  
  private ArrayList<Alien> aliens;
  private MysteryShip mysteryShip;
  private ScreenData screenData;
  
  //count missses
  public int misses=0;

  public Game()
  {    
    // create bunkers
    try
    {
      bunkers.add(new Bunker(new Line(8), BUNKER_X[0]));
      bunkers.add(new Bunker(new Line(8), BUNKER_X[1]));
      bunkers.add(new Bunker(new Line(8), BUNKER_X[2]));
      bunkers.add(new Bunker(new Line(8), BUNKER_X[3]));
    }

    catch(Exception e)
    {
      println(e.getMessage());
      exit();
    }
    //println(bunker1);

    // create laserCannon
    try
    {
      laserCannon = new LaserCannon(new Line(9));
    }

    catch(Exception e)
    {
      println(e.getMessage());
      exit();
    }
    //println(laserCannon);

    // create octopus alien
    //octopus = new Octopus(new Line(3),0);   
    //octopuses = new ArrayList<Octopus>();
    aliens = new ArrayList<Alien>();
    //println(octopus);  

    //// In a later part of the assignment you'll use this code to add EIGHT aliens.  For Part 1 leave this code commented out.
    for (int i=0; i<MIN_ALIENS_IN_LINE; i++)
    {
      try
      {
        aliens.add(new Octopus(new Line(3), ALIEN_X[i]));  
        aliens.add(new Crab(new Line(2), ALIEN_X[i]));
        aliens.add(new Squid(new Line(1), ALIEN_X[i]));
      }

      catch(Exception e)
      {
        println(e.getMessage());
        exit();
      }
    }

    // no mystery ship (for now)
    mysteryShip=null;

    // create screenData here
    screenData = new ScreenData();
  }

  public void action(int value)
  {
    switch(value)
    {
    case Game.LEFT:  
      laserCannon.incX(-Game.LASERCANNON_STEP);
      break;
    case Game.RIGHT:  
      laserCannon.incX(Game.LASERCANNON_STEP);
      break;
    case Game.FIRE:   
      if (laserCannon.getProjectile()==null) {
        laserCannon.fire();
        //println(laserCannon.getProjectile());
      }
      break;
    }
  } // action

  public void update()
  {
    // draw screen lines
    gameLines();

    //// display screen data
    screenData.display();

    // try to create a mystery ship (if it doesn't exist)
    if (mysteryShip==null)
    {
      int chance = (int)random(1, 100); // with current framerate we have a 1/10 chance per second that mystery ship is created
      if (chance==1)
      {
        try
        {
          mysteryShip=new MysteryShip(new Line(0));
        }

        catch(Exception e)
        {
          println(e.getMessage());
          exit();
        }
        //println(mysteryShip);
      }
    }

    // display octopus(s)
    //octopus.display();  // In Part 1 you may get a runtime error here when you shoot an alien octopus.  You'll sort this with ArrayList solution.
    for (Alien a : aliens)
    {
      a.display();
    }

    for (Alien a : aliens)
    {
      if (aliens.get(0).getX()<0 || aliens.get(aliens.size()-1).getX() >600)
      {
       
          if (a instanceof Octopus)
          {
            Octopus o = (Octopus)a;
            o.changeDirection();
            o.getLine().setLineNumber(o.getLine().getLineNumber()+1);
            if(o.getLine().getLineNumber()==9)
            {
              exit();
            }
          }

          if (a instanceof Crab)
          {
            Crab c = (Crab)a;
            c.changeDirection();
            c.getLine().setLineNumber(c.getLine().getLineNumber()+1);
            if(c.getLine().getLineNumber()==9)
            {
              exit();
            }
          }

          if (a instanceof Squid)
          {
            Squid s = (Squid)a;
            s.changeDirection();
            s.getLine().setLineNumber(s.getLine().getLineNumber()+1);
            if(s.getLine().getLineNumber()==9)
            {
              exit();
            }
          }
        
      }
    }




    // display mystery ship (if it exists)
    if (mysteryShip!=null)
    {
      if (mysteryShip.visible())
        mysteryShip.display();
      else
        mysteryShip=null;
    }

    // display spaceship
    laserCannon.display();

    // display bunkers
    for (int i=0; i<bunkers.size(); i++)
    {
      bunkers.get(i).display();
    }

    //// if the projectile is fired - display it and check for collisions
    if (laserCannon.getProjectile()!=null)
    {
      // display the projectile      
      laserCannon.getProjectile().display();

      //checks if projectiles hit bunker
      for (Bunker b : bunkers)
      {
        if (b.blocksProjectile(laserCannon.getProjectile()))    //if the projectiles hit the bunkers, stop displaying the projectiles
        {  
          laserCannon.reloadProjectile();  
          screenData.incMisses(1);
          if(screenData.misses==5 || screenData.misses==10)
          {
            screenData.loseLife();
          }
        
          if(screenData.misses==15)
          {
            screenData.loseLife();
            exit();
          }
          return;
        }
      }

      //check for projectile collisions with mystery ships
      if (mysteryShip != null)
      {
        if (mysteryShip.intersect(laserCannon.getProjectile().getX(), laserCannon.getProjectile().getY())==true)
        {
          try
          {
            mysteryShip = new MysteryShip(new Line (0));
          }

          catch(Exception e)
          {
            println(e.getMessage());
            exit();
          }
          screenData.incScore(100);
          background(#ff0000);
          laserCannon.reloadProjectile();
          return;
        }
      }

      // check for projectile collisions with alien(s)
      for (int i=0; i<aliens.size(); i++)
      {
        if (aliens.get(i) instanceof Octopus)
        {
          Octopus o = (Octopus)aliens.get(i);
          if (o.intersect(laserCannon.getProjectile().getX(), laserCannon.getProjectile().getY())==true )
          {
            aliens.remove(i);  // remove alien (it exploded in collision)
            screenData.incScore(20);
            background(#34eb1c);
            laserCannon.getProjectile().setY(1);
            laserCannon.getProjectile().setSpeed(0.0);
          }
        }

        if (aliens.get(i) instanceof Crab)
        {
          Crab c = (Crab)aliens.get(i);
          if (c.intersect(laserCannon.getProjectile().getX(), laserCannon.getProjectile().getY())==true )
          {
            aliens.remove(i);  // remove alien (it exploded in collision)
            background(#34eb1c);
            screenData.incScore(30);
            laserCannon.getProjectile().setY(1);
            laserCannon.getProjectile().setSpeed(0.0);
          }
          
        } 

        if (aliens.get(i) instanceof Squid)
        {
          Squid s = (Squid)aliens.get(i);
          
          if (s.intersect(laserCannon.getProjectile().getX(), laserCannon.getProjectile().getY())==true )
          {
            aliens.remove(i);  // remove alien (it exploded in collision)
            background(#34eb1c);
            screenData.incScore(40);
            laserCannon.getProjectile().setY(1);
            laserCannon.getProjectile().setSpeed(0.0);
          }
       
        }
      }

      // Part 1 (reload) - check if the projectile goes beyond the top of screen.  If yes reload!
      if (laserCannon.getProjectile().getY() < 0)
      {
        laserCannon.reloadProjectile();
        screenData.incMisses(1);
        if(screenData.misses==5 || screenData.misses==10)
        {
          screenData.loseLife();
        }
        
        if(screenData.misses==15)
        {
          screenData.loseLife();
          exit();
        }
      }
      

    }

    if (laserCannon.getProjectile() != null && laserCannon.getProjectile().getSpeed()==0.0)
    {
      laserCannon.reloadProjectile();
    }
    
    //if all lives are lost, end the game
    if(screenData.getLives() == 0)
    {
       exit();
    }
   
  } // update

  public void help()
  {
    println("Welcome to Space Invaders\n\na=LEFT\ns=RIGHT\nSPACE=FIRE\nh=HELP\nq=QUIT");
  }

  public void gameLines()  // allows you to see lines better
  {       
    for (int line=0; line<Game.SCREEN_LINES; line++)
    {
      if (line%2==1)
      {
        fill(20);
        stroke(20);
      } else
      {
        fill(0);
        stroke(0);
      }
      rect(0, line*Game.SCREEN_LINE_HEIGHT, width, Game.SCREEN_LINE_HEIGHT);
    }
  }

  //}
}
