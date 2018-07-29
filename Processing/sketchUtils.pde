

class Button {
  String name;
  color col, tcol;
  int x, y, w, h;
  Runnable onclick;
  Button(String n, int x, int y, int w, int h, color c, color tc, Runnable oc){
    onclick = oc;
    name = n;
    col = c;
    tcol = tc;
    this.x = x;
    this.y = y;
    this.w = w;
    this.h = h;
  }
  void draw(){
    PFont mono = createFont("Courier", h*2/3);
    fill(col);
    rect(x, y, w, h);
    fill(tcol);
    textAlign(CENTER, CENTER);
    textFont(mono);
    text(name, x+w/2, y+h/2);
    
  }
  void onClick(){
    if (x+w >= mouseX && mouseX >= x && y+h >= mouseY && mouseY >= y) {
      onclick.run();
    }
  }
}
