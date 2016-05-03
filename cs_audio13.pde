/**
 * authors: 
 *  b01 / Labomedia
 
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

import cassette.audiofiles.SoundFile;

static final int MAXPAGES = 12;
int page, cx, cy;
int c1,c2, previouspage, anti4;
float nbrelignes;
String boutonclique;
PImage backgroundimg, playimg;
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

PageContent contpage0, contpage1, contpage2, contpage3, contpage4, contpage5, contpage6, contpage7, contpage8, contpage9, contpage10, contpage11;
Statistiques statshow;
MediaPlayer Track0, Track1, Track2, Track3, Track4, Track5, Track6, Track7, Track8, Track9, Track10, Track11;

void setup() {
  //size(1024, 600);
  orientation(LANDSCAPE); 
  //orientation(PORTRAIT);  // the hamburger way force l'affichage en mode portrait
  fullScreen(); //met en full screen sur android ?
  
  frameRate(30);
//  noLoop();
  smooth();
  cp5 = new ControlP5(this);
  
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

  isPlaying = 0;

  rectMode(CORNER);
  ellipseMode(CENTER);
  textAlign(CENTER, CENTER);
  mono = createFont("andalemo.ttf", 32);
  textFont(mono);
  textSize(32);
  backgroundimg = loadImage("designfaitsens.png");
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
     .setPosition(824,540)
     //.setPosition(324,140)     
     .setSize(200,60)
     .setGroup("suiv")
     .setColorActive(OnColor)
     .setColorBackground(MouseColor)
     //.setColorForeground(OffColor)
     ;
  cp5.getController("SUIVANT")
    .getCaptionLabel()
    .setFont(mono)
    .toUpperCase(false)
    .setSize(39)
     ;
  // and add another 2 buttons
  cp5.addGroup("accu");
  cp5.addButton("ACCUEIL")
     .setValue(page = 0)
     .setPosition(0,540)
     .setSize(200,60)
     .setGroup("accu")
     ;
  cp5.getController("ACCUEIL")
    .getCaptionLabel()
    .setFont(mono)
    .toUpperCase(false)
    .setSize(39)
     ;
  cp5.addGroup("repl");
  cp5.addButton("Replay")
     .setPosition(456,44)
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
  //contpage11 = new PageContent (11);
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
      translate(512,100);
      float degrad = radians(deg);
      rotate(degrad);
      image(playimg, -56,-56);
    popMatrix();
}



void drawScreen0() {
    background(255);
    image(backgroundimg, 20, 80);
    fill(#FF00FF);
    hideAllGroups();
    cp5.getGroup("accu").hide();
    cp5.getGroup("repl").hide();
    contpage0.resetbouttons();
    textFont(mono);
    textSize(36);
    textAlign(CENTER);
    text("Bienvenue sur l'application consacrée au design sonore, en appuyant sur le bouton 'SUIVANT' vous allez pouvoir écouter des sons et choisir une émotion associée à ce son", 330, 220, 664, 550);
    switch(isPlaying){
      //########################
      case 0:
        Track0 = soundLoad("0.wav");
        soundPlay(Track0);
        isPlaying = 1;
        break;
      //########################
      case 1:
      if (soundIsPlaying(Track0) == true){
        tournePlay(degrr);
        degrr = degrr + 10;
        if (degrr==360) {degrr=0;}}
      else  {        
        cp5.getGroup("repl").show();
        };
        break;
     }
  }
//
void drawScreen1() {
    background(255);
     cp5.getGroup("G0").show();
     cp5.getGroup("accu").show();
    switch(isPlaying){
      //########################
      case 1:
        Track1 = soundLoad("1.wav");
        soundPlay(Track1);
        isPlaying = 2;
        break;
      //########################
      case 2:
      if (soundIsPlaying(Track1) == true){
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
    cp5.getGroup("G0").hide();    
    cp5.getGroup("G1").show();
    switch(isPlaying){
      //########################
      case 2:
        Track2 = soundLoad("2.wav");
        soundPlay(Track2);
        isPlaying = 3;
        break;
      //########################
      case 3:
      if (soundIsPlaying(Track2) == true){
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
  cp5.getGroup("G1").hide();    
  cp5.getGroup("G2").show();
  switch(isPlaying){
      //########################
      case 3:
        Track3 = soundLoad("3.wav");
        soundPlay(Track3);
        isPlaying = 4;
        break;
      //########################
      case 4:
      if (soundIsPlaying(Track3) == true){
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
  cp5.getGroup("G2").hide();    
  cp5.getGroup("G3").show();  
  switch(isPlaying){
      //########################
      case 4:
        Track4 = soundLoad("4.wav");
        soundPlay(Track4);
        isPlaying = 5;
        break;
      //########################
      case 5:
      if (soundIsPlaying(Track4) == true){
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
  cp5.getGroup("G3").hide();    
  cp5.getGroup("G4").show();  
  switch(isPlaying){
      //########################
      case 5:
        Track5 = soundLoad("5.wav");
        soundPlay(Track5);
        isPlaying = 6;
        break;
      //########################
      case 6:
      if (soundIsPlaying(Track5) == true){
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
  cp5.getGroup("G4").hide();    
  cp5.getGroup("G5").show();  
  switch(isPlaying){
      //########################
      case 6:
        Track6 = soundLoad("6.wav");
        soundPlay(Track6);
        isPlaying = 7;
        break;
      //########################
      case 7:
      if (soundIsPlaying(Track6) == true){
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
  cp5.getGroup("G5").hide();    
  cp5.getGroup("G6").show();  
  switch(isPlaying){
      //########################
      case 7:
        Track7 = soundLoad("7.wav");
        soundPlay(Track7);
        isPlaying = 8;
        break;
      //########################
      case 8:
      if (soundIsPlaying(Track7) == true){
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
  cp5.getGroup("G6").hide();    
  cp5.getGroup("G7").show();  
  switch(isPlaying){
      //########################
      case 8:
        Track8 = soundLoad("8.wav");
        soundPlay(Track8);
        isPlaying = 9;
        break;
      //########################
      case 9:
      if (soundIsPlaying(Track8) == true){
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
  cp5.getGroup("G7").hide();    
  cp5.getGroup("G8").show();  
  switch(isPlaying){
      //########################
      case 9:
        Track9 = soundLoad("9.wav");
        soundPlay(Track9);
        isPlaying = 10;
        break;
      //########################
      case 10:
      if (soundIsPlaying(Track9) == true){
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
  cp5.getGroup("G8").hide();    
  cp5.getGroup("G9").show();  
  switch(isPlaying){
      //########################
      case 10:
        Track10 = soundLoad("10.wav");
        soundPlay(Track10);
        isPlaying = 11;
        break;
      //########################
      case 11:
      if (soundIsPlaying(Track10) == true){
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
  cp5.getGroup("G9").hide();    
  cp5.getGroup("G10").show();
  switch(isPlaying){
      //########################
      case 11:
        Track11 = soundLoad("11.wav");
        soundPlay(Track11);
        isPlaying = 12;
        break;
      //########################
      case 12:
      if (soundIsPlaying(Track11) == true){
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
  hideAllGroups();
  statshow.display();
}