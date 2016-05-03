class Statistiques {

Table statistiquesALL = loadTable("statistiquesALL.csv", "header");
Table contenusP = loadTable("defpages.csv", "header");
Table statistiquesLOG = loadTable("statistiquesLOG.csv", "header"); 

Statistiques(){

}

void doLOG(){
      int nbretotallignes = statistiquesLOG.getRowCount();
      //println("nbre lignes " + nbretotallignes);
      for (int i=0;i<11;i++) {
        statistiquesLOG.addRow();
        for (int k=0;k<4;k++){
         int lastatfraiche = lesstats.getInt(i,k);
         statistiquesLOG.setInt(i+nbretotallignes,k,lastatfraiche);
         }
       }
      saveTable(statistiquesLOG, "statistiquesLOG.csv");
}


void dostats(){

  for (int i=0;i<11;i++) {
      for (int k=1;k<4;k++){
         int stataccum = statistiquesALL.getInt(i,k)+lesstats.getInt(i,k);
         statistiquesALL.setInt(i,k,stataccum);
       }
    }
    saveTable(statistiquesALL, "statistiquesALL.csv");
}

void display() {
//    textSize(0100);
    Table contenusP = loadTable("defpages.csv", "header");
    
    int lastatTOT = 0;

    counttour = counttour+0.01;
    for (int r=0;r<11;r++) {
        lastatTOT = 0;
        // Affichage des rectangles de stats 
        for (int j=1;j<4;j++){ lastatTOT = lastatTOT+statistiquesALL.getInt(r,j);
          }
        for (int j=1;j<4;j++){
          int lastat = statistiquesALL.getInt(r,j);
          float lastatf = lastat;
          float percent = lastatf/lastatTOT;
          fill(#ff74d9, 150);
          float barrevie = percent*240;
          noStroke();
          float p = counttour * barrevie;

          // la boucle pour faire progression stats
          if (p<barrevie){
            rect(25+j*250, 21+r*45, p, 40, 3, 18, 18, 18);
            }
          else {rect(25+j*250, 21+r*45, barrevie, 40, 3, 18, 18, 18);}
          }
    }
    // Affichage des textes
    for (int i=0;i<11;i++) {
      for (int j=0;j<4;j++){
        textSize(21);
        if (j==0){
          textAlign(LEFT);
          fill(255,45,90,255);
          text(contenusP.getString(i, j), 20+j*250, 42+i*45);
          strokeWeight(1);
          stroke(#ff74d9, 155);
          line(20,58+i*45,250,58+i*45);
          }
        else {
          textAlign(CENTER);
          fill(0,116,217,255);
          text(contenusP.getString(i, j), 145+j*250, 45+i*45);
          noFill();
          strokeWeight(2);
          // La boucle pour tester les derniers choix à surligner en rouge
          if (lesstats.getInt(i,j)==1){stroke(255,0,0,255);}
          else {stroke(#ff74d9, 200);}
          rect(25+j*250, 21+i*45, 240, 40, 3, 18, 18, 18);


          }
       }
    }
    // Légende
        textAlign(LEFT);
        fill(#ff74d9, 150);
        noStroke();
        rect(25+1*250, 11+12*45, 0.33*240, 40, 3, 18, 18, 18);
        fill(255,45,90,255);
        textAlign(LEFT);
        text("Légende : ", 20, 32+12*45);
        strokeWeight(1);
        stroke(#ff74d9, 155);
        line(20,48+12*45,250,48+12*45);
        // case
        textAlign(CENTER);
        fill(0,116,217,255);
        text("emotion", 145+1*250, 35+12*45);
        noFill();
        strokeWeight(2);
        stroke(255,0,0,200);
        rect(25+1*250, 11+12*45, 240, 40, 3, 18, 18, 18);
        // line et txt
        stroke(#ff74d9, 155);
        line(275+40,38+12*45,590,38+12*45);
        fill(#ff74d9,255);
        textAlign(LEFT);
        text("Choix précédents", 600, 44+12*45);
        stroke(#ff0000, 155);
        line(275+240,12+12*45,590,8+12*45);
        fill(#ff0000,255);
        textAlign(LEFT);
        text("Votre choix", 600, 14+12*45);
  }
}