############################################################################
#
# Author: Johnathan Bernat
# Date:  19 Aug 2013
# Description: Scripts to solve various problems presented during Amazon interview
#
#############################################################################

#################################################################
# 								#
# 		Amazon Interview scripts 			#
# 								#
#################################################################

# =================================================================
# ==========================Problem 1==============================
# =================================================================
#Find all files ending in .yup and change all instances of apple to pear in each file

#1# find / -name '*.yup' -type f | xargs sed -i 's/apple/pear/g' ; find / -name *.yup -type f | xargs sed -i 's/Apple/Pear/g' ; find / -name *.yup -type f | xargs sed -i 's/APPLE/PEAR/g'
#2# find / -name '*.pup' -type f | xargs sed -i -e 's/apple/pear/g' -e 's/Apple/Pear/g' -e 's/APPLE/PEAR/g'
find / -name '*.pup' -type f | xargs sed -i -e 's/Apple/Pear/g' -e 's/APPLE/PEAR/g' -e 's/apple/pear/gI'

#breakdown
find / -name '*.pup' -type f	 						#finds all files ending in .pup
xargs sed -i -e 's/Apple/Pear/g' -e 's/APPLE/PEAR/g' -e 's/apple/pear/gI'	#replaces various versions of apple with pear in files fed from preceding command

# =================================================================
# ==========================Problem 2==============================
# =================================================================
#count the words in a text file without using the wc command

#1# sed 's/ /\n/g' test | grep -v "^$" | nl | tail -1 | tr -d [:alpha:] | tr -d [:punct:]
sed 's/ /\n/g' test | grep -v "^$" | nl | tail -1 | tr -cd [:digit:]

#breakdown
sed 's/ /\n/g' test 	#replaces single spaces with newline
grep -v "^$" 		#removes all blank lines
nl	 		#numbers each line
tail -1	 		#displays the last line
tr -d [:alpha:]		#removes all letters
tr -d [:punct:]	 	#removes all punctuation
tr -cd [:digit:]	#removes everything that is not a digit

# =================================================================
# ==========================Problem 3==============================
# =================================================================
#find all lines with FAIL in designated logs (backup##.log) and only display the error after FAIL

sed 's/^.*FAIL/FAIL/' backup??.log | grep -v "^$"

#breakdown 

sed 's/^.*FAIL/FAIL/' *		#replaces all lines with "FAIL" from any file in current directory and replaces everything up to "FAIL" with nothing (removes)
grep -v "^$"			#removes any blank lines from output of previous command