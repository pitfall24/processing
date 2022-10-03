public class CircularList {      
  Node head = null;
  Node tail = null;
  
  public void add(Object data) {
    Node newNode = new Node(data);
    if (head == null) {
      head = newNode;
      tail = newNode;
      newNode.next = head;
    } else {
      tail.next = newNode;  
      tail = newNode;  
      tail.next = head;  
    }
  }
  
  public void display() {
    Node current = head;
    if (head == null) {
      System.out.println("List is empty");
    } else {
      System.out.print("[");
      do {
        System.out.print(current.data.toString() + ", ");
        current = current.next;
      } while (current != head);
      System.out.println("]");
    }
  }
}
