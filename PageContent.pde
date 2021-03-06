class PageContent {

  //Variables
  int numpages;
  String numgroup;
  //color fillColour = color(99,184,215) ; //grey
  //color borderColour = color(0) ; //black
  ControlFont cf1 = new ControlFont(createFont("andalemo.ttf",20));
  Table contenusP = loadTable(defpagescsv, "header"); 


  //Constructor
  PageContent (int _numpage) {
    numpages=_numpage;
    numgroup="G" + numpages;
    cp5.addGroup(numgroup)
               //.setPosition(100,100)
               //.setBackgroundHeight(100)
               //.setBackgroundColor(color(255,50))
                ;
    //println(numgroup);
    for (int i=1; i<4; i++) {
      float randx = random(884);
      Table contenusP = loadTable(defpagescsv, "header");
      //println(contenusP);
      cp5.addButton(contenusP.getString(_numpage, i))
     .setValue(i)
     .setId(i)
     .setPosition(300+randx,200+i*200)
     .setSize(680,120)
     .setColorBackground(OffColor) 
     .setColorForeground(MouseColor)
     .setColorActive(OnColor)
     .setGroup(numgroup)
     ;
      cp5.getController(contenusP.getString(_numpage, i))
     .getCaptionLabel()
     .setFont(mono)
     .toUpperCase(false)
     .setSize(54)
     ;
    }
     cp5.getGroup(numgroup).hide();
  }

void display() {
    textSize(0100);
    text("Page #" + page, cx, cy);
    text("file" + contenusP.getString(page-1, 0), 500, 300);
 
  }
void resetbouttons(){
  cp5.setColorBackground(OffColor);
  }
}
