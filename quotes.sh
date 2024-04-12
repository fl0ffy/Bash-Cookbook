
#!/bin/bash

############################################################################
#
# Author:               Johnathan Bernat
# Date:                 20 Apr 2013
# Description:          Clears the terminal and displays random quote.
# Input parameters:     none
# Sample usage:         ./script
#
#############################################################################

#################################################################
#                                                               #
#                       random response                         #
#                                                               #
#################################################################

num_quotes=10
rand=$[ ( $RANDOM % $num_quotes ) + 1 ]

clear

echo ""
echo '-------------------------------------------------------------------------------'
echo ""

case $rand in
   1)echo "If you wish to make an apple pie from scratch, you must first invent the universe."  | fmt -80
        echo ""
        echo -e '\t\t\t\t\t\t~ Carl Sagan';;
    2) echo "A celibate clergy is an especially good idea, because it tends to suppress any hereditary propensity toward fanaticism."  | fmt -80
        echo ""
        echo -e '\t\t\t\t\t\t~ Carl Sagan';;
    3) echo "The universe seems neither benign nor hostile, merely indifferent."  | fmt -80
        echo ""
        echo -e '\t\t\t\t\t\t~ Carl Sagan';;
    4) echo "The universe is not required to be in perfect harmony with human ambition."  | fmt -80
        echo ""
        echo -e '\t\t\t\t\t\t~ Carl Sagan';;
    5) echo "It is far better to grasp the universe as it really is than to persist in delusion, however satisfying and reassuring."  | fmt -80
        echo ""
        echo -e '\t\t\t\t\t\t~ Carl Sagan';;
    6) echo "But the fact that some geniuses were laughed at does not imply that all who are laughed at are geniuses. They laughed at Columbus, they laughed at Fulton, they laughed at the Wright Brothers. But they also laughed at Bozo the Clown."  | fmt -80
        echo ""
        echo -e '\t\t\t\t\t\t~ Carl Sagan';;
    7) echo "We live in a society exquisitely dependent on science and technology, in which hardly anyone knows anything about science and technology."  | fmt -80
        echo ""
        echo -e '\t\t\t\t\t\t~ Carl Sagan';;
    8) echo "If we long to believe that the stars rise and set for us, that we are the reason there is a Universe, does science do us a disservice in deflating our conceits?"  | fmt -80
        echo ""
        echo -e '\t\t\t\t\t\t~ Carl Sagan';;
    9) echo "Where we have strong emotions, we're liable to fool ourselves."  | fmt -80
        echo ""
        echo -e '\t\t\t\t\t\t~ Carl Sagan';;
    10) echo "Who are we? We find that we live on an insignificant planet of a humdrum star lost in a galaxy tucked away in some forgotten corner of a universe in which there are far more galaxies than people."  | fmt -80
        echo ""
        echo -e '\t\t\t\t\t\t~ Carl Sagan';;
esac

echo ""
echo '-------------------------------------------------------------------------------'
echo ""
