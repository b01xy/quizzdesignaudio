/**
 * authors: 
 *  b01 / la Labomedia
 
 * license (unless otherwise specified): 
 *   creative commons attribution-share alike 3.0 license.
 *   http://creativecommons.org/licenses/by-sa/3.0/ 
 */
 
//import java.io.BufferedWriter;
//import java.io.FileWriter;
//import android.os.Environment;
//import android.view.Window;
//import android.view.WindowManager;
//import android.content.pm.ActivityInfo;
//import android.os.Bundle;
import controlP5.*;
ControlP5 cp5;
PFont mono;

import android.os.Environment;
import java.io.File;
import cassette.audiofiles.SoundFile;
//import ddf.minim.*;
//Minim minim;


static final int MAXPAGES = 12;
int page, cx, cy;
int c1,c2, previouspage, anti4;
float nbrelignes;
String boutonclique;
PImage backgroundimg, backgroundpaper, playimg;
Table lesstats;

color OffColor = #ff2d5a;
color OnColor = #ff74d9;
color MouseColor = #ff99d9;
//color OffColor = #ff6699; //#2d5aff;
//color OnColor = #ff74d9; //clic
//color MouseColor = #cc8310; //#ff99d9; //mouseover

float counttour;
int isPlaying, degrr;
String Trackall,numfichaudio;

String statistiquesALLcsv = "statistiquesALL.csv";
String defpagescsv = "defpages.csv";
String statistiquesLOGcsv = "statistiquesLOG.csv";
String statistiquescsv = "statistiques.csv";
String absolute_path = "/storage/emulated/0/Download";
String[] lines;

Table contenusP;
Table statistiquesALL;
Table statistiquesLOG; 

//Table statistiquesALL = loadMyTable(statistiquesALLcsv, statistiquesALLcsv.csv, "header");
//Table statistiquesLOG = loadTable(statistiquesLOGcsv, "header"); 


PageContent contpage0, contpage1, contpage2, contpage3, contpage4, contpage5, contpage6, contpage7, contpage8, contpage9, contpage10, contpage11;
Statistiques statshow;
MediaPlayer Track0, Track1, Track2, Track3, Track4, Track5, Track6, Track7, Track8, Track9, Track10, Track11;
// Pour instancier des objets en boucle cf Max
// ArrayList<MediaPlayer> tracks = new ArrayList<MediaPlayer>();
//AudioPlayer Track0, Track1, Track2, Track3, Track4, Track5, Track6, Track7, Track8, Track9, Track10, Track11;

