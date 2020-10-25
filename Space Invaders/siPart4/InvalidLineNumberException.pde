class InvalidLineNumberException extends Exception
{  
  public InvalidLineNumberException()
  {
  }
  
  public String getMessage()
  {
    String m;
    m = "Invalid Line Number!";
    return m;
  }
  
}
