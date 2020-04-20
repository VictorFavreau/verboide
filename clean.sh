#!/bin/bash
############# author: Victor FAVREAU #############

if [[ $# != 1 ]]; then
  echo "Nombre d'arguments invalides!";
else
  printf "Le fichier est %s\n" "`file $1`";

  cp $1 fichierUTF8;
  #cette boucle vérifie que le fichier est en UTF-8 et le convertit si besoin
  if [[ `file -b --mime-encoding $1` != "UTF-8" ]]; then
    #echo "fichier non UTF-8";
    awk '{print $0}' $1 | iconv -f `file -b --mime-encoding $1` -t UTF-8 $1 > fichierUTF8;
  fi

  echo -e "\nLes 20 mots les plus utilisés dans votre texte sont:\n";
  #On dégage tout les symboles inutiles (cf commandesSed)
  sed -f commandesSed fichierUTF8 > tmp;

  #Permet de mettre les espaces à la ligne
  tr " " "\012" < tmp > fichierUTF8;

  #On trie le fichier
  sort fichierUTF8 > tmp;

  awk 'length > 4' tmp > fichierUTF8;

  #On compte le nombre d'occurences
  uniq -c fichierUTF8 > tmp;

  #On retrie en fonction de nombre maximum d'occurences
  sort -g tmp > tmp2;

  #Retire  numéro d'occurence
  awk '{print $2}' tmp2 > tmp;
  
  #Suppression des mots dont la taille est trop petite
  awk 'length > 7' tmp > tmp2;

  #On entoure chaques mots d'espaces
  awk '{print " "$0" "}' tmp2 > result/clean.txt;

  #Affichage dans le terminal des 45 derniers mots
  tail -45 result/clean.txt;

  #Suppression des fichiers inutiles
  rm fichierUTF8;
  rm tmp;
  rm tmp2;

  echo -e "\nTraitement du fichier $1 terminé !";
fi
