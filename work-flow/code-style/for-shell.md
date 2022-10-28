# basic principle
shell scripts are always used to do some simple calulatetion and plotting.  
so, some information is needed:  
- Introduction: you need to add the description.
- Useage: important, and two ways: use if loop or just writing it, first is recommended. tools needed should be asked.
- reference(optional): no reference at most time because of simple use 

# Example
```shell
###########################################################
#######   Introduction 
# this code is used to 
######### reference 
#
######## copyright 
# written by PengZhong, ZJU, date
# Last modified: 2018-09-02 21:45:56

if [ $# -ne 1 ] && [ $# -ne 2 ] ;then
	echo ' - Usage: gmt'
	echo ''
	echo ' - Example: '
	echo ''
	echo ' - Dependences: gawk, gmt, bc'
	exit
fi # script info.

```