void setup() {
  println("setup() ");
  //size(1920, 1200);
  //size(1920, 1200);
  orientation(LANDSCAPE); 
  //orientation(PORTRAIT);  // the hamburger way force l'affichage en mode portrait
  fullScreen(); //met en full screen sur android ?
  
  frameRate(30);
//  noLoop();
  smooth();

  println("Loading tables");
  statistiquesALL = loadMyTable(statistiquesALLcsv);
  statistiquesLOG = loadMyTable(statistiquesLOGcsv);
  println("Tables loaded");
  cp5 = new ControlP5(this);
  //ControlP5.printPublicMethodsFor(ControlP5.class);  
  Track0 = soundLoad("0.wav");
  Track1 = soundLoad("1.wav");
  Track2 = soundLoad("2.wav");
  Track3 = soundLoad("3.wav");
  Track4 = soundLoad("4.wav");
  Track5 = soundLoad("5.wav");
  Track6 = soundLoad("6.wav");
  Track7 = soundLoad("7.wav");
  Track8 = soundLoad("8.wav");
  Track9 = soundLoad("9.wav");
  Track10 = soundLoad("10.wav");
  Track11 = soundLoad("11.wav");
  
// Pour instancier des objets en boucle cf Max
  //for(int k = 0; k <= 11; k++) {
  //  String trackname = String.valueOf(k) + ".wav";
  //  tracks.add(soundLoad(trackname));
  //}

  //minim = new Minim(this);
  
  //Track0 = minim.loadFile("0.wav");
  //Track1 = minim.loadFile("1.wav");
  //Track2 = minim.loadFile("2.wav");
  //Track3 = minim.loadFile("3.wav");
  //Track4 = minim.loadFile("4.wav");
  //Track5 = minim.loadFile("5.wav");
  //Track6 = minim.loadFile("6.wav");
  //Track7 = minim.loadFile("7.wav");
  //Track8 = minim.loadFile("8.wav");
  //Track9 = minim.loadFile("9.wav");
  //Track10 = minim.loadFile("10.wav");
  //Track11 = minim.loadFile("11.wav");

  isPlaying = 0;

  rectMode(CORNER);
  ellipseMode(CENTER);
  textAlign(CENTER, CENTER);
  mono = createFont("andalemo.ttf", 48);
  textFont(mono);
  textSize(32);
  backgroundimg = loadImage("designlogo450-671.png");
  backgroundpaper = loadImage("p-paper.jpg");
  playimg = loadImage("btnplay.png");
  stroke(0);
  strokeWeight(5);
  
  
  page = 0;
  cx = width  >> 1;
  cy = height >> 1;
  


  //cp5.setControlFont(mono);
  cp5.addGroup("suiv");
  cp5.addButton("SUIVANT")
     .setValue(++page)
     .setPosition(1520,1080)
     //.setPosition(324,140)     
     .setSize(400,120)
     .setGroup("suiv")
     .setColorActive(OnColor)
     .setColorBackground(MouseColor)
     //.setColorForeground(OffColor)
     ;
  cp5.getController("SUIVANT")
    .getCaptionLabel()
    .setFont(mono)
    .toUpperCase(false)
    .setSize(54)
     ;
  // and add another 2 buttons
  cp5.addGroup("accu");
  cp5.addButton("ACCUEIL")
     .setValue(page = 0)
     .setPosition(0,1080)
     .setSize(400,120)
     .setGroup("accu")
     ;
  cp5.getController("ACCUEIL")
    .getCaptionLabel()
    .setFont(mono)
    .toUpperCase(false)
    .setSize(54)
     ;
  cp5.addGroup("repl");
  cp5.addButton("Replay")
     .setPosition(860,110)
     .setImages(loadImage("btnreplay.png"),loadImage("btnplay.png"),loadImage("btnplay.png"))
     .updateSize()
     .setGroup("repl")
     ;
  cp5.getController("Replay")
   .getCaptionLabel()
   .setFont(mono)
   .toUpperCase(false)
   .setSize(39)
    ;
   


//  cp5.setAutoDraw(false);
  contpage0 = new PageContent (0);
  contpage1 = new PageContent (1);
  contpage2 = new PageContent (2);
  contpage3 = new PageContent (3);
  contpage4 = new PageContent (4);
  contpage5 = new PageContent (5);
  contpage6 = new PageContent (6);
  contpage7 = new PageContent (7);
  contpage8 = new PageContent (8);  
  contpage9 = new PageContent (9);
  contpage10 = new PageContent (10);  
  contpage11 = new PageContent (11);
  statshow = new Statistiques ();

 
 }


void draw() {
  switch(page) {
  case 0: drawScreen0(); break;
  case 1: drawScreen1(); break;
  case 2: drawScreen2(); break;
  case 3: drawScreen3(); break;
  case 4: drawScreen4(); break;
  case 5: drawScreen5(); break;
  case 6: drawScreen6(); break;
  case 7: drawScreen7(); break;
  case 8: drawScreen8(); break;
  case 9: drawScreen9(); break;
  case 10: drawScreen10(); break;
  case 11: drawScreen11(); break;
  case 12: drawScreen12(); break;
  }
}
 
void hideAllGroups(){
      for (int i=0; i<11; i++){
      String nomgroupacach = "G" + i;
      cp5.getGroup(nomgroupacach).hide(); 
    }
}

void tournePlay(int deg){
    pushMatrix();
      translate(960,210);
      float degrad = radians(deg);
      rotate(degrad);
      image(playimg, -100,-100);
    popMatrix();
}

Table loadMyTable(String stl) { 
  String filePath = sketchPath(stl);
  println("Loading table in file : " + filePath);
  File file = new File(filePath); 
  if (file.exists()) {
    return loadTable(stl, "header");
  } else {
    println("Error loading file: create a new one.");
    Table tableii = loadTable("statistiques000.csv", "header");
    saveTable(tableii, stl);
    return tableii;
  }
  
  //if (!file.canRead()) { 
  //    //boolean success = true; 
  //    //success = file.mkdirs();
  //    Table tableii = loadTable("statistiques000.csv", "header");
  //    println("file created, table populated " + stl);
  //    saveTable(tableii, stl);
  //  } 
  //else { 
  //  //lines = loadStrings(file.getAbsoluteFile());
  //  //tablei = loadTable(sketchPath(stl), "header"); // first time your app runs or there haven´t been any changes to the file
  //  //tablei = loadTable(absolute_path+"/"+stl, "header"); // first time your app runs or there haven´t been any changes to the file
  //  println("file exists, table to be loaded " + stl);
  //  } 
}


