
#generate the keys
ssh-keygen -t rsa  #other options can be added

#distribute the keys
ssh-copy-id <hostname>

#test
ssh <hostname>