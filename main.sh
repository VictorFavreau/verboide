#!/bin/bash
############# author: Victor FAVREAU #############
if [ "$#" -ge 1 ]
then
	if [ -f $1 ] 
	then
		echo -e "\nLa taille du fichier est de $(wc -c $1 | cut -d " " -f1) octets";
		echo -e "\nLe texte contient $(wc -w $1 | cut -d " " -f1) mots";
		echo -e "\nLe texte contient $(wc -m $1 | cut -d " " -f1) lettres";
		
		./clean.sh $1;
		echo -e "\nLa langue correspondant à votre fichier est :";
		./language_detector.sh $1;
		tail -1 result/resultat.log;


		echo -e "\nLes 20 verbes les plus utilisés dans votre texte sont :";
		./verb_detector.sh $1;
		
		echo -e "\n";
	else
		echo "Main : Erreur : le fichier que vous avez entré n'existe pas !";
	fi
else
	echo "Main : Erreur : vous devez passer le texte à analyser en paramètre.";
fi
