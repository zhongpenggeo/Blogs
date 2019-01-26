#/*************************************************************************
# ****** md_formated.sh
# ************   Introduction     *************	
#	add head information in md file 
# ************      Copyright     *****************
# Writeen by PengZhong, ZJU, Sat Jan 26 15:38:29 2019
# Last modified:	 
# ***********************************************************************
 
#!/bin/bash
 
ALL=`ls *.md`
TM=`date  +"%Y-%m-%d %H:%M:%S"`
# get folder name
DIR=`echo "$PWD"|gawk -F'/' '{print $NF}'`
for NA in $ALL
do
	F_LINE=`gawk 'NR==1 {print}' $NA`
	if [ $F_LINE != '---' ]; then
    	TMP=`echo ${NA%.*}`
    	FI=`echo ${TMP##*/}`
    	sed -i '1i\---' $NA
		sed -i "1i\- $DIR" $NA
		sed -i '1i\categories:' $NA
    	sed -i "1i\date: $TM" $NA
    	sed -i "1i\title: $FI" $NA
    	sed -i '1i\---' $NA
	fi
done

