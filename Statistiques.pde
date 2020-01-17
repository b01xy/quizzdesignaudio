class Statistiques {
Table contenusP = loadTable(defpagescsv, "header");
//Table statistiquesALL = loadTable(statistiquesALLcsv, "header");
//Table statistiquesLOG = loadTable(statistiquesLOGcsv, "header"); 
Table statistiquesALL;
Table statistiquesLOG; 


Statistiques(){
//loadMyTable(statistiquesALL, statistiquesALLcsv, "header");
//loadMyTable(statistiquesLOG, statistiquesLOGcsv, "header");
}


void dostats(){
  statistiquesALL = loadTable(statistiquesALLcsv, "header");
  for (int i=0;i<11;i++) {
      for (int k=1;k<4;k++){
         int stataccum = statistiquesALL.getInt(i,k)+lesstats.getInt(i,k);
         //println("stataccum  " + stataccum);
         //println("statALL  " + statistiquesALL.getInt(i,k));
         //println("lesstats " + lesstats.getInt(i,k));
         statistiquesALL.setInt(i,k,stataccum);
       }
    }
    saveTable(statistiquesALL, statistiquesALLcsv);    
    saveMyTable(statistiquesALL, statistiquesALLcsv);
    //saveTable(statistiquesALL, "/storage/emulated/0/Download/statistiquesALLcsv");
}

void doLOG(){
      statistiquesLOG = loadTable(statistiquesLOGcsv, "header");
      int nbretotallignes = statistiquesLOG.getRowCount();
      for (int i=0;i<11;i++) {
        statistiquesLOG.addRow();
        for (int k=0;k<4;k++){
         int lastatfraiche = lesstats.getInt(i,k);
         statistiquesLOG.setInt(i+nbretotallignes,k,lastatfraiche);
         }
       }
      saveTable(statistiquesLOG, statistiquesLOGcsv);
      saveMyTable(statistiquesLOG, statistiquesLOGcsv);
      //saveTable(statistiquesLOG, "/storage/emulated/0/Download/statistiquesLOGcsv");
      println("statistiquesLOG" + sketchPath);
}


void display() {
//    textSize(0100);
//    Table contenusP = loadTable(sketchPath(defpagescsv))", "header");
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
          float barrevie = percent*420;
          noStroke();
          float p = counttour * barrevie;

          // la boucle pour faire progression stats
          if (p<barrevie){
            rect(80+j*440, 21+r*80, p, 60, 3, 18, 18, 18);
            }
          else {rect(80+j*440, 21+r*80, barrevie, 60, 3, 18, 18, 18);}
          }
    }
    // Affichage des textes
    for (int i=0;i<11;i++) {
      for (int j=0;j<4;j++){
        textSize(42);
        if (j==0){
          textAlign(LEFT);
          fill(255,45,90,255);
          //text(contenusP.getString(i, j), 20+j*250, 42+i*45);
          text(contenusP.getString(i, j), 30+j*400, 62+i*80);
          strokeWeight(1);
          stroke(#ff74d9, 155);
          line(20,88+i*80,450,88+i*80);
          }
        else {
          textAlign(CENTER);
          fill(0,116,217,255);
          //text(contenusP.getString(i, j), 145+j*250, 45+i*45);
          text(contenusP.getString(i, j), 300+j*440, 65+i*80);
          noFill();
          strokeWeight(2);
          // La boucle pour tester les derniers choix à surligner en rouge
          if (lesstats.getInt(i,j)==1){stroke(255,0,0,255);}
          else {stroke(#ff74d9, 200);}
          rect(80+j*440, 21+i*80, 420, 60, 3, 18, 18, 18);


          }
       }
    }
    // Légende

        textAlign(LEFT);
        fill(#ff74d9, 150);
        noStroke();
        rect(450, 1000, 0.33*450, 80, 3, 18, 18, 18);
        fill(255,45,90,255);
        textAlign(LEFT);
        text("Légende : ", 100, 1050);
        strokeWeight(1);
        stroke(#ff74d9, 155);
        line(100,1088,350,1088);
        // case
        textAlign(CENTER);
        fill(0,116,217,255);
        text("émotion", 800, 1055);
        noFill();
        strokeWeight(2);
        stroke(255,0,0,200);
        rect(450, 1000, 650, 80, 3, 18, 18, 18);
        // line et txt
        stroke(#ff74d9, 155);
        line(500,1040,690,1160);
        fill(#ff74d9,255);
        textAlign(LEFT);
        text("Choix précédents", 700, 1180);
        stroke(#ff0000, 155);
        line(1100,1040,1160,1080);
        fill(#ff0000,255);
        textAlign(LEFT);
        text("Votre choix", 1170, 1100);
  }
}
