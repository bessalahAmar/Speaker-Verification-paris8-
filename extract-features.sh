ls data/wav/clients/*.wav | sed 's-data/wav/clients/-- ; s-\.wav--' > data/liste_clients.lst
mkdir -p data/prm/clients

for i in `cat data/liste_clients.lst`;do
   COMMAND_LINE="sfbcep -m -n 20 data/wav/clients/$i.wav data/prm/clients/$i.tmp.prm"
   echo $COMMAND_LINE
   $COMMAND_LINE
done 
