#!/bin/bash
############# author: Victor FAVREAU #############
# Fichier permettant de récupérer les 1000 premiers mots entouré d'espaces 
# et supprimant les mots de tailles deux, par exemple "de" ou "la".
awk '{print " "$1" "}' $1 | awk 'length > 4' | head -1000 > $1; 
