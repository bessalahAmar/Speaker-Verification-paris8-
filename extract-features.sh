ls data/wav/clients/*.wav | sed 's-data/wav/clients/-- ; s-\.wav--' > data/data.lst
mkdir -p data/prm/clients

for i in `cat data/data.lst`;do
   COMMAND_LINE="sfbcep -f 16000 -p 14 -r 24 -e -Z -R -L 400 -D -A data/wav/clients/$i.wav data/prm/$i.tmp.prm"
   echo $COMMAND_LINE
   $COMMAND_LINE
done 

# -m -k 0.97 -p19 -n 24 -r 22 -e -D -A
# -m -k 0.97 -p19 -n 20 -r 22 -e -D -A

# -m -n 20

#
