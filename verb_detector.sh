#!/bin/bash

#On met des espaces autour de chaque verbe
awk '{print " "$1" "}' verbes/touslesversbeconjugues.txt > verbes/verbesClean.txt;
#On compare les deux fichiers pour n'en ressortir que les verbes présent dans le texte    
fgrep -xf result/clean.txt verbes/verbesClean.txt > result/result_verbe;


#On affiche les 10 derniers verbes qui correspondent à ceux les plus utilisés
head -10 result/result_verbe;
