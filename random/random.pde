Board board;
boolean playerTurn;
boolean running;

void displayWinner(int winner) {
  if (winner == 0) {
    fill(255, 0, 0);
    rotate(PI/4);
    rect(200, 250, 600, 350);
    rotate(-PI/2);
    rect(50, 250, 750, 350);
    rotate(PI/4);
    fill(255, 255, 255);
  } else if (winner == 1) {
    fill(255, 0, 0);
    ellipse(400, 400, 400, 300);
    fill(255, 255, 255);
    ellipse(350, 350, 400, 300);
  } else {
    System.out.println("how");
  }
}

void setup() {
  size(800, 600);
  
  board = new Board();
  playerTurn = false;
  running = true;
}

void draw() {
  if (running) {
    if (mousePressed) {
      
    }
    
    if (board.findWinner() != -1) {
      displayWinner(board.findWinner());
      running = false;
    } else {
      playerTurn = !playerTurn;
    }
  }
}
