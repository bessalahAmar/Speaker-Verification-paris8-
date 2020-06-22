# Speaker-Verification-paris8-

steps to run :

1) add wav folder in data directory
2) ./extract-features.sh
3) ./normalization-features.sh
4) ./train-world.sh

* 4. requires .ndx files

# Getting .ndx files to train the models

They can be created with the command:

- bash generate-ndx-files.sh

Their content looks like this:

- mmm f1 f2 f3
- mmm: name of the speaker model to create
- f1, f2, etc: name of the feature files used to create it

# Crédit 
https://alize.univ-avignon.fr
https://www.irisa.fr/metiss/guig/spro/spro-4.0.1/spro_3.html
