#!/bin/bash

# 1 Make the 'ndx' directory
	mkdir -p ndx

# 2 Split the data files in 2: some data used for the training, and the rest used for the tests
	echo -n "" > data/trainList.lst
	echo -n "" > data/testList.lst
	i=1
	for element in $(cat data/data.lst);do
		# if the file from the list is even, use it for training
		if (( $i % 2 ));then
			echo "$element" >> data/trainList.lst
		# else, keep it for the tests
		else
			echo "$element" >> data/testList.lst
		fi
		i=$((i+1))	
	done

# 3 Generate the trainModel ndx file (select the files where the speaker says numbers)
	i=1
	tmp=""
	k=0
	echo -n "" > ndx/trainModel.ndx
	for element in $(cat data/trainList.lst);do
		tmp+=" $element"
		if [[ $k -ge 4 ]];then
			#j=$(printf "%02d" $i)
			j=$(echo $element | cut -c1-3)
			echo "spk$j$tmp" >> ndx/trainModel.ndx
			i=$((i+1))
			tmp=""
			k=-1
		fi
		k=$((k+1))	
	done

# 4 Generate the computetest GMM ndx file. It contains the name of the test files in the first column, followed by the names of the models that will be compared to them
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

	for element in $(cat data/testList.lst);do
		
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

