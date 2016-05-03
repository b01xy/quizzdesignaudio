// On écoute ce qui se passe du coté des controleurs P5

public void controlEvent(ControlEvent theEvent) {


    // Lorsqu'on appuie sur un bouton émotion
  if(theEvent.isController()) { 
    // String controlname = theEvent.controller().getName();
    float controlval = theEvent.controller().getValue();
    float controlid = theEvent.getController().getId();
    int controlvali=int(controlval);
    // on inscrit la valeur dans le tableau à chaque fois que l'on clic sur un bouton
    if (page > 0 && page < MAXPAGES){
      if (controlid > 0){ //on esquive SUIVANT ET ACCUEIL ...
          // on inscrit 1 dans la colonne correspondant au button cliqué après avoir résetté
          for (int h=1;h<4;h++){
              lesstats.setInt(page-1, h, 0);
              theEvent.getController().setColorBackground(OffColor);
              cp5.setColorBackground(OffColor);
              }
          lesstats.setInt(page-1, controlvali, 1);
          theEvent.getController().setColorBackground(OnColor);
        
        }
      }
     }
    

    
    // BTN SUIVANT
    if(theEvent.controller().getName()=="SUIVANT") {
      if(page==0){
         // On charge le fichier et on remplies de 0 les 11 lignes
         lesstats = loadTable("statistiques.csv", "header");
         // INITIALISATION DU TABLEAU
         for (int i=0; i<11; i++){
           lesstats.setInt(i, 0, i+1);
           for (int j=1; j<4; j++){
           //on rempli de 0
             lesstats.setInt(i, j, 0);
           }
         }
        }
      if(page >= 0 && page < 12){
        cp5.getGroup("repl").hide();
        if(page==0){Track0.stop(); Track0.release();}
        if(page==1){Track1.stop(); Track1.release();}
        if(page==2){Track2.stop(); Track2.release();}
        if(page==3){Track3.stop(); Track3.release();}  
        if(page==4){Track4.stop(); Track4.release();}
        if(page==5){Track5.stop(); Track5.release();}
        if(page==6){Track6.stop(); Track6.release();}    
        if(page==7){Track7.stop(); Track7.release();}
        if(page==8){Track8.stop(); Track8.release();}
        if(page==9){Track9.stop(); Track9.release();}    
        if(page==10){Track10.stop(); Track10.release();}
        if(page==11){Track11.stop(); Track11.release();}   
          };
      if(page==11){
         saveTable(lesstats, "statistiques.csv");
         statshow.dostats();
         statshow.doLOG();
         cp5.getGroup("accu").hide();
         cp5.getGroup("repl").hide();
        }
        if(page==12){isPlaying=0;}
     // On fait la boucle 
     if(page>=MAXPAGES){page = 0;}
     else {page = page + 1;}
    }
    // BTN ACCUEIL    
    if(theEvent.controller().getName()=="ACCUEIL") {
        if(page>0 && page<12){
       
            if(page==0){Track0.stop(); Track0.release();}
            if(page==1){Track1.stop(); Track1.release();}
            if(page==2){Track2.stop(); Track2.release();}
            if(page==3){Track3.stop(); Track3.release();}  
            if(page==4){Track4.stop(); Track4.release();}
            if(page==5){Track5.stop(); Track5.release();}
            if(page==6){Track6.stop(); Track6.release();}    
            if(page==7){Track7.stop(); Track7.release();}
            if(page==8){Track8.stop(); Track8.release();}
            if(page==9){Track9.stop(); Track9.release();}    
            if(page==10){Track10.stop(); Track10.release();}
            if(page==11){Track11.stop(); Track11.release();} 
            isPlaying = 0;
            page = 0;
         }    

    }
   if(theEvent.controller().getName()=="Replay") {
     isPlaying = page; 
     cp5.getGroup("repl").hide();
   }
}