void saveMyTable(Table st, String tf) { 
  try { 
    //String absolute_path = new String(Environment.getExternalStorageDirectory().getAbsolutePath()); 
    String absolute_path = new String("/storage/emulated/0/Download/"); 
    File file = new File(absolute_path+"/"+tf); 
    println("saved file " + file);
    if (!file.exists()) { 
      boolean success = true; 
      success = file.mkdirs();
    } 
    saveTable(st, file+"/"+tf);
    println("File saved successfully." + file+"/"+tf);
  } 
  catch (Exception e) { 
    println("Error while saving file: " + e);
  }
}



void drawScreen0() {
    background(255);
    image(backgroundpaper, 0, 0);
    image(backgroundimg, 40, 160);
    fill(#FF00FF);
    hideAllGroups();
    cp5.getGroup("accu").hide();
    cp5.getGroup("repl").hide();
    contpage0.resetbouttons();
    textFont(mono);
    textSize(54);
    textAlign(CENTER);
    text("Bienvenue sur l'application consacrée au design sonore, en appuyant sur le bouton 'SUIVANT' vous allez pouvoir écouter des sons et choisir une émotion associée à ce son", 600, 460, 1200, 1000);
    switch(isPlaying){
      //########################
      case 0:
        soundPlay(Track0);
        // Pour instancier des objets en boucle cf Max
        //soundPlay(tracks.get(0));
        //Track0.rewind();
        //Track0.play();
        isPlaying = 1;
        break;
      //########################
      case 1:
      if (soundIsPlaying(Track0) == true){
//      isPlaying =Track0.IsPlaying();
//      if ( Track0.isPlaying() ){
        tournePlay(degrr);
        degrr = degrr + 10;
        if (degrr==360) {degrr=0;}
      }
      else  {        
        cp5.getGroup("repl").show();
        };
        break;
     }
  }
//
void drawScreen1() {
    background(255);
    image(backgroundpaper, 0, 0);
     cp5.getGroup("G0").show();
     cp5.getGroup("accu").show();
    switch(isPlaying){
      //########################
      case 1:
        soundPlay(Track1);
        //Track1.rewind();
        //Track1.play();        
        isPlaying = 2;
        break;
      //########################
      case 2:
      if (soundIsPlaying(Track1) == true){
//        if ( Track1.isPlaying() ){
        tournePlay(degrr);
        degrr = degrr + 10;
        if (degrr==360) {degrr=0;}}
      else  {        
        cp5.getGroup("repl").show();
        };
        break;
     }
    }
void drawScreen2() {
    background(255);
    image(backgroundpaper, 0, 0);    
    cp5.getGroup("G0").hide();    
    cp5.getGroup("G1").show();
    switch(isPlaying){
      //########################
      case 2:
        soundPlay(Track2);
        //Track2.rewind();
        //Track2.play();
        isPlaying = 3;
        break;
      //########################
      case 3:
      if (soundIsPlaying(Track2) == true){
//        if ( Track2.isPlaying() ){  
        tournePlay(degrr);
        degrr = degrr + 10;
        if (degrr==360) {degrr=0;}}
      else  {        
        cp5.getGroup("repl").show();
        };
        break;
     }
    }
void drawScreen3() {
  background(255);
  image(backgroundpaper, 0, 0);  
  cp5.getGroup("G1").hide();    
  cp5.getGroup("G2").show();
  switch(isPlaying){
      //########################
      case 3:
        soundPlay(Track3);
        //Track3.rewind();
        //Track3.play();
        isPlaying = 4;
        break;
      //########################
      case 4:
     if (soundIsPlaying(Track3) == true){
//        if ( Track3.isPlaying() ){  
        tournePlay(degrr);
        degrr = degrr + 10;
        if (degrr==360) {degrr=0;}}
      else  {        
        cp5.getGroup("repl").show();
        };
        break;
     }
    }
void drawScreen4() {
  background(255);
  image(backgroundpaper, 0, 0);
  cp5.getGroup("G2").hide();    
  cp5.getGroup("G3").show();  
  switch(isPlaying){
      //########################
      case 4:
        soundPlay(Track4);
        //Track4.rewind();
        //Track4.play();
        isPlaying = 5;
        break;
      //########################
      case 5:
      if (soundIsPlaying(Track4) == true){
//        if ( Track4.isPlaying() ){  
        tournePlay(degrr);
        degrr = degrr + 10;
        if (degrr==360) {degrr=0;}}
      else  {        
        cp5.getGroup("repl").show();
        };
        break;
     }
  }
void drawScreen5() {
  background(255);
  image(backgroundpaper, 0, 0);
  cp5.getGroup("G3").hide();    
  cp5.getGroup("G4").show();  
  switch(isPlaying){
      //########################
      case 5:
        soundPlay(Track5);
        //Track5.rewind();
        //Track5.play();
        isPlaying = 6;
        break;
      //########################
      case 6:
      if (soundIsPlaying(Track5) == true){
//        if ( Track5.isPlaying() ){  
        tournePlay(degrr);
        degrr = degrr + 10;
        if (degrr==360) {degrr=0;}}
      else  {        
        cp5.getGroup("repl").show();
        };
        break;
     }
  }
void drawScreen6() {
    background(255);
    image(backgroundpaper, 0, 0);
  cp5.getGroup("G4").hide();    
  cp5.getGroup("G5").show();  
  switch(isPlaying){
      //########################
      case 6:
        soundPlay(Track6);
        //Track6.rewind();
        //Track6.play();
        isPlaying = 7;
        break;
      //########################
      case 7:
      if (soundIsPlaying(Track6) == true){
        //if ( Track6.isPlaying() ){  
        tournePlay(degrr);
        degrr = degrr + 10;
        if (degrr==360) {degrr=0;}}
      else  {        
        cp5.getGroup("repl").show();
        };
        break;
     }
  }
void drawScreen7() {
    background(255);
    image(backgroundpaper, 0, 0);
  cp5.getGroup("G5").hide();    
  cp5.getGroup("G6").show();  
  switch(isPlaying){
      //########################
      case 7:
        soundPlay(Track7);
        //Track7.rewind();
        //Track7.play();
        isPlaying = 8;
        break;
      //########################
      case 8:
      if (soundIsPlaying(Track7) == true){
        //if ( Track7.isPlaying() ){  
        tournePlay(degrr);
        degrr = degrr + 10;
        if (degrr==360) {degrr=0;}}
      else  {        
        cp5.getGroup("repl").show();
        };
        break;
     }
  }
void drawScreen8() {
    background(255);
    image(backgroundpaper, 0, 0);
  cp5.getGroup("G6").hide();    
  cp5.getGroup("G7").show();  
  switch(isPlaying){
      //########################
      case 8:
        soundPlay(Track8);
        //Track8.rewind();
        //Track8.play();
        isPlaying = 9;
        break;
      //########################
      case 9:
      if (soundIsPlaying(Track8) == true){
//        if ( Track8.isPlaying() ){  
        tournePlay(degrr);
        degrr = degrr + 10;
        if (degrr==360) {degrr=0;}}
      else  {        
        cp5.getGroup("repl").show();
        };
        break;
     }
  }
void drawScreen9() {
    background(255);
    image(backgroundpaper, 0, 0);
  cp5.getGroup("G7").hide();    
  cp5.getGroup("G8").show();  
  switch(isPlaying){
      //########################
      case 9:
        soundPlay(Track9);
        //Track9.rewind();
        //Track9.play();
        isPlaying = 10;
        break;
      //########################
      case 10:
      if (soundIsPlaying(Track9) == true){
//        if ( Track9.isPlaying() ){  
        tournePlay(degrr);
        degrr = degrr + 10;
        if (degrr==360) {degrr=0;}}
      else  {        
        cp5.getGroup("repl").show();
        };
        break;
     }
  }
void drawScreen10() {
    background(255);
    image(backgroundpaper, 0, 0);
  cp5.getGroup("G8").hide();    
  cp5.getGroup("G9").show();  
  switch(isPlaying){
      //########################
      case 10:
        soundPlay(Track10);
        //Track10.rewind();
        //Track10.play();
        isPlaying = 11;
        break;
      //########################
      case 11:
      if (soundIsPlaying(Track10) == true){
//        if ( Track10.isPlaying() ){  
        tournePlay(degrr);
        degrr = degrr + 10;
        if (degrr==360) {degrr=0;}}
      else  {        
        cp5.getGroup("repl").show();
        };
        break;
     }
  }
void drawScreen11() {
    background(255);
    image(backgroundpaper, 0, 0);
  cp5.getGroup("G9").hide();    
  cp5.getGroup("G10").show();
  switch(isPlaying){
      //########################
      case 11:
        soundPlay(Track11);
        //Track11.rewind();
        //Track11.play();
        isPlaying = 12;
        break;
      //########################
      case 12:
      if (soundIsPlaying(Track11) == true){
//        if ( Track11.isPlaying() ){  
        tournePlay(degrr);
        degrr = degrr + 10;
        if (degrr==360) {degrr=0;}}
      else  {        
        cp5.getGroup("repl").show();
        };
        break;
     }
     counttour = 0;
  
}
void drawScreen12() {
  background(255);
  image(backgroundpaper, 0, 0);
  hideAllGroups();
  statshow.display();
}
