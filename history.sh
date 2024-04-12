# History

# /home/user/*.history


# ------------------------------------------------------------

# If your shell honors $HISTFILE you can create a history file anywhere you want during login 
# We have ours like this

# Code:
# /home/[somewhere]/.ihist/.sh_hist_jmcnama

# All of the interactive users' histories are there in the same .ihist directory. We set HISTSIZE=1000 to keep track for a while. This allows an easy scan of history to find out "whodunit" if there is a security problem.

# This is a SOX requirement - be able to look up all interactives users commands for the past 30 days. We have accounting turned on too.