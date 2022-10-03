public class Tuple {
  Object[] data;
  int len;
  
  public Tuple(Object ... data) {
    this.data = data;
    this.len = data.length;
  }
  
  public Object get(int index) {
    return this.data[index];
  }
  
  public void set(int index, Object data) {
    if (index < 0 || index >= this.len) {
      throw new RuntimeException("Tuple index out of bounds");
    } else {
      this.data[index] = data;
    }
  }
  
  public int length() {
    return this.len;
  }
}
