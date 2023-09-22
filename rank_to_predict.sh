perl rankFromList.pl  $1   index  > tmp.txt
python transpose.py tmp.txt
rm tmp.txt
python predict.py Features.newT
