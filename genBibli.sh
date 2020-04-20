#!/bin/bash
############# author: Victor FAVREAU #############

    # Préparation des fichiers langues
    ls -l langues/4000*.txt | awk '{print "./pLangue.sh "$9 " > ppLangue "}' | sh;
    rm ppLangue;
