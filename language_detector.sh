############# author: Victor FAVREAU #############

#Préparation d'un fichier temporaire listant tout les fichiers bibliotheque
ls -l langues/b4000*.txt | awk '{print "fgrep -cf "$9" ./result/clean.txt;"}' | sh > listResult;

#récupération de la liste générée
ls -l langues/b4000*.txt | awk '{print $9}' > listB;

#On le sordonne et on écrit le résultat dans le fichier resultat/resultat.log
paste -d " " listB listResult | sort -g -k2 | tail -1 > result/resultat.log;

rm listResult;
rm listB;
