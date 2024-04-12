


#Prepends to first line in the file
for n in * ; do sed -i '1i ###################################################' $n ; done

#Prepends to the begining of each line in the file
for n in * ; do sed -e 's/^/# /g' -i  $n ; done

#appends to the end of the file
for n in * ; do echo '###################################################' >> $n  ; done


for n in * ; do sed -i '1i ###################################################' $n ; done ; for n in * ; do sed -e 's/^/# /g' -i  $n ; done ; for n in * ; do echo '###################################################' >> $n  ; done

for n in * ; do echo "" >> $n ; echo '#!/bin/bash' >> $n ; echo "" >> $n ; done
