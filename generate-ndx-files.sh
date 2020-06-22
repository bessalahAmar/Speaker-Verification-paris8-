#!/bin/bash

# 1 Make the 'ndx' directory
	mkdir -p ndx

# 2 Generate the trainModel ndx file
	i=1
	echo -n "" > ndx/trainModel.ndx
	for element in $(cat data/data.lst);do
		j=$(printf "%02d" $i)
		echo "spk$j $element" >> ndx/trainModel.ndx
		i=$((i+1))	
	done

# 3 Generate the computetest GMM ndx file
	i=0
	j=0
	#To limit the amount of speaker to get from the list, uncomment the line below and the 'if' in lines 37 & 51, and the 'i' & 'j' incrementation
	#maxElements=10

	echo -n "" > ndx/computetest_gmm_target-seg-tmp.ndx
	VAR=""
	
	#copy all the elements from the first column of the given file
	VAR=$(cut "-d " -f1 "ndx/trainModel.ndx")

	#paste them in a temporary file
	echo "$VAR" >> ndx/computetest_gmm_target-seg-tmp.ndx
	
	echo -n "" > ndx/computetest_gmm_target-seg.ndx
	word=""
	file="ndx/computetest_gmm_target-seg-tmp.ndx"
	while IFS= read line
	do
		word+=" $line"

		#limit the speakers number
		#### <Start>
		#if [[ $j -gt $maxElements ]];then
		#	echo -n $word > ndx/computetest_gmm_target-seg-tmp.ndx
		#break
		#fi
		#j=$((j+1))
		# <end> ####
	done < "$file"

	for element in $(cat data/data.lst);do
		
		echo "$element$word" >> ndx/computetest_gmm_target-seg.ndx
		
		#echo -n "$VAR" >> ndx/computetest_gmm_target-seg.ndx
		#echo "" >> ndx/computetest_gmm_target-seg.ndx
		
		#limit the speakers number
		#### <Start>
		#if [[ $i -gt $maxElements ]];then
		#	break
		#fi
		#i=$((i+1))
		# <end> ####
	done
	
	#remove the temporary file
	rm $file

