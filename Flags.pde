class Flags{
  private boolean[] flags;
  
  Flags(){
    flags = new boolean[0];
  }
  
  Flags(int y){
    flags = new boolean[y];
    for(int x = 0; x < flags.length; x++){
      flags[x] = false;
    }
  }
  
  void setFlag(boolean b, int f){
    flags[f] = b;
    println("Flag: " + f + " set: " + b);
  }
  
  boolean getFlag(int f){
    return flags[f];
  }
}
