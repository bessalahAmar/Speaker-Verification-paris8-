ls data/wav/clients/*.wav | sed 's-data/wav/clients/-- ; s-\.wav--' > data/data.lst
#mkdir -p data/prm/clients

for i in `cat data/data.lst`;do
   COMMAND_LINE="sfbcep -m -k 0.97 -p19 -n 24 -r 22 -e -D -A data/wav/clients/$i.wav data/prm/$i.tmp.prm"
   echo $COMMAND_LINE
   $COMMAND_LINE
done 

#original command: sfbcep -f 16000 -p 14 -r 24 -e -Z -R -L 400 -D -A
#new command: sfbcep -p 19 -r 22 -e -Z -R -L 400 -D -A -F wave

# -m -k 0.97 -p19 -n 24 -r 22 -e -D -A
# -m -k 0.97 -p19 -n 20 -r 22 -e -D -A

# -m -n 20

#
