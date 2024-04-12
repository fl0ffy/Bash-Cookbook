for n in $( eval vim-cmd vmsvc/getallvms | cut -d" " -f1 | grep -v Vmid ) ; do vim-cmd vmsvc/power.off $n ; done

for n in $( eval <COMMAND> ) ; do <COMMAND> ; done